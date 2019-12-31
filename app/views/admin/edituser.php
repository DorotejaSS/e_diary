<?php 

// function generatePassword($length = 10)
// {   
//     $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
//     $password = substr(str_shuffle($chars), 0, $length);
//     return $password;
// }

// if (isset($_POST['submit'])) {
//     generatePassword();
// }
// $password = generatePassword();

// function selectedRole()
// {

// }
?>  

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Edit User</title>
    </head>
    <body>
        <form action="" method="post">
            <div>
                <label>Name</label>
                <input type="name" value="<?php echo $_SESSION['user_data']['first_name'];?>" name="first_name" value="">
            </div>
            <div>
                <label>Last Name</label>
                <input type="name" value="<?php echo $_SESSION['user_data']['last_name'];?>" name="last_name">
            </div>
            <div>
                <label>Email address</label>
                <input type="email" value="<?php echo $_SESSION['user_data']['email'];?>" name="email">
            </div>
            <div>
                <label>Password</label>
                <input type="text" value="<?php echo $_SESSION['user_data']['password'];?>" name="password">
            </div>
            <div>
                <label>Role</label>
                <select name="role_id" value="<?php echo $_SESSION['user_data']['role_id'];?>">
                    <?php if($_SESSION['user_data']['role_id'] == '1') echo '<option selected="true" value="1">Admin</option>'?>
                    <?php if($_SESSION['user_data']['role_id'] == '2') echo '<option selected="true" value="2">Principal</option>'?>
                    <?php if($_SESSION['user_data']['role_id'] == '3') echo '<option selected="true" value="3">Professor</option>'?>
                    <?php if($_SESSION['user_data']['role_id'] == '4') echo '<option selected="true" value="4">Teacher</option>'?>
                    <?php if($_SESSION['user_data']['role_id'] == '5') echo '<option selected="true" value="5">Parent</option>'?>
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