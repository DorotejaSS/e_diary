        <?php $parent_id = $this->data['parent_data']['id'] ?? array();?>
        <?php $student_id = $this->data['student_data']['id'];?>
        
    <h3>Student Information</h3>
        <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>First Name:</th> 
                <th>Last Name:</th> 
                <th>Date Of Birth:</th> 
                <th>Social ID:</th>
                <th>Created at:</th> 
                <th>Updated at:</th> 
                <th>Student Group ID:</h> 
                <th>Parent ID:</th> 
                <th>Edit:</th>
                <th>Delete:</th>
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
                <td><a class="btn btn-primary" href="/students/<?= $student_id ?>/edit">Edit</a></td>
                <td><a class="btn btn-danger" href="/students/<?= $student_id; ?>/delete">Delete</a></td>
            </tr>  
        </table> 

        <?php if(!empty($this->data['parent_data'])) : ?>

            <h3>Parent Information</h3>
            <table id="myTable">
                <tr>
                    <th>ID:</th> 
                    <th>First Name:</th> 
                    <th>Last Name:</th> 
                    <th>Email:</th> 
                    <th>Last Login at:</th>
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