<?php

class Subject extends BaseModel
{
    public function lecturerSubject($table1, $table2, $role_id)
    {
        require('./app/db.php');
        //table 1 subjects
        //table2 users
        //role id 3

        //select users.id, users.first_name, users.last_name, subjects.* 
        //from subjects right join users on role_id = 3

        $sql = $conn->prepare('select '.$table2.'.first_name, '.$table2.'.last_name, 
                                '.$table1.'.title, '.$table1.'.lecturer_id 
                                from '.$table1.' right join '.$table2.' on role_id = '.$role_id.'');
                                var_dump($sql);
        $sql->execute();
        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }
}