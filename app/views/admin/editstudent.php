<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Edit Student</title>
    </head>
    <body>
        <form action="" method="post">
            <div>
                <label>Name</label>
                <input type="name" value="<?php echo $this->data['student']['first_name'];?>" name="first_name" value="">
            </div>
            <div>
                <label>Last Name</label>
                <input type="name" value="<?php echo $this->data['student']['last_name'];?>" name="last_name">
            </div>
            <div>
                <label>Date Of Birth</label>
                <input type="date" value="<?php echo $this->data['student']['date_of_birth'];?>" name="date_of_birth">
            </div>
            <div>
                <label>Social Id</label>
                <input type="text" value="<?php echo $this->data['student']['social_id'];?>" name="social_id">
            </div>
            <div>
                <label>Created At</label>
                <input type="text" value="<?php echo $this->data['student']['created_at'];?>" name="created_at">
            </div>
            <div>
                <label>Updated At</label>
                <input type="text" value="<?php echo $this->data['student']['updated_at'];?>" name="updated_at">
            </div>
            <!-- <div>
                <label>Student Group Id</label>
                <input type="text" value="<?php echo $this->data['student']['student_group_id'];?>" name="student_group_id">
            </div> -->
            
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>