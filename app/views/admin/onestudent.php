<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=]; ?>, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Student</title>
    </head>
    <body>
        <?php $parent_id = $this->data['parent_data']['id'] ?? array();?>
        <?php $student_id = $this->data['student_data']['id'];?>
        <button><a href="/students/<?= $student_id ?>/edit">EDIT</a></button>
        <button><a href="/students/<?= $student_id; ?>/delete">DELETE</a></button>
        <h3>Student Information</h3>
        <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
            bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
            <tr>
                <td width=100>ID:</td> 
                <td width=100>First Name</td> 
                <td width=100>Last Name</td> 
                <td width=100>Date Of Birth</td> 
                <td width=100>Social Id</td>
                <td width=100>Created At</td> 
                <td width=100>Updated at</td> 
                <td width=100>Student Group Id</td> 
                <td width=100>Parent Id</td> 
            </tr> 
                
            <tr> 
                <td><?php echo $this->data['student_data']['id']; ?></td> 
                <td><?php echo $this->data['student_data']['first_name']; ?></td> 
                <td><?php echo $this->data['student_data']['last_name']; ?></td> 
                <td><?php echo $this->data['student_data']['date_of_birth']; ?></td>
                <td><?php echo $this->data['student_data']['social_id']; ?></td>
                <td><?php echo $this->data['student_data']['created_at']; ?></td>
                <td><?php echo $this->data['student_data']['updated_at']; ?></td>
                <td><?php echo $this->data['student_data']['student_group_id']; ?></td> 
                <td><?php echo $this->data['student_data']['parent_id']; ?></td> 
            </tr>  
        </table> 

        <?php if(!empty($this->data['parent_data'])) : ?>
            <h3>Parent Information</h3>
            <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
                bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
                <tr>
                    <td width=100>ID:</td> 
                    <td width=100>First Name</td> 
                    <td width=100>Last Name</td> 
                    <td width=100>Email</td> 
                    <td width=100>Last Login At</td>
                </tr> 
                    
                <tr> 
                    <td><a href="/users/<?= $parent_id ?>"></a><?php echo $this->data['parent_data']['id']; ?></td> 
                    <td><a href="/users/<?= $parent_id ?>"><?php echo $this->data['parent_data']['first_name']; ?></td> 
                    <td><a href="/users/<?= $parent_id ?>"><?php echo $this->data['parent_data']['last_name']; ?></td> 
                    <td><?php echo $this->data['parent_data']['email']; ?></td>
                    <td><?php echo $this->data['parent_data']['last_login_at']; ?></td>
                </tr>  
            </table> 
        <?php endif;?>