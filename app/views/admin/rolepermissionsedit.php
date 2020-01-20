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

    </br></br></br>
    <h3>Edit role permission</h3>
    <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>Role Name:</th>
            </tr>
            <tr>
                <td><?php echo $this->data['role'][0]['id'];?></td>
                <td><?php echo $this->data['role'][0]['title'];?></td>
            </tr>
            <tr>
                <td colspan="2">
                    <form action="" method="post">

                    <div class="form-group">
                        <?php foreach ($this->data['permissions'] as $key => $value) : ?>

                            <label>
                                <div class="permission-checkbox mr-2">
                                    <input type="checkbox" name="allowed[]" value="<?php echo $value['id']; ?>" 
                                    <?php echo ($value['access'] === '1') ? 'checked' : '' ?>>
                                    <span><?php echo $value['title']; ?></span>
                                </div>
                            </label>

                        <?php endforeach; ?>

                    </div>
                            <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                    </form>    
                </td>
            </tr>
        </table>
            
                       <!-- <form action="" method="post">

                            <?php foreach ($this->data['permissions'] as $key => $value) : ?>
            
                                <label>
                            <input type="checkbox" name="allowed[]" value="<?php echo $value['id']; ?>" 
                            <?php echo ($value['access'] === '1') ? 'checked' : '' ?>>
                            <span><?php echo $value['title']; ?></span><br>
                            </label>

                            <?php endforeach; ?>

                            <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
            </form>-->
        

    <?php include ('././app/views/inc/footer.php') ?>

</body>
</html>
