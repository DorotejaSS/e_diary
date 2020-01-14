<?php

class Student
{
    public function __construct($request)
    {
        $this->request = $request;
        var_dump($this->request);
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
}