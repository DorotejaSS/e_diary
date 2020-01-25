<h3>My Class</h3>
    <table id="myTable">
        <tr>
            <th>ID:</td> 
            <th>First Name:</th>
            <th>Last Name:</th>
            <th>Birth Date:</th>
            <th>Social ID:</th>
            <th>Created at:</th>
            <th>Updated at:</th>
            <th>Student Group ID:</th> 
        </tr>
    
        <?php foreach ($this->data as $key => $value) : ?>
        <?php $id = $value['id']; ?>
                
        <tr> 
            <td> <?php echo $value['id']; ?></a></td>
            <td> <a href="/mystudentgrade/<?= $id;?>"><?php echo $value['first_name']; ?></a></td>
            <td> <a href="/mystudentgrade/<?= $id;?>"><?php echo $value['last_name']; ?></a></td>
            <td> <?php echo $value['date_of_birth']; ?> </td>
            <td> <?php echo $value['social_id']; ?> </td>
            <td> <?php echo $value['created_at']; ?> </td>
            <td> <?php echo $value['updated_at']; ?></td>
            <td> <?php echo $value['student_group_id']; ?> </td>
        </tr>

            <?php endforeach; ?>

    </table>