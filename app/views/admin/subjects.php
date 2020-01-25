
        <div class="subject">
            <button><a href="/subjects/add">Add New Subject</a></button>
        </div> 
        <h3>Subjects</h3>
        <table id="myTable">
            <tr>
                <th>Subject:</th> 
                <th>ID:</th>
                <th>First Name:</th>
                <th>Last Name:</th>
                <th>Role ID:</th>
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
    