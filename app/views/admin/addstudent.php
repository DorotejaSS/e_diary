<title>Add new student</title>
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
                <a class="nav-link" href="/students">Students</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-success btn-block" href="/logout">Sign Out</a>
            </li>
        </ul>
    </div>
</nav>
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
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
                            <label>Birth Date</label>
                            <input type="date" name="date_of_birth" class="form-control form-control">
                        </div>
                        <div class="form-group">
                            <label>Social Id</label>
                            <input type="text" name="social_id" class="form-control form-control">
                        </div>
                        <div class="form-group">
                            <label>Year:</label>
                                <select name="year_id" class="form-control form-control">
                                        <option></option>
                                    <?php foreach ($this->data['years'] as $year) : ?>
                                        <option value="<?= $year['id']; ?>"><?= $year['title']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                        </div>
                        <div class="form-group">
                            <label>Subgroup:</label>
                                <select name="subgroup" class="form-control form-control">
                                        <option></option>
                                    <?php foreach ($this->data['subgroups'] as $subgroup) : ?>
                                        <option value="<?= $subgroup['id']; ?>"><?= $subgroup['title']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                        </div>
                        <div class="form-group">
                            <label>Parent:</label>
                                <select name="parent" class="form-control form-control">
                                        <option></option>
                                    <?php foreach ($this->data['parents'] as $parent) : ?>
                                        <option value="<?= $parent['id']; ?>"><?= $parent['first_name'].' '.$parent['last_name']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                        </div>
                        <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                    </form>
                </div>
            </div>
        </div>