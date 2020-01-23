        <h3>Student Group</h3>
        <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>First Name:</th> 
                <th>Last Name:</th> 
                <th>Birth Date:</th> 
                <th>Social ID</th>
                <th>Created at:</th> 
                <th>Updated at:</th> 
                <th>Student Group ID:</th> 
                <th>Parent ID:</th> 
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
       
        <span>
            Main Teacher: 
            <a href="/users/<?=$this->data['main_teacher'][0]['id']; ?>">
            <?= $this->data['main_teacher'][0]['first_name'].' '.
                $this->data['main_teacher'][0]['last_name'];
            ?>
            </a>
        </span>