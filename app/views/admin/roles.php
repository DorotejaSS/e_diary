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

        <button><a href="/roles/add">ADD ROLE</a></button>
        <button><a href="/permissions">LIST OF PERMISSIONS</a></button>
        <table border=5 cellpadding=5 cellspacing=0 
            style=border-  collapse: collapse bordercolor=#808080 
            width=100&#37; bgcolor=#C0C0C0>
            <tr>
                <td width=100>ID:</td> 
                <td width=100>Role Name</td>
            </tr>
        
        <?php foreach ($this->data as $index => $innerarray) : ?>
            <?php $id = $innerarray['id']; ?>
          
                <tr>
                    <td><?= $id; ?></td>
                    <td><a href="/rolepermissions/<?= $id; ?>/edit"><?= $innerarray['title'] ?></a></td>
                    <td><button><a href="/roles/<?= $id; ?>/edit">Edit</a></button></td>
                    <td><button><a href="/roles/<?= $id; ?>/delete">Delete</a></button></td>
                </tr>            

        <?php endforeach; ?>
        </table>

    </body>
</html>