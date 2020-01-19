<!--popraviti-->
<?php $id = $this->data['student']['id'];?>
        <title>Edit student</title>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 fixed-top">
            <button class="navbar-toggler" type="button" 
                    data-toggle="collapse" 
                    data-target="#navbarsExampleDefault" 
                    aria-controls="navbarsExampleDefault" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/admin">Admin page</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/students/<?= $id;?>">User</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>

        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
                    <h2>Edit student</h2>
                <form action="" method="post">
                <div class="form-group">
                        <label>First Name:</label>
                        <input type="name" class="form-control form-control"value="<?php echo $this->data['student']['first_name'];?>" name="first_name" value="">
                    </div>
                    <div class="form-group">
                        <label>Last Name:</label>
                        <input type="name" class="form-control form-control" value="<?php echo $this->data['student']['last_name'];?>" name="last_name">
                    </div>
                    <div class="form-group">
                        <label>Date Of Birth:</label>
                        <input type="date" class="form-control form-control" value="<?php echo $this->data['student']['date_of_birth'];?>" name="date_of_birth">
                    </div>
                    <div class="form-group">
                        <label>Social ID:</label>
                        <input type="text" class="form-control form-control" value="<?php echo $this->data['student']['social_id'];?>" name="social_id">
                    </div>
                    <div class="form-group">
                        <label>Created at:</label>
                        <input type="text" class="form-control form-control" value="<?php echo $this->data['student']['created_at'];?>" name="created_at">
                    </div>
                    <div class="form-group">
                        <label>Updated at:</label>
                        <input type="text" class="form-control form-control" value="<?php echo $this->data['student']['updated_at'];?>" name="updated_at">
                    </div>
                    <div>
                        <label>Student Group ID:</label>
                        <input type="text" class="form-control form-control" value="<?php echo $this->data['student']['student_group_id'];?>" name="student_group_id">
                    </div>
                    
                    <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                    </form>
                </div>
            </div>
        </div>