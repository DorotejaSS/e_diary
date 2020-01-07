<?php

class Permission extends BaseModel
{

    public function edit($id)
    {
        require('./app/db.php');

        $sql = $connn->prepare('update permissions set title = "'.$_POST['permission'].'" where id = "'.$id.'"');
        $sql->execute();

        // $sql = 'update permissions set 
        // title = "'.$_POST['permission'].'" where id = "'.$id.'"';
        // $this->result = $conn->query($sql);
        // return $this->result;
    }

    public function delete($id)
    {
        require('./app/db.php');
       
        $sql = $connn->prepare('delete from permissions where id = ?');
        $sql->execute(array($id));

        // $sql = 'delete from permissions where id = "'.$id.'"';
        // $this->result = $conn->query($sql);
    }

    public function addPermission($permission)
    {
        require('./app/db.php');
        $sql = $connn->prepare('insert into permissions (title) values (?)');
        $sql->execute(array($permission));
        $inserted_permission_id = $connn->lastInsertId();
        
        //todo:
        // 1. pokupi IDjeve svih rola (role model get all)
        // 2. za svaki role_id napravi insert u role_permission role_id, $inserted_permission_id


        // $sql = "insert into permissions (title) values ('$permission')";
        // $this->result = $conn->query($sql);
        // $inserted_permission_id = $conn->insert_id;
        // return $this->result;
    }


    public function selectPermissions($id)
    {
        require('./app/db.php');

        $sql = $connn->prepare('select p.id, p.title, rp.access
                                from role_permissions as rp
                                right join  permissions as p 
                                on rp.role_id = '.$id.' and rp.permission_id = p.id');
        $sql->execute();
        $permissions_for_role = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $permissions_for_role[] = $row;
        }
        return $permissions_for_role;


        // $sql = 'SELECT p.id, p.title, rp.access
        // FROM role_permissions as rp
        // right join  permissions as p 
        // on rp.role_id = '.$id.' and rp.permission_id = p.id';
        // $this->result = $conn->query($sql);
        // $permissions_for_role = [];
        // while ($row = $this->result->fetch_assoc()) {
        //     $permissions_for_role[] = $row;    
        // }
        // return $permissions_for_role;
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
            $sql = $connn->prepare('update role_permissions set access = '.$permission_role_access_pair[1].'
                    where role_id = '.$role_id.' and permission_id = '. $permission_role_access_pair[0]);
            $sql->execute();
        }
    }


}
