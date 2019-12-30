<?php

class RolePermission extends BaseModel
{
    public function __construct()
    {

    }

    public function addRole($role)
    {
        require('./app/db.php');
        $sql = "insert into roles (title) values ('$role')";

        $this->result = $conn->query($sql);
        return $this->result;
    }

    public function deleteRole()
    {
        
    }
}