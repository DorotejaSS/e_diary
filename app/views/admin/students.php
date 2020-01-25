    <script  type="text/javascript" src="./././public/js/backToTop.js"></script>

    </br></br></br>
    <h3>Students</h3>
    <div class="subject">
        <button><a href="/students/add">Add New Student</a></button>
    </div> 
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
            
<a class="scroll" href="#"><img src="././public/img/top.png" alt="top" width="50" height="50" onmouseover="this.src='././public/img/top1.png'" alt="top1" onmouseout="this.src='././public/img/top.png'" alt="top" /></a>

