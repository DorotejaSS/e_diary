<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Permission Edit</title>
    </head>
    <body>
        <form action="" method="post">
            <label>Permission Name: </label>
            <input type="text" name="permission" value="<?php echo $this->data['title']; ?>">
            <input type="submit" name="submit" value="Save">
        </form>
    </body>
</html>