

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

      <li class="nav-item">
        <a class="nav-link"  href="/users">Users</a>
      </li>

      <li class="nav-item">
        <a class="nav-link"  href="/roles">Roles</a>
      </li>

      <li class="nav-item">
        <a class="nav-link"  href="/subjects">Subjects</a>
      </li>

      <li class="nav-item">
        <a class="nav-link"  href="/students">Students</a>
      </li>
    </ul>

      <ul class="navbar-nav ml-auto">
        
        <li class="nav-item">
            <a class="btn btn-success btn-block"  href="logout">Sign Out</a>
        </li>
    </ul>

    </div>
  
</nav>
<?php include './app/views/inc/header.php'; ?>

<div class="jumbotrone jumbotrone-fluid text-center">
<div class="container">

</div>

<?php include './app/views/inc/footer.php'; ?>

