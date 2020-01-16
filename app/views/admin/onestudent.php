<title>Student</title>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 fixed-top">
            <button class="navbar-toggler" type="button" 
                    data-toggle="collapse" 
                    data-target="#navbarsExampleDefault" 
                    aria-controls="navbarsExampleDefault" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto" >
                    <li class="nav-item">
                        <a class="nav-link" href="/admin">Admin page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/students">Students</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="btn btn-success btn-block" href="/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>


        <?php $parent_id = $this->data['parent_data']['id'] ?? array();?>
        <?php $student_id = $this->data['student_data']['id'];?>
        
</br></br></br>
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

</br></br></br>
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