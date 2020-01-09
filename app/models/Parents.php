<?php

class Parents extends BaseModel
{
    public $request;
    private $parent_id;
    public $child_data = array();
    public $grades_data = array();

    public function __construct($request)
    {
        $this->request = $request;
        if (isset($_SESSION['user_data']))
        {
            $this->parent_id = $_SESSION['user_data']['id'];
            $this->getChild();
            $this->getGrades($this->request->url_parts[1]);
        }
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

        $sql = $connn->prepare ('SELECT grades.lecturer_id, grades.grade, grades.closing, users.first_name, users.last_name, subjects.title 
                                 FROM grades INNER JOIN users ON grades.lecturer_id = users.id INNER JOIN subjects ON grades.lecturer_id = subjects.lecturer_id
                                 WHERE grades.student_id = :id');

        $sql->execute (array(':id' => $child_id));

        //$result = $sql->fetchAll(PDO::FETCH_ASSOC);

        $this->grades_data = $sql->fetchAll(PDO::FETCH_ASSOC);
    }
}