<?php

class BaseModel
{

    protected $request;

    public function __construct($request)
    {
        $this->request = $request;
        var_dump($this->request); die;
    }

    public function showAll($table)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select * from '.$table.'');
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

    public function getByRoleId($table, $role_id)
    {        
        require('./app/db.php');

        $sql = $conn->prepare('select * from '.$table. ' where role_id ='.$role_id.'');
        
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }





}