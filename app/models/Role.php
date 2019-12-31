<?php

class Role extends BaseModel
{
    public function edit($id)
    {
        require('./app/db.php');

        $sql = 'update roles set 
        title = "'.$_POST['role'].'" where id = "'.$id.'"';
    
        $this->result = $conn->query($sql);
        return $this->result;
    }

    public function delete($id)
    {
        require('./app/db.php');
       
        $sql = 'delete from roles where id = "'.$id.'"';
        $this->result = $conn->query($sql);
    }

    public function addRole($role)
    {
        require('./app/db.php');
        $sql = "insert into roles (title) values ('$role')";

        $this->result = $conn->query($sql);
        return $this->result;
    }
}