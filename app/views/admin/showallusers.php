<!DOCTYPE html>
<html lang=en>
    <head>
        <meta charset=UTF-8>
        <meta name=viewport content=width=device-width, initial-scale=1.0>
        <meta http-equiv=X-UA-Compatible content=ie=edge>
        <title>Users</title>
    </head>
    <body>
            <button><a href="users/add">ADD NEW USER</a></button>
            <table border=5 cellpadding=5 cellspacing=0 
            style=border-  collapse: collapse bordercolor=#808080 
            width=100&#37; bgcolor=#C0C0C0>
                <tr>
                    <td width=100>ID:</td> 
                    <td width=100>First Name</td> 
                    <td width=100>Last Name</td> 
                    <td width=100>Email</td> 
                    <td width=100>Role Id</td>
                    <td width=100>Password</td> 
                    <td width=100>Updated at</td> 
                    <td width=100>Created at</td> 
                    <td width=100>Last Login at</td> 
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
    </body>
</html>