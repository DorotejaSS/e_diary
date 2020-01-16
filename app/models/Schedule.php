<?php

class Schedule extends BaseModel
{
    public $result;

    public function __construct()
    {
       
    }

    public function fillSelect()
    {
        require('./app/db.php');

        $sql = $conn->prepare('SELECT student_group.id, student_group.year_id, student_group.subgroup_id 
                               FROM student_group 
                               ORDER BY student_group.year_id ASC');

        $sql->execute();

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function fillSubjects()
    {
        require('./app/db.php');

        $sql = $conn->prepare('SELECT subjects.id, subjects.title, users.first_name, users.last_name 
                               FROM subjects INNER JOIN users ON subjects.lecturer_id = users.id 
                               ORDER BY subjects.title ASC');

        $sql->execute();

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getSchedule($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('SELECT schedules.subject_id, schedules.position, subjects.title, users.first_name, users.last_name
                               FROM subjects INNER JOIN schedules ON subjects.id = schedules.subject_id  INNER JOIN users ON subjects.lecturer_id = users.id
                               WHERE schedules.student_group_id = :id');

        $sql->execute(array(':id' => $id));

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function saveData($subject_data, $position_data, $id)
    {
        require('./app/db.php');

        if (count($subject_data) === count($position_data))
        {
            $sql = $conn->prepare('SELECT * FROM schedules 
                                   WHERE schedules.student_group_id = :id');
            
            $sql->execute(array(':id' => $id));

            $count = $sql->rowCount();

            if ($count ==0)
            {
                $sql = $conn->prepare('INSERT INTO schedules (student_group_id, subject_id, position, semestar_id) 
                                       VALUES (:sg_id, :s_id, :pos, 1)');
            
                for ($i = 0; $i < count($subject_data); $i++)
                {
                    if ($subject_data[$i] != 0)
                    {
                        $sql->execute(array(':sg_id' => $id, ':s_id' => $subject_data[$i], ':pos' => $position_data[$i]));
                    }
                }
                
            }
            else
            {
                $sql = $conn->prepare('DELETE FROM schedules 
                                       WHERE student_group_id = :sg_id');

                $sql->execute(array(':sg_id' => $id));

                $sql = $conn->prepare('INSERT INTO schedules (student_group_id, subject_id, position, semestar_id) 
                                       VALUES (:sg_id, :s_id, :pos, 1)');
            
                for ($i = 0; $i < count($subject_data); $i++)
                {
                    if ($subject_data[$i] != 0)
                    {
                        $sql->execute(array(':sg_id' => $id, ':s_id' => $subject_data[$i], ':pos' => $position_data[$i]));
                    }
                }
            }
        }
    }
}
