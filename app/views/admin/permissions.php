<title>Permissions</title>
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
                <a class="nav-link" href="/roles">Roles</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="/permissions/add">Add permission</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>

</br></br></br>
    <h3>Permissions</h3>
        <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>Permission Name:</th>
                <th>Edit:</th>
                <th>Delete:</th>
            </tr>

                    <?php foreach ($this->data as $key => $value) : ?>
                    <?php $id = $value['id']; ?>
            <tr>
                <td><?= $id; ?></td>
                <td><?= $value['title']; ?></td>
                <td><a class="btn btn-primary" href="/permissions/<?= $id; ?>/edit">Edit</a></td>
                <td><a class="btn btn-danger" href="/permissions/<?= $id; ?>/delete">Delete</a></td>
            </tr>
                    <?php endforeach; ?>

        </table>
