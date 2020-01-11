<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Subject Edit</title>
    </head>
    <body>
        <form action="" method="post">
            <label>Subject Name: </label>
            
            <input type="text" name="subject" value="<?php echo $this->data['subject_data']['title']; ?>"><br>
            
            <?php foreach ($this->data['lecturers'] as $index => $data) : ?>
                <label>
                    <input type="checkbox" name="lecturers[]" value="<?php echo $data['id']; ?>"
                    <?php echo ($data['id'] === $this->data['subject_data']['lecturer_id']) ? 'checked' : '' ?>>
                    <span><?php echo $data['first_name'].' '.$data['last_name']; ?></span><br>
                </label>
            <?php endforeach; ?>
            <input type="submit" name="submit" value="Save">
        </form>
    </body>
</html>
