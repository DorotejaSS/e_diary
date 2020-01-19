<title>Student Groups</title>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 fixed-top">
    <button class="navbar-toggler" type="button" 
            data-toggle="collapse" 
            data-target="#navbarsExampleDefault" 
            aria-controls="navbarsExampleDefault" 
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/admin">Admin page</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="/logout">Logout</a>
            </li>
        </ul>
    </div>
    </nav>

</br></br></br>
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
    