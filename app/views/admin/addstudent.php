<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add new student</title>
</head>
<body>
    
    <?php include ('././app/views/inc/header.php') ?>

    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
                <h2>New student</h2>
                <form action="" method="post">
                    <div class="form-group">
                        <label>First name:</label>
                        <input type="text" name="first_name" class="form-control form-control">
                    </div>    
                    <div class="form-group">
                        <label>Last name:</label>
                        <input type="text" name="last_name" class="form-control form-control">
                    </div>
                    <div class="form-group">
                        <label>Birth Date</label>
                        <input type="date" name="date_of_birth" class="form-control form-control">
                    </div>
                    <div class="form-group">
                        <label>Social Id</label>
                        <input type="text" name="social_id" class="form-control form-control">
                    </div>
                    <div class="form-group">
                        <label>Year:</label>
                        <select name="year_id" class="form-control form-control">
                            <option></option>

                                <?php foreach ($this->data['years'] as $year) : ?>

                            <option value="<?= $year['id']; ?>"><?= $year['title']; ?></option>

                                <?php endforeach; ?>

                        </select>
                    </div>
                    <div class="form-group">
                        <label>Subgroup:</label>
                        <select name="subgroup" class="form-control form-control">
                            <option></option>

                                <?php foreach ($this->data['subgroups'] as $subgroup) : ?>

                            <option value="<?= $subgroup['id']; ?>"><?= $subgroup['title']; ?></option>

                                <?php endforeach; ?>

                        </select>
                    </div>
                    <div class="form-group">
                        <label>Parent:</label>
                        <select name="parent" class="form-control form-control">
                            <option></option>

                                <?php foreach ($this->data['parents'] as $parent) : ?>

                            <option value="<?= $parent['id']; ?>"><?= $parent['first_name'].' '.$parent['last_name']; ?></option>

                                <?php endforeach; ?>

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