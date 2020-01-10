<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=]; ?>, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User</title>
</head>
<body>
    <?php $id = $this->data['user']['id'];?>
    <?php var_dump($id);?>

    <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
        bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
        <h3><?php echo $this->data['prof_data'][0]['title'] ?? false; ?></h3>
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
        
        <button><a href="/users/<?= $id ?>/edit">EDIT</a></button>
        <button><a href="/users/<?= $id; ?>/delete">DELETE</a></button>
            
        <tr> 
            <td><?php echo $this->data['user']['id']; ?></td> 
            <td><?php echo $this->data['user']['first_name']; ?></td> 
            <td><?php echo $this->data['user']['last_name']; ?></td> 
            <td><?php echo $this->data['user']['email']; ?></td>
            <td><?php echo $this->data['user']['role_id']; ?></td>
            <td><?php echo $this->data['user']['password']; ?></td>
            <td><?php echo $this->data['user']['updated_at']; ?></td>
            <td><?php echo $this->data['user']['created_at']; ?></td> 
            <td><?php echo $this->data['user']['last_login_at']; ?></td> 
        </tr>  
    </table> 
</body>
</html>