<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Role Permissions</title>
    </head>
    <body>
        <button><a href="/rolepermissions/<?= $this->data['role'][0]['id']; ?>/edit">EDIT PERMISSIONS</a></button>
        <table border=5 cellpadding=5 cellspacing=0 
            style=border-  collapse: collapse bordercolor=#808080 
            width=100&#37; bgcolor=#C0C0C0>
            <tr>
                <td width=100>ID:</td> 
                <td width=100>Role Name</td>
            </tr>
            <tr>
                <td><?php echo $this->data['role'][0]['id'];?></td>
                <td><?php echo $this->data['role'][0]['title'];?></td>
            </tr>
        </table>
            <?php foreach ($this->data['permissions'] as $key => $value) : ?>
                        <?= $value['title']; ?> <br>
                        
            <?php endforeach; ?>
    </body>
</html>