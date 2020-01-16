<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
    </head>
    <body>
        <table border=5 cellpadding=5 cellspacing=0 
                style=border-  collapse: collapse bordercolor=#808080 
                width=100&#37; bgcolor=#C0C0C0>
                    <tr>
                        <td width=100>ID:</td> 
                        <td width=100>First Name</td> 
                        <td width=100>Last Name</td> 
                        <td width=100>Birth Date</td> 
                        <td width=100>Social Id</td>
                        <td width=100>Created At</td> 
                        <td width=100>Updated at</td> 
                        <td width=100>Student Group Id</td> 
                        <td width=100>Parent Id</td> 
                    </tr>

            <?php foreach ($this->data['students'] as $key => $student) : ?>
                <?php $id = $student['id']; ?>
                    <tr> 
                        <td><a href="/students/<?= $id ?>"> <?php echo $student['id']; ?></a></td>
                        <td><a href="/students/<?= $id ?>"> <?php echo $student['first_name']; ?></a></td>
                        <td><a href="/students/<?= $id ?>"> <?php echo $student['last_name']; ?></a></td>
                        <td> <?php echo $student['date_of_birth']; ?> </td>
                        <td> <?php echo $student['social_id']; ?> </td>
                        <td> <?php echo $student['created_at']; ?> </td>
                        <td> <?php echo $student['updated_at']; ?></td>
                        <td> <?php echo $student['student_group_id']; ?> </td>
                        <td> <?php echo $student['parent_id']; ?> </td>
                    </tr>
            <?php endforeach; ?>
        </table>
    </body>
</html>