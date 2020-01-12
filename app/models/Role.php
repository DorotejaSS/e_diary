<?php

class Role extends BaseModel
{

    public function edit($id)
    {

        require('./app/db.php');

        $sql = $conn->prepare('update roles set title = "'.$_POST['role'].'" where id = "'.$id.'"');
        $sql->execute();
    }

    public function addRole($role)
    {
        require('./app/db.php');

        $sql = $conn->prepare('insert into roles (title) values (?)');
        $sql->execute(array($role));
    }
}