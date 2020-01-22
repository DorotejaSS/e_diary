<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script  type="text/javascript" src="./././public/js/jquery-3.4.1.js"></script>
    <script  type="text/javascript" src="./././public/js/backToTop.js"></script>
    <title>Welcome</title>
</head>
<body>
    
    <?php include ('././app/views/inc/header.php') ?>

    </br></br></br>
    <h3>Users</h3>
        <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>First Name:</th> 
                <th>Last Name:</th> 
                <th>Email:</th> 
                <th>Role ID:</th>
                <th>Password:</th> 
                <th>Updated at:</th> 
                <th>Created at:</th> 
                <th>Last Login at:</th> 
            </tr>
        
                <?php foreach ($this->data as $key => $value) : ?>
                <?php $id = $value['id']; ?>

            <tr> 
                <td><a href="/users/<?= $id ?>"> <?php echo $value['id']; ?></a></td>
                <td><a href="/users/<?= $id ?>"> <?php echo $value['first_name']; ?></a></td>
                <td><a href="/users/<?= $id ?>"> <?php echo $value['last_name']; ?></a></td>
                <td> <?php echo $value['email']; ?> </td>
                <td> <?php echo $value['role_id']; ?> </td>
                <td> <?php echo $value['password']; ?> </td>
                <td> <?php echo $value['updated_at']; ?></td>
                <td> <?php echo $value['created_at']; ?> </td>
                <td> <?php echo $value['last_login_at']; ?> </td> 
            </tr>

                <?php endforeach; ?>
        
</table> 

<a class="scroll" href="#"><img src="././public/img/top.png" alt="top" width="50" height="50" onmouseover="this.src='././public/img/top1.png'" alt="top1" onmouseout="this.src='././public/img/top.png'" alt="top" /></a>

    <?php include ('././app/views/inc/footer.php') ?>

</body>
</html>
