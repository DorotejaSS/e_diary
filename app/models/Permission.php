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
        $inserted_permission_id = $conn->insert_id;

        //todo:
        // 1. pokupi IDjeve svih rola (role model get all)
        // 2. za svaki role_id napravi insert u role_permission role_id, $inserted_permission_id

        return $this->result;
    }

    public function allowedPermissionsForRole($id)
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

    public function selectPermissions($id)
    {
        require('./app/db.php');

        $sql = 'SELECT p.id, p.title, rp.access
        FROM role_permissions as rp
        right join  permissions as p 
        on rp.role_id = '.$id.' and rp.permission_id = p.id';

        $this->result = $conn->query($sql);
        $permissions_for_role = [];
        while ($row = $this->result->fetch_assoc()) {
            $permissions_for_role[] = $row;    
        }
        return $permissions_for_role;
    }

    
    public function updatePermissions($role_id, $allowed_permissions, $forbidden_permissions)
    {
        $allowed_permissions_sql_prep = array_map(function($permission_id){
            return array($permission_id, 1);
        }, $allowed_permissions);
        
        $forbidden_permissions_sql_prep = array_map(function($permission_id){
            return array($permission_id, 0);
        }, $forbidden_permissions);

        //ids permisija, dozvoljene imaju access = 1 , a nedozvoljene = 0
        $permissions_map = array_merge($allowed_permissions_sql_prep, $forbidden_permissions_sql_prep);

        require('./app/db.php');
        foreach ($permissions_map as $permission_role_access_pair) {
            $sql = 'update role_permissions set access = '.$permission_role_access_pair[1].'
                    where role_id = '.$role_id.' and permission_id = '. $permission_role_access_pair[0];
            $this->result = $conn->query($sql);
        }
    }


}
