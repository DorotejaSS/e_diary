<?php include './app/views/inc/header.php'; ?>
<div class="jumbotrone jumbotrone-fluid text-center">
<div class="container">
<h1 class="display-3">E-Diary</h1>
</div>
</div>
<div class="row">
<div class="col-md-6 mx-auto">
<div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
<h2>Login</h2>
<p>Please fill in your credentials to log in</p>
<form action="" method="post" autocomplete="on">
<div class="form-group">
<label>Email address:<span class="req"> *</span></label>
<input type="email" name="email" class="form-control form-control-lg">
</div>

<div class="form-group">
<label>Password:<span class="req"> *</span></label>
<input type="password" name="password" class="form-control form-control-lg">
</div>

<div class="row">
    <div class="col">
        <input type="submit" value="Login" class="btn btn-success btn-block">
    </div>
</div>
</form>
</div>
</div>
</div>
      <?php include './app/views/inc/footer.php'; ?>
   


