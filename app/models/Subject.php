<?php

class Subject extends BaseModel
{
    public function lecturerSubject()
    {
        require('./app/db.php');
        //table 1 subjects
        //table2 users
        //role id 3

        //select users.id, users.first_name, users.last_name, subjects.* 
        //from subjects right join users on role_id = 3

        $sql = $conn->prepare('select users.first_name, users.last_name, 
                                users.title, .subjects.lecturer_id 
                                from subjects inner join users on subject.lecturer_id = users.id');
                                var_dump($sql);
        $sql->execute();
        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }
}