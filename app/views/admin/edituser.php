<div class="row">
    <div class="col-md-6 mx-auto">
        <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
            <h2>Edit user</h2>
            <form action="" method="post">
                <div class="form-group">
                    <label>First name:</label>
                    <input type="text" class="form-control form-control" value="<?php echo $this->data['user']['first_name'];?>" name="first_name" value="">
                </div>
                <div class="form-group">
                    <label>Last Name:</label>
                    <input type="text" class="form-control form-control" value="<?php echo $this->data['user']['last_name'];?>" name="last_name">
                </div>
                <div class="form-group">
                    <label>Email address:</label>
                    <input type="email" class="form-control form-control" value="<?php echo $this->data['user']['email'];?>" name="email">
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" class="form-control form-control" value="<?php echo $this->data['user']['password'];?>" name="password">
                </div>
                
                <div class="form-group">
                    <label>Role:</label>
                    <select name="role_id" class="form-control form-control">
                        <?php if($this->data['user']['role_id'] === '1') echo '<option selected="true" value="1">Admin</option>'?>
                        <?php if($this->data['user']['role_id'] === '2') echo '<option selected="true" value="2">Principal</option>'?>
                        <?php if($this->data['user']['role_id'] === '3') echo '<option selected="true" value="3">Professor</option>'?>
                        <?php if($this->data['user']['role_id'] === '4') echo '<option selected="true" value="4">Teacher</option>'?>
                        <?php if($this->data['user']['role_id'] === '5') echo '<option selected="true" value="5">Parent</option>'?>
                        <option value="1">Admin</option>
                        <option value="2">Principal</option>
                        <option value="3">Professor</option>
                        <option value="4">Teacher</option>
                        <option value="5">Parent</option>
                    </select>
                </div>
                    <?php $subj_title = $this->data['prof_data'][0]['title'] ?? array(); ?>
                    <?php if ($this->data['user']['role_id'] === '3') : ?>
                        <div class="form-group">
                            <label>Subject:</label>
                            <select name="subject" class="form-control form-control">

                                <?php foreach ($this->data['subjects'] as $key => $value) : ?>
                                    <?php if($value['title'] === $subj_title) echo '<option selected="true">'.$subj_title;'</option>'?>

                                        <option value="<?php echo $value['title'];?>"><?php echo $value['title']; ?></option>

                                <?php endforeach;?>

                                    <?php endif; ?> 
                            </select>   

                        </div>
                <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
            </form>
        </div>
    </div>
</div>