<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Welcome</title>
</head>
<body>
    
    <?php include ('././app/views/inc/header.php') ?>

    <div class="row">
    <div class="col-md-6 mx-auto">
        <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
            <h2>Add new role</h2>
                <form action="" method="post">
                    <div class="form-group">
                        <label>Role:</label>
                        <input type="text" name="role" class="form-control form-control">
                    </div>
                        <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                </form>
        </div>
    </div>
</div>

    <?php include ('././app/views/inc/footer.php') ?>

</body>
</html>

