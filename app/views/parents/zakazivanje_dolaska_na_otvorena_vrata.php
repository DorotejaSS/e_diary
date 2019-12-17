<?php require APPROOT . '/views/parents/parents_header.php'; ?>
<div class="jumbotrone jumbotrone-fluid text-center">
<div class="container">
<h1 class="display-3"><?php echo $data['title']; ?></h1>
</div>
</div>


<div class="row">
<div class="col-md-6 mx-auto">
<div class="card card-body bg-light mt-5">
<h2>Otvorena vrata:</h2>
<p align="center">Da li možete da me primite na otvorena vrata.</p>
<form method="post" action="send_message.php">
<div class="row">
    <div class="col">
        <input type="submit" value="Send" class="btn btn-success btn-block">
        <input type="cancel" value="Cancel" class="btn btn-success btn-block" onclick="javascript:window.location='parents/parents';">
    </div>
</div>
</form>
</div>
</div>
</div>

<?php require APPROOT . '/views/parents/parents_footer.php'; ?>