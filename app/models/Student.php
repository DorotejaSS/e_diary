<?php

class Student extends BaseModel
{
    public function __construct($request)
    {
        $this->request = $request;
    }

    public function add($student_group_id)
    {
        $first_name = $this->request->post_params['first_name'] ?? array();
        $last_name = $this->request->post_params['last_name'] ?? array();
        $date_of_birth = $this->request->post_params['date_of_birth'] ?? array();
        $social_id = $this->request->post_params['social_id'] ?? array();
        $parent_id = $this->request->post_params['parent'] ?? array();

        foreach($student_group_id as $st_group_id) {
            $sg_id = $st_group_id['id'];
        }
        require('./app/db.php');
    
        $sql = $conn->prepare('insert into students(first_name, last_name, date_of_birth, social_id, student_group_id, parent_id)
                                values("'.$first_name.'", "'.$last_name.'", "'.$date_of_birth.'", "'.$social_id.'", "'.$sg_id.'", "'.$parent_id.'")');
        $sql->execute();
    }

    public function update($id)
    {
        $first_name = $this->request->post_params['first_name'];
        $last_name = $this->request->post_params['last_name'];
        $date_of_birth = $this->request->post_params['date_of_birth'];
        $social_id = $this->request->post_params['social_id'];
        $created_at = $this->request->post_params['created_at'];
        $updated_at = $this->request->post_params['updated_at'];
        
        require('./app/db.php');

        $sql = $conn->prepare('update students set 
                                first_name = "'.$first_name.'",
                                last_name = "'.$last_name.'",
                                date_of_birth = "'.$date_of_birth.'",
                                social_id = "'.$social_id.'",
                                created_at = "'.$created_at.'",
                                updated_at = "'.$updated_at.'"
                                WHERE id = "'.$id.'"');
        $sql->execute();
    }

    public function studentGroupsForView()
    {
        require('./app/db.php');

        $sql = $conn->prepare('select distinct id, year_id, subgroup_id from student_group');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function subgroups()
    {
         require('./app/db.php');

         $sql = "select id, title from subgroups";

        try {
                $stmt = $conn->prepare($sql);
                $stmt->execute();
            }
        catch (PDOException $e)
            {
                echo $e->getMessage();
                die();
            }
        
        $data = [];
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function years()
    {
         require('./app/db.php');

         $sql = "select id, title from years";

        try {
                $stmt = $conn->prepare($sql);
                $stmt->execute();
            }
        catch (PDOException $e)
            {
                echo $e->getMessage();
                die();
            }
        
        $data = [];
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function alignToStudentGroup($year_id, $subgroup_id) 
    {
        require('./app/db.php');

        $sql = $conn->query('select id from student_group where year_id = '.$year_id.' and subgroup_id = '.$subgroup_id.'');
        $sql->execute();
        $data = $sql->fetchAll();
        return $data;
    }

    public function studentsInGroups($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select * from students where student_group_id = '.$id.'');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function mainTeacher($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select users.id, users.first_name, users.last_name 
                                from users 
                                inner join student_group 
                                on student_group.main_teacher_id = users.id 
                                where student_group.id = "'.$id.'"');
        $sql->execute();
        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;

    }

    public function mainTeacherClass($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select id from student_group where main_teacher_id = "'.$id.'"');
        $sql->execute();
        $data = $sql->fetchAll();
        $id = $data[0]['id'];

        return $id;
    }

    public function otherClasses($id)
    {
        require('./app/db.php');
        $id = intval($id);
        
        $sql = $conn->prepare('select distinct s.id, s.first_name, s.last_name, sg.main_teacher_id
                                from students as s
                                inner join student_group as sg
                                on s.student_group_id = sg.id
                                inner join schedules
                                on sg.id = schedules.student_group_id
                                inner join subjects
                                on schedules.subject_id = subjects.id
                                where subjects.lecturer_id = '.$id.'');
                                
        $sql->execute();
        $data = [];
        while($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;    
    }

    public function getGrades($student_id, $lecturer_id)
    {
        require('./app/db.php');
        $sql = $conn->prepare('select * from grades 
                                where student_id = "'.$student_id.'" and lecturer_id = "'.$lecturer_id.'"');
        $sql->execute();
        $data = [];
        while($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getGradesMainTeacher($student_id)
    {
        require('./app/db.php');
        $sql = $conn->prepare('select grades.grade, grades.created_at, grades.semestar, grades.closing, subjects.title
                             from grades
                            inner join subjects
                            on grades.lecturer_id = subjects.lecturer_id
                            where student_id = "'.$student_id.'"');
        $sql->execute();
        $data = [];
        while($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

}