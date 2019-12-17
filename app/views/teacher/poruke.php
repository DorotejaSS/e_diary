<?php require APPROOT . '/views/teacher/teacher_header.php'; ?>
<div class="jumbotrone jumbotrone-fluid text-center">
<div class="container">
<h1 class="display-3"><?php echo $data['title']; ?></h1>
</div>
</div>

<div class="row">
<div class="col-md-6 mx-auto">
<div class="card card-body bg-light mt-5">
<h2>Message</h2>
<p>Please fill your message</p>
<form action="<?php echo URLROOT_teacher; ?>/" method="post">

<div class="form-group">
<label for="message">Message: <sup>*</sup></label>
<input type="message" name="message" class="form-control form-control-lg <?php echo (!empty($data['message_err'])) ? 'is invalid' : ''; ?>" value="<?php echo $data['message']; ?>">
<span class="invalid-feedback d-block"><?php echo $data['message_err']; ?></span>
</div>
<div class="row">
    <div class="col">
        <input type="submit" value="Send" class="btn btn-success btn-block">
    </div>
</div>
</form>
</div>
</div>
</div>

<?php require APPROOT . '/views/teacher/teacher_footer.php'; ?>