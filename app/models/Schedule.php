<?php

class Schedule extends BaseModel
{
    public $result;

    public function __construct()
    {
       
    }

    public function getSubGroup()
    {
        require('./app/db.php');

        $sql = $conn->prepare('SELECT student_group.id, student_group.year_id, student_group.subgroup_id FROM student_group ORDER BY student_group.id ASC');

        $sql->execute ();

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);

        //var_dump($this->result);

        //echo json_encode($result, 256);
    }
}
