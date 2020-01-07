<?php

class Role extends BaseModel
{

    public function edit($id)
    {

        require('./app/db.php');

        $sql = $connn->prepare('update roles set title = "'.$_POST['role'].'" where id = "'.$id.'"');
        $sql->execute();
        
        // $sql = 'update roles set 
        // title = "'.$_POST['role'].'" where id = "'.$id.'"';
        // $this->result = $conn->query($sql);
        // return $this->result;
    }

    public function delete($id)
    {
        require('./app/db.php');
       
        $sql = $connn->prepare('delete from roles where id = ?');
        $sql->execute(array($id));

        // $sql = 'delete from roles where id = "'.$id.'"';
        // $this->result = $conn->query($sql);
    }

    public function addRole($role)
    {
        require('./app/db.php');

        $sql = $connn->prepare('insert into roles (title) values (?)');
        $sql->execute(array($role));

        // $sql = "insert into roles (title) values ('$role')";
        // $this->result = $conn->query($sql);
        // return $this->result;
    }
}