<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Permissions</title>
    </head>
    <body>
        <button><a href="/permissions/add">ADD PERMISSION</a></button>
        <table border=5 cellpadding=5 cellspacing=0 
                style=border-  collapse: collapse bordercolor=#808080 
                width=100&#37; bgcolor=#C0C0C0>
                <tr>
                    <td width=100>ID</td> 
                    <td width=100>Permission Name</td>
                </tr>
                
                    <?php $id = $this->data['id']; ?>

                    <tr>
                        <td><?= $id; ?></td>
                        <td><?= $this->data['title']; ?></td>
                        <td><a href="/permissions/<?= $id; ?>/edit">Edit</a></td>
                        <td><a href="/permissions/<?= $id; ?>/delete">Delete</a></td>
                    </tr>
        </table>

    </body>
</html>