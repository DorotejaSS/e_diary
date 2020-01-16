<?php

class Student
{
    public function __construct($request)
    {
        $this->request = $request;
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

    public function studentGroups()
    {
        require('./app/db.php');

        $sql = $conn->prepare('select distinct id, year_id, subgroup_id from student_group');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;


        // $student_group_datas = $this->studentGroupId();
        // var_dump($student_group_datas);
                
                    // $id = $student_data[1];
                    // $start_year = $student_data[2];
                    // $finish_year = $student_data[3];
                    // echo 'student group id';
                    // var_dump($student_group_id);
                    // echo 'student id';
                    // var_dump($id);
                    // echo 'start y';
                    // var_dump($start_year);
                    // echo 'finish y';
                    // var_dump($finish_year);
                    
                    // $sql = $conn->prepare('update students set student_group_id = '.$student_group_id.'');
                    // $sql->execute();
                    // var_dump($sql->execute());
    

    }

    // public function studentGroupId()
    // {
    //      require('./app/db.php');

    //      $sql = $conn->prepare('select * from students join student_group on student_group.id = students.student_group_id');
    //      $sql->execute();
    //     $data = [];
    //     while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
    //         $data[] = $row;
    //     }
    //     return $data;
    // }
}