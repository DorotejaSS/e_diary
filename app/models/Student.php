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


}