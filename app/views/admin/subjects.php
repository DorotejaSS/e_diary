<title>Subjects</title>
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
                <li class="nav-item">
                    <a class="btn btn-success btn-block" href="subjects/add"">Add new subject</a>
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