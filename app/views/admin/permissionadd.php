<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add New Permission</title>
</head>
<body>
    <form action="" method="post">
        <label for="role">Permission: 
            <input type="text" name="permission">
            <input type="submit" name="submit" value="Save">
        </label>
        <br>

        <?php foreach ($this->data['role_data'] as $index => $data) : ?>
            <label>
                <input type="checkbox" name="roles[]" value="<?php echo $data['id']; ?>">
                <span><?php echo $data['title']; ?></span><br>
            </label>
        <?php endforeach; ?>
    </form>
</body>
</html>