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
        <button><a href="/permissions">PERMISSIONS</a></button>
        
        <?php foreach ($this->data as $index => $innerarray) : ?>

                <div>
                    <h3><?= $innerarray['id'] ?></h3>
                    <h3><a href=""><?= $innerarray['title'] ?></a></h3>
                    <button><a href="/roles/edit">Edit</a></button>
                    <button><a href="/roles/delete">Delete</a></button>
                    <hr>
                </div>

        <?php endforeach; ?>

    </body>
</html>