<h3>Students</h3>
    <table id="myTable">
        <tr>
            <th>First Name:</th>
            <th>Last Name:</th>
            <th>Student Group ID:</th> 
            <th>Main Teacher</th> 
        </tr>
      
        <?php foreach ($this->data['students'] as $key => $value) : ?>
            <tr> 
                <td> <?php echo $value['first_name']; ?></a></td>
                <td> <?php echo $value['last_name']; ?></a></td>
                <td> <?php echo $value['id']; ?> </td>
            <?php foreach ($this->data['main_teacher'] as $key => $value) : ?>
                <td> <?php echo $value['first_name'].' '.$value['last_name']; ?> </td>
            </tr>
                
            <?php endforeach; ?>
        <?php endforeach; ?>

    </table>