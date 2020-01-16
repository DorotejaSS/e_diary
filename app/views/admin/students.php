<!DOCTYPE html>
<html lang=en>
    <head>
        <meta charset=UTF-8>
        <meta name=viewport content=width=device-width, initial-scale=1.0>
        <meta http-equiv=X-UA-Compatible content=ie=edge>
        <title>Users</title>
    </head>
    <body>
            <button><a href="students/add">ADD NEW STUDENT</a></button>
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
                </tr>
       
        
                <?php foreach ($this->data as $key => $value) : ?>
                    <?php $id = $value['id']; ?>
                        <tr> 
                            <td><a href="/students/<?= $id ?>"> <?php echo $value['id']; ?></a></td>
                            <td><a href="/students/<?= $id ?>"> <?php echo $value['first_name']; ?></a></td>
                            <td><a href="/students/<?= $id ?>"> <?php echo $value['last_name']; ?></a></td>
                            <td> <?php echo $value['date_of_birth']; ?> </td>
                            <td> <?php echo $value['social_id']; ?> </td>
                            <td> <?php echo $value['created_at']; ?> </td>
                            <td> <?php echo $value['updated_at']; ?></td>
                            <td> <?php echo $value['student_group_id']; ?> </td>
                        </tr>
                <?php endforeach; ?>
            </table> 