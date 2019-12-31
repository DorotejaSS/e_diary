<?php

class Permission extends BaseModel
{
    public function edit($id)
    {
        require('./app/db.php');

        $sql = 'update permissions set 
        title = "'.$_POST['permission'].'" where id = "'.$id.'"';
    
        $this->result = $conn->query($sql);
        return $this->result;
    }

    public function delete($id)
    {
        require('./app/db.php');
       
        $sql = 'delete from permissions where id = "'.$id.'"';
        $this->result = $conn->query($sql);
    }

    public function addPermission($permission)
    {
        require('./app/db.php');
        $sql = "insert into permissions (title) values ('$permission')";

        $this->result = $conn->query($sql);
        return $this->result;
    }
}