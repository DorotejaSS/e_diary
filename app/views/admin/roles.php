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
    <h3>Roles</h3>
            <table id="myTable">
                <tr>
                    <th>ID:</th> 
                    <th>Role Name:</th>
                    <th>Edit:</th>
                    <th>Remove:</th>
                </tr>
        
            <?php foreach ($this->data as $index => $innerarray) : ?>
            <?php $id = $innerarray['id']; ?>
        
                <tr>
                    <td><?= $id; ?></td>
                    <td><a href="/rolepermissions/<?= $id; ?>/edit"><?= $innerarray['title'] ?></a></td>
                    <td><a class="btn btn-primary" href="/roles/<?= $id; ?>/edit">Edit</a></td>
                    <td><a class="btn btn-danger" href="/roles/<?= $id; ?>/delete">Delete</a></td>
                </tr>            

            <?php endforeach; ?>
        
        </table>

    <?php include ('././app/views/inc/footer.php') ?>

</body>
</html>

