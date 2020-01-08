<?php

class Permission extends BaseModel
{

    public function edit($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('update permissions set title = "'.$_POST['permission'].'" where id = "'.$id.'"');
        $sql->execute();
    }

    public function delete($id)
    {
        require('./app/db.php');
       
        $sql = $conn->prepare('delete from permissions where id = ?');
        $sql->execute(array($id));
    }

    public function addPermission($permission)
    {
        require('./app/db.php');
        $sql = $conn->prepare('insert into permissions (title) values (?)');
        $sql->execute(array($permission));
        $inserted_permission_id = $conn->lastInsertId();
        return $inserted_permission_id;
        
        //todo:
        // 1. pokupi IDjeve svih rola (role model get all)
        // 2. za svaki role_id napravi insert u role_permission role_id, $inserted_permission_id
    }

    public function updateRolePermissions($inserted_permission_id, $role_ids)
    {
        require('./app/db.php');
        foreach ($role_ids as $role_id) {
            var_dump($role_id);
            $sql = $conn->prepare('insert into role_permissions (permission_id, role_id) values (?, ?)');
            $sql->execute(array($inserted_permission_id, $role_id));
        }
    }

    public function asignRolePermission($role_ids, $inserted_permission_id)
    {
        require('./app/db.php');

        foreach($role_ids as $role_id) {
            $sql = $conn->prepare('update role_permissions 
                                    set role_permissions.access = 1
                                    where
                                    role_id = '.$role_id.' and permission_id = '.$inserted_permission_id);
            $sql->execute();
        }
    }


    public function selectPermissions($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select p.id, p.title, rp.access
                                from role_permissions as rp
                                right join  permissions as p 
                                on rp.role_id = '.$id.' and rp.permission_id = p.id');
        $sql->execute();
        $permissions_for_role = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
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
            $sql = $conn->prepare('update role_permissions set access = '.$permission_role_access_pair[1].'
                    where role_id = '.$role_id.' and permission_id = '. $permission_role_access_pair[0]);
            $sql->execute();
        }
    }


}
