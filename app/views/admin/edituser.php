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
                <input type="name" value="<?php echo $this->data['user']['first_name'];?>" name="first_name" value="">
            </div>
            <div>
                <label>Last Name</label>
                <input type="name" value="<?php echo $this->data['user']['last_name'];?>" name="last_name">
            </div>
            <div>
                <label>Email address</label>
                <input type="email" value="<?php echo $this->data['user']['email'];?>" name="email">
            </div>
            <div>
                <label>Password</label>
                <input type="text" value="<?php echo $this->data['user']['password'];?>" name="password">
            </div>
            <div>
                <label>Role</label>
                <select name="role_id" value="<?php echo $this->data['role_id'];?>">
                    <?php if($this->data['user']['role_id'] === '1') echo '<option selected="true" value="1">Admin</option>'?>
                    <?php if($this->data['user']['role_id'] === '2') echo '<option selected="true" value="2">Principal</option>'?>
                    <?php if($this->data['user']['role_id'] === '3') echo '<option selected="true" value="3">Professor</option>'?>
                    <?php if($this->data['user']['role_id'] === '4') echo '<option selected="true" value="4">Teacher</option>'?>
                    <?php if($this->data['user']['role_id'] === '5') echo '<option selected="true" value="5">Parent</option>'?>
                    <option value="1">Admin</option>
                    <option value="2">Principal</option>
                    <option value="3">Professor</option>
                    <option value="4">Teacher</option>
                    <option value="5">Parent</option>
                </select>
            </div>
             <div>
             <?php
                $subj_title = $this->data['prof_data'][0]['title'] ?? array();
                if ($this->data['user']['role_id'] === '3') : ?>
                    <label>Subject</label>
                    <select name="subject">
                        <?php foreach ($this->data['subjects'] as $key => $value) : ?>
                                <?php if($value['title'] === $subj_title) echo '<option selected="true">'.$subj_title;'</option>'?>
                                <option value="<?php echo $value['title'];?>"><?php echo $value['title']; ?></option>
                        <?php endforeach;?>
                    </select>
                        
                <?php endif; ?>
                      
            </div>
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>