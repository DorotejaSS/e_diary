<div class="row">
    <div class="col-md-6 mx-auto">
        <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
            <h2>Add new permission</h2>
            <form action="" method="post">
                <div class="form-group">
                    <label>Permission:</label> 
                        <input type="text" name="permission" class="form-control form-control">
                        </br>
                        <div class="save" align=center>
                            <input type="submit" name="submit" value="Save" class="btn btn-success">
                        </div>
                </div>
                </br>
                <div class="form-group mr-2" align="center">

                    <?php foreach ($this->data['role_data'] as $index => $data) : ?>

                        <label>
                            <input type="checkbox" name="roles[]" value="<?php echo $data['id']; ?>">
                            <span><?php echo $data['title']; ?></span><br>
                        </label>
            
                    <?php endforeach; ?>

                </div>
                <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
            </form>
        </div>
    </div>
</div>