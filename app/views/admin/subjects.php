<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
    </head>
    <body>
        <button><a href="subjects/add">ADD NEW SUBJECT</a></button>
        <table border=5 cellpadding=5 cellspacing=0 
            style=border-  collapse: collapse bordercolor=#808080 
            width=100&#37; bgcolor=#C0C0C0>
            <tr>
                <th width=100>Subject</th> 
                <th width=100>Id</th>
                <th width=100>First name</th>
                <th width=100>Last name</th>
                <th width=100>Role ID</th>
            </tr>
            <?php foreach ($this->data as $key => $value) : ?>
                <?php $lecturer_id = $value['lecturer_id']; ?>
                <?php $subject_id = $value['id']; ?>
                
                    <tr> 
                        <td><a href="/subjects/<?= $subject_id ?>"> <?php echo $value['title']; ?> </td>
                        <td> <?php echo $lecturer_id; ?> </td>
                        <td><a href="/users/<?= $lecturer_id ?>"> <?php echo $value['first_name']; ?></a></td>
                        <td><a href="/users/<?= $lecturer_id ?>"> <?php echo $value['last_name']; ?></a></td>
                        <td> <?php echo $value['role_id']; ?> </td>
                    </tr>
            <?php endforeach; ?>
        </table> 
    </body>
</html>