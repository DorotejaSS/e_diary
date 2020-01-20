<div class="row">
    <div class="col-md-6 mx-auto">
        <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
            <h2>Edit permission</h2>
                <form action="" method="post">
                    <label>Permission:</label>
                        <div class="form-group">
                            <input type="text" name="permission" class="form-control form-control" value="<?php echo $this->data['title']; ?>">
                        </div>
                    <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                </form>
        </div>
    </div>
</div>