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
        
        if (isset($_SESSION['user_data']) && !empty($_SESSION['user_data'])) {
            $this->parent_id = $_SESSION['user_data']['id'];

            $this->child_data = $this->usersChild($this->parent_id);

            if (isset($this->request->url_parts[1]))
            {
                $this->getGrades($this->request->url_parts[1]);
            }
        }
    }

    public function getGrades($child_id)
    {
        require('./app/db.php');

        $sql = $conn->prepare ('SELECT students.student_group_id FROM students WHERE students.id = :id');
        $sql->execute (array(':id' => $child_id));

        $child_sg_id = $sql->fetch(PDO::FETCH_ASSOC);

        $sql = $conn->prepare ('SELECT DISTINCT subjects.title 
                                FROM subjects INNER JOIN schedules ON subjects.id = schedules.subject_id 
                                WHERE schedules.student_group_id = :sg_id');
        $sql->execute (array(':sg_id' => $child_sg_id['student_group_id']));

        $this->grades_data['subjects'] = $sql->fetchAll(PDO::FETCH_ASSOC);

        $sql = $conn->prepare ('SELECT DISTINCT subjects.title, grades.closing, grades.grade 
                                FROM subjects INNER JOIN schedules ON subjects.id = schedules.subject_id INNER JOIN grades ON subjects.lecturer_id = grades.lecturer_id 
                                WHERE schedules.student_group_id = :sg_id AND grades.student_id = :id');
        $sql->execute (array(':sg_id' => $child_sg_id['student_group_id'], ':id' => $child_id));

        $this->grades_data['grades'] = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function parentStudentCollation($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select u.id, u.first_name, u.last_name, u.email, u.last_login_at
                                from users as u 
                                join students as s 
                                where s.parent_id = u.id and s.id = '.$id.'');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }
}