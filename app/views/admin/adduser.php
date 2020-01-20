<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add new user</title>
</head>
<body>
    
    <?php include ('././app/views/inc/header.php') ?>

    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
                <h2>Add new user</h2>
                <form action="" method="post">
                    <div class="form-group">
                        <label>First Name:</label>
                        <input type="text" name="first_name" class="form-control form-control">
                    </div>    
                    <div class="form-group">
                        <label>Last Name:</label>
                        <input type="text" name="last_name" class="form-control form-control">
                    </div>
                    <div class="form-group">
                        <label>Email Address:</label>
                        <input type="email" name="email" class="form-control form-control">
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                            <?php if (isset($this->data['password'])) : ?>
                        <input type="password" name="password" class="form-control form-control" value="<?php echo $this->data['password']; ?>">
                            <?php else : ?>
                        <input type="password" name="password" class="form-control form-control" value="">
                            <?php endif; ?>
                        </br>
                    <div class="randpass" align=center>
                        <input type="submit" name="hash" value="Random Password" class="btn btn-success">
                    </div>
                    </div>
                    <div class="form-group">
                        <label>Role:</label>
                        <select name="role_id" class="form-control form-control">
                            <option></option>
                            <option value="1">Admin</option>
                            <option value="2">Principal</option>
                            <option value="3">Professor</option>
                            <option value="4">Teacher</option>
                            <option value="5">Parent</option>
                        </select>
                    </div>
                        <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                </form>
            </div>
        </div>
    </div>

    <?php include ('././app/views/inc/footer.php') ?>

</body>
</html>