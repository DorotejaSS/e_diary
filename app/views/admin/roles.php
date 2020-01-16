<title>Roles</title>
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
            <li class="nav-item mr-2">
                <a class="btn btn-success btn-block" href="/roles/add">Add role</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="/permissions">List of permissions</a>
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
    <h3>Roles</h3>
            <table id="myTable">
                <tr>
                    <th>ID:</th> 
                    <th>Role Name:</th>
                    <th>Edit:</th>
                    <th>Remove:</th>
                </tr>
        
            <?php foreach ($this->data as $index => $innerarray) : ?>
            <?php $id = $innerarray['id']; ?>
        
                <tr>
                    <td><?= $id; ?></td>
                    <td><a href="/rolepermissions/<?= $id; ?>/edit"><?= $innerarray['title'] ?></a></td>
                    <td><a class="btn btn-primary" href="/roles/<?= $id; ?>/edit">Edit</a></td>
                    <td><a class="btn btn-danger" href="/roles/<?= $id; ?>/delete">Delete</a></td>
                </tr>            

            <?php endforeach; ?>
        
        </table>
