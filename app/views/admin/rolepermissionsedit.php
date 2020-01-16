<title>Edit permissions for <?= $this->data['role'][0]['title']; ?></title>
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

            <li class="nav-item">
                <a class="nav-link" href="/roles">Roles</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>

</br></br></br>
    <h3>Edit role permission</h3>
    <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>Role Name:</th>
            </tr>
            <tr>
                <td><?php echo $this->data['role'][0]['id'];?></td>
                <td><?php echo $this->data['role'][0]['title'];?></td>
            </tr>
            <tr>
                <td colspan="2">
                    <form action="" method="post">

                    <div class="form-group">
                        <?php foreach ($this->data['permissions'] as $key => $value) : ?>

                            <label>
                                <div class="permission-checkbox mr-2">
                                    <input type="checkbox" name="allowed[]" value="<?php echo $value['id']; ?>" 
                                    <?php echo ($value['access'] === '1') ? 'checked' : '' ?>>
                                    <span><?php echo $value['title']; ?></span>
                                </div>
                            </label>

                        <?php endforeach; ?>

                    </div>
                            <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                    </form>    
                </td>
            </tr>
        </table>
            
                       <!-- <form action="" method="post">

                            <?php foreach ($this->data['permissions'] as $key => $value) : ?>
            
                                <label>
                            <input type="checkbox" name="allowed[]" value="<?php echo $value['id']; ?>" 
                            <?php echo ($value['access'] === '1') ? 'checked' : '' ?>>
                            <span><?php echo $value['title']; ?></span><br>
                            </label>

                            <?php endforeach; ?>

                            <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
            </form>-->
        