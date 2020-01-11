<?php

class Subject extends BaseModel
{
    public function lecturerSubject()
    {
        require('./app/db.php');

        $sql = $conn->prepare('select users.first_name, users.last_name, 
                                users.role_id, subjects.id, subjects.lecturer_id, subjects.title 
                                from subjects inner join users on subjects.lecturer_id = users.id');
                                
        $sql->execute();
        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function update($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('update subjects set title = "'.$_POST['subject'].'" where lecturer_id = "'.$id.'"');
        $sql->execute();
    }

    public function addNewSubject($title, $lecturer_id)
    {
        require('./app/db.php');
        
        $sql = $conn->prepare('insert into subjects (title, lecturer_id) values (? , ?)');
        $sql->execute(array($title, $lecturer_id));
        return;
    
    }

}