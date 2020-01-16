<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Add new user</title>
    </head>
    <body>
    <form action="" method="post">
            <div>
                <label>Name</label>
                <input type="name" name="first_name">
            </div>
            <div>
                <label>Last Name</label>
                <input type="name" name="last_name">
            </div>
            <div>
                <label>Email address</label>
                <input type="email" name="email">
            </div>
            <div>
                <label>Password</label>
                <?php if (isset($this->data['password'])) : ?>
                    <input type="text" name="password" value="<?php echo $this->data['password']; ?>">
                <?php else : ?>
                    <input type="text" name="password" value="">
                <?php endif; ?>
                <input type="submit" name="hash" value="rand password">
            </div>
            <div>
                <label>Role</label>
                <select name="role_id">
                    <option>---</option>
                    <option value="1">Admin</option>
                    <option value="2">Principal</option>
                    <option value="3">Professor</option>
                    <option value="4">Teacher</option>
                    <option value="5">Parent</option>
                </select>
            </div>
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>