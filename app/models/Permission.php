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

    public function permissionsForRole($id)
    {
        require('./app/db.php');
        $sql = 'SELECT p.title 
                FROM role_permissions as rp
                inner join  permissions as p 
                on rp.role_id = '.$id.' and rp.access = 1 and rp.permission_id = p.id';

        $this->result = $conn->query($sql);
        $permissions = [];
        while ($row = $this->result->fetch_assoc()) {
            $permissions[] = $row;    
        }
        return $permissions;
    }

    public function editPermissions($id)
    {
        require('./app/db.php');
        $sql = 'SELECT p.title, rp.access
        FROM role_permissions as rp
        inner join  permissions as p 
        on rp.role_id = '.$id.' and rp.permission_id = p.id';

        $this->result = $conn->query($sql);
        $permissions_for_role = [];
        while ($row = $this->result->fetch_assoc()) {
            $permissions_for_role[] = $row;    
        }
        return $permissions_for_role;
    }
}