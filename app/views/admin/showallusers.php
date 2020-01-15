<title>All Users</title>
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
                <a class="btn btn-success btn-block" href="users/add">Add new user</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="logout">Sign Out</a>
            </li>
        </ul>
    </div>
</nav>
<table id="myTable">
    <tr>
        <th>ID</th> 
        <th>First Name:</th> 
        <th>Last Name:</th> 
        <th>Email:</th> 
        <th>Role ID:</th> 
        <th>Password:</th> 
        <th>Updated at:</th> 
        <th>Created at:</th> 
        <th>Last Login at:</th>  
    </tr>  
    
        <?php foreach ($this->data as $key => $value) : ?>
            <?php $id = $value['id']; ?>

    <tr> 
        <td><a href="/users/<?= $id ?>"> <?php echo $value['id']; ?></a></td>
        <td><a href="/users/<?= $id ?>"> <?php echo $value['first_name']; ?></a></td>
        <td><a href="/users/<?= $id ?>"> <?php echo $value['last_name']; ?></a></td>
        <td> <?php echo $value['email']; ?> </td>
        <td> <?php echo $value['role_id']; ?> </td>
        <td> <?php echo $value['password']; ?> </td>
        <td> <?php echo $value['updated_at']; ?></td>
        <td> <?php echo $value['created_at']; ?> </td>
        <td> <?php echo $value['last_login_at']; ?> </td> 
    </tr>

        <?php endforeach; ?>
        
</table> 
