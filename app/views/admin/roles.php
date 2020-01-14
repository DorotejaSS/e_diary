<?php include './app/views/inc/header.php'; ?>
<!DOCTYPE html>
<html lang=en>
    <head>
        <meta charset=UTF-8>
        <meta name=viewport content=width=device-width, initial-scale=1.0>
        <meta http-equiv=X-UA-Compatible content=ie=edge>
        <title>Roles</title>
        <style>
#myTable {
    position: relative;
    border-collapse: collapse;
	width: 100%;
    height: auto;
    background-color: #dddddd;
    table-layout: auto;
    box-shadow: 10px 10px 5px grey;
    margin: auto;
    font-size: 12px;
	font-weight: bold;
	padding-top: 30px;
    margin-bottom: 60px;
    margin-top: 80px;
}

th, td {
    text-align: center;
    padding: 12px;

}

tr:nth-child(even){background-color: white;}

th {
	
    background-color: #4CAF50;
    color: white;
    font-size: 16px;
    text-align: center;
}

</style>
</head>
<body>

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
                <a class="btn btn-success btn-block" href="logout">Sign Out</a>
            </li>
        </ul>
    </div>

</nav>

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
    </body>
</html>

