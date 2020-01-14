
<?php include './app/views/inc/header.php'; ?><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Add new user</title>
    </head>

    <style>
        .row{
            margin: auto;  
            margin-top: 80px;
            margin-bottom: 60px;
            justify-content: center;
            align-items: center;
        }
    </style>
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
        <a class="nav-link"  href="/admin">Admin page</a>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="btn btn-success btn-block"  href="logout">Sign Out</a>
        </li>
    </ul>
</div>
</nav>

<div class="row">
<div class="col-md-6 mx-auto">
<div class="card card-body bg-light mt-5">

<h2>New user</h2>
<p>Please fill the data for new user</p>


    <form action="" method="post">

        <div class="form-group">
                <label>First name:</label>
                <input type="text" name="first_name" class="form-control form-control">
                </div>    
            

        <div class="form-group">
                <label>Last name:</label>
                <input type="text" name="last_name" class="form-control form-control">
                </div>

        <div class="form-group">
                <label>Email address:</label>
                <input type="email" name="email" class="form-control form-control">
        </div>

            <div class="form-group">
                <label>Password:</label>
                <?php if (isset($this->data['password'])) : ?>
                    <input type="password" name="password" class="form-control form-control" value="<?php echo $this->data['password']; ?>">
                    
                <?php else : ?>
                    <input type="password" name="password" class="form-control form-control" value="">
                <?php endif; ?>
                </br>
                <div class="randpass" align=center>
                <!--<input type="submit" name="hash" value="rand password">-->
                <input type="submit" name="hash" value="Random Password" class="btn btn-success">
                </div>
            </div>

            <div class="form-group">
                <label>Role:</label>
                <select name="role_id" class="form-control form-control">
                    <option>---</option>
                    <option value="1">Admin</option>
                    <option value="2">Principal</option>
                    <option value="3">Professor</option>
                    <option value="4">Teacher</option>
                    <option value="5">Parent</option>
                </select>
            </div>
           
                    <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                
        
            <!--<input type="submit" name="submit" value="Submit">-->
        </form>
        </div>
    </div>
</div>
    </body>
</html>

<?php include './app/views/inc/footer.php'; ?>