<?php include './app/views/inc/header.php'; ?>
<?php $id = $this->data['user']['id'];?>
<!DOCTYPE html>
<html lang=en>
    <head>
        <meta charset=UTF-8>
        <meta name=viewport content=width=device-width, initial-scale=1.0>
        <meta http-equiv=X-UA-Compatible content=ie=edge>
        <title>User</title>
        <style>
#myTable {
    position:	relative;
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

        <?php $id = $this->data['user']['id'];?>

        <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
            bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
            <h3><?php echo $this->data['prof_data'][0]['title'] ?? false; ?></h3>
            <tr>
                <td width=100>ID:</td> 
                <td width=100>First Name</td> 
                <td width=100>Last Name</td> 
                <td width=100>Email</td> 
                <td width=100>Role Id</td>
                <td width=100>Password</td> 
                <td width=100>Updated at</td> 
                <td width=100>Created at</td> 
                <td width=100>Last Login at</td> 
            </tr> 
            
            <button><a href="/users/<?= $id ?>/edit">EDIT</a></button>
            <button><a href="/users/<?= $id; ?>/delete">DELETE</a></button>
                
            <tr> 
                <td><?php echo $this->data['user']['id']; ?></td> 
                <td><?php echo $this->data['user']['first_name']; ?></td> 
                <td><?php echo $this->data['user']['last_name']; ?></td> 
                <td><?php echo $this->data['user']['email']; ?></td>
                <td><?php echo $this->data['user']['role_id']; ?></td>
                <td><?php echo $this->data['user']['password']; ?></td>
                <td><?php echo $this->data['user']['updated_at']; ?></td>
                <td><?php echo $this->data['user']['created_at']; ?></td> 
                <td><?php echo $this->data['user']['last_login_at']; ?></td> 
            </tr>  
        </table>

        <?php if (isset($this->data['child_data'])) : ?>
            <h3>Child(ren)</h3>
            <?php foreach ($this->data['child_data'] as $key => $child) : ?>
                  <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
                    bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
                    <tr>
                        <td width=100>ID:</td> 
                        <td width=100>First Name</td> 
                        <td width=100>Last Name</td> 
                        <td width=100>Date Of Birth</td> 
                        <td width=100>Social Id</td>
                        <td width=100>Student Group Id</td> 
                    </tr> 
                    <tr> 
                        <td><?php echo $child['id']; ?></td> 
                        <td><?php echo $child['first_name']; ?></td> 
                        <td><?php echo $child['last_name']; ?></td> 
                        <td><?php echo $child['date_of_birth']; ?></td>
                        <td><?php echo $child['social_id']; ?></td>
                        <td><?php echo $child['student_group_id']; ?></td>
                    </tr>  
                </table>
            <?php endforeach; ?>
        <?php endif; ?>
    </body>
</html>
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
    <ul class="navbar-nav mr-auto" >
      <li class="nav-item">
        <a class="nav-link" href="/admin">Admin page</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="/users">Users</a>
      </li>

      <li class="nav-item mr-2">
        <a class="btn btn-success btn-block" href="/users/<?= $id ?>/edit">Edit</a>
      </li>
</br>
      <li class="nav-item">
        <a class="btn btn-success btn-block" href="/users/<?= $id; ?>/delete">Delete</a>
      </li>

    </ul>

      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="btn btn-success btn-block" href="logout">Sign Out</a>
        </li>
    </ul>
    </div>
  
</nav>

    <!--<?php var_dump($this->data);?>
    <?php var_dump($id);?>-->

    <!--<table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
        bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">-->
        

        <h3><?php echo $this->data['prof_data'][0]['title'] ?? false; ?></h3>
        

        <table id="myTable">

        <tr>
                    <th>ID:</th> 
                    <th>First Name:</th> 
                    <th>Last Name:</th> 
                    <th>Email:</th> 
                    <th>Role ID:</th>
                    <th>Password:</th> 
                    <th>Updated at:</th> 
                    <th>Created at:</th> 
                    <th>Last Login at:</th> 
                </tr>
        
        <!--<button><a href="/users/<?= $id ?>/edit">EDIT</a></button>
        <button><a href="/users/<?= $id; ?>/delete">DELETE</a></button>-->
            
        <tr> 
            <td><?php echo $this->data['user']['id']; ?></td> 
            <td><?php echo $this->data['user']['first_name']; ?></td> 
            <td><?php echo $this->data['user']['last_name']; ?></td> 
            <td><?php echo $this->data['user']['email']; ?></td>
            <td><?php echo $this->data['user']['role_id']; ?></td>
            <td><?php echo $this->data['user']['password']; ?></td>
            <td><?php echo $this->data['user']['updated_at']; ?></td>
            <td><?php echo $this->data['user']['created_at']; ?></td> 
            <td><?php echo $this->data['user']['last_login_at']; ?></td> 
        </tr>  
    </table> 
</body>
</html>

<?php include './app/views/inc/footer.php'; ?>
