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

        $sql = $conn->prepare('SELECT student_group.id, student_group.year_id, student_group.subgroup_id FROM student_group ORDER BY student_group.year_id ASC');

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

        $sql = $conn->prepare('SELECT schedules.subject_id, schedules.position, subjects.title 
                               FROM schedules INNER JOIN subjects ON schedules.subject_id = subjects.id 
                               WHERE schedules.student_group_id = :id');

        $sql->execute(array(':id' => $id));

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getData($subject_data, $position_data)
    {
        function combine($keys, $values)
        {
            foreach ($keys as $k)
            {
                array_push()
            }
        }
        $data = array_push($subject_data, $position_data);
        var_dump($subject_data);
        var_dump($position_data);
        var_dump($data);
    }
}
