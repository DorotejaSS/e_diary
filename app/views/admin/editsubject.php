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
            <input type="submit" name="submit" value="Save">
        </form>
    </body>
</html>
