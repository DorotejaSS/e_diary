<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Roles</title>
    </head>
    <body>
        <button><a href="/roles/add">ADD ROLE</a></button>
        <button><a href="/permissions">LIST OF PERMISSIONS</a></button>
        <table border=5 cellpadding=5 cellspacing=0 
            style=border-  collapse: collapse bordercolor=#808080 
            width=100&#37; bgcolor=#C0C0C0>
            <tr>
                <td width=100>ID:</td> 
                <td width=100>Role Name</td>
            </tr>
        
        <?php foreach ($this->data as $index => $innerarray) : ?>
            <?php $id = $innerarray['id']; ?>
          
                <tr>
                    <td><?= $id; ?></td>
                    <td><a href="/permissions/<?= $id; ?>"><?= $innerarray['title'] ?></a></td>
                    <td><button><a href="/roles/<?= $id; ?>/edit">Edit</a></button></td>
                    <td><button><a href="/roles/<?= $id; ?>/delete">Delete</a></button></td>
                </tr>            

        <?php endforeach; ?>
        </table>

    </body>
</html>