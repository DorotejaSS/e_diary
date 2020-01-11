<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Add new subject</title>
    </head>
    <body>
        <form action="" method="post">
            <div>
                <label>Subject Name:
                    <input type="subject_name" name="title">
                </label>
            </div>
            <br>
            <?php foreach ($this->data['lecturers'] as $index => $data) : ?>
                <label>
                    <input type="checkbox" name="lecturers[]" value="<?php echo $data['id']; ?>">
                    <span><?php echo $data['first_name'].' '.$data['last_name']; ?></span><br>
                </label>
            <?php endforeach; ?>

            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>