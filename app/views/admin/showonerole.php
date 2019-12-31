<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Role</title>
    </head>
    <body>
        <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
             bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
            <tr>
                <td>Id</td>
                <td>Title</td>
            </tr>
            <tr>
                <td><?php echo $this->data['id'];?></td>
                <td><?php echo $this->data['title'];?></td>
                <td><a href="/permissions/<?= $this->data['id']; ?>">Permissions</a></td>
            </tr>
        </table>
    </body>
</html>