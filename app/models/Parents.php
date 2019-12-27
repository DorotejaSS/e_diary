<?php

class Parents extends BaseModel
{
    private $parent_id;
    private $child_id;
    private $result;
    private $grades_data;

    public function __construct()
    {
        if (isset($_SESSION['user_data']))
        {
            $this->parent_id = $_SESSION['user_data']['id'];
            $this->getChild();
        }
    }

    public function getChild()
    {
        require('./app/db.php');

        $sql = 'SELECT parent_student.student_id FROM parent_student WHERE parent_student.parent_id = ' . $this->parent_id ;

        $this->result = $conn->query($sql);
            
        $result = $this->result->fetch_assoc();

        $this->child_id = $result['student_id'];
    }

    public function getGrades()
    {
        require('./app/db.php');

        $sql = '
        SELECT grades.grade, grades.created_at, grades.semestar, grades.closing, users.first_name, users.last_name 
        FROM grades INNER JOIN users ON grades.lecturer_id = users.id 
        WHERE grades.student_id = ' . $this->child_id ;

        $this->result = $conn->query($sql);
            
        $this->grades_data = $this->result->fetch_all();

        var_dump($this->grades_data);
    }
}