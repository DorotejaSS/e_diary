<?php

class Parents extends BaseModel
{
    private $parent_id;
    public $child_data = array();
    public $grades_data = array();

    public function __construct()
    {
        if (isset($_SESSION['user_data']))
        {
            $this->parent_id = $_SESSION['user_data']['id'];
            $this->getChild();
            $this->getGrades();
        }
        var_dump($_REQUEST);
    }

    public function getChild()
    {
        require('./app/db.php');

        $sql = $connn->prepare('SELECT students.id, students.first_name, students.last_name 
                                FROM students INNER JOIN parent_student ON students.id = parent_student.student_id 
                                WHERE parent_student.parent_id = :id');

        $sql->execute (array(':id' => $this->parent_id));

        $this->child_data = $sql->fetchAll();
    }

    public function getGrades($child_id)
    {
        require('./app/db.php');

        $sql = $connn->prepare ('   SELECT grades.grade, grades.created_at, grades.semestar, grades.closing, users.first_name, users.last_name 
                                    FROM grades INNER JOIN users ON grades.lecturer_id = users.id  
                                    WHERE grades.student_id = :id');

        $sql->execute (array(':id' => $child_id));

        $this->grades_data = $sql->fetchAll();
        
        var_dump($this->grades_data);
    }
}