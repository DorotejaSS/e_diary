<h3>Students</h3>
    <table id="myTable">
        <tr>
            <th>First Name:</th>
            <th>Last Name:</th>
        </tr>
       
        <?php foreach ($this->data['students'] as $key => $value) : ?>
            <?php $student_id = $value['id'] ?>
            <tr> 
                <td><a href="/grades/<?= $student_id; ?>"> <?php echo $value['first_name']; ?></a></td>
                <td><a href="/grades/<?= $student_id; ?>"> <?php echo $value['last_name']; ?></a></td>
            </tr>
        <?php endforeach; ?>    
    </table>
        