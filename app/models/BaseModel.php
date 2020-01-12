<?php

class BaseModel
{

    protected $request;

    public function __construct()
    {
        // $this->request = $request;
        // var_dump($this->request); die;
    }

    public function showAll($table)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select *  from '.$table.'');
        $sql->execute();

        $results = [];
        while ($row = $sql->fetchAll()) {
            $results = $row;
        }
        return $results;
    }

     public function distinctShowAll($table)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select distinct title from '.$table.'');
        $sql->execute();

        $results = [];
        while ($row = $sql->fetchAll()) {
            $results = $row;
        }
        return $results;
    }
 
    public function getOne($table, $id)
    {        
        require('./app/db.php');

        $sql = $conn->prepare('select * from '.$table. ' where id ='.$id.'');
        
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getByRoleId($id)
    {        
        require('./app/db.php');

        $sql = $conn->prepare('select subjects.title, users.first_name, users.last_name from subjects 
                                join users where users.role_id = 3 and users.id = '.$id.' and subjects.lecturer_id = users.id');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getUsersByRoleId($role_id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select * from users where role_id = '.$role_id.'');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function edit($table, $content, $id)
    {
        require('./app/db.php');
        $sql = $conn->prepare('update '.$table.' set title = "'.$content.'" where id = "'.$id.'"');
        
        $sql->execute();
    }

    public function delete($table, $id)
    {
        require('./app/db.php');
       
        $sql = $conn->prepare('delete from '.$table.' where id = ?');
        $sql->execute(array($id));
    }





}