<?php $id = $this->data['subject_data']['id'];?>
<title>Subject Edit</title>
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
                    <a class="nav-link" href="/subjects/<?= $id;?>">Subject</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="btn btn-success btn-block" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
</nav>
<div class="row">
    <div class="col-md-6 mx-auto">
        <div class="card card-body bg-light mt-5" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
            <h2>Edit subject</h2>
                <form action="" method="post">
                    <div class="form-group">
                        <label>Subject Name:</label>
                        <input type="text" name="subject" class="form-control form-control" value="<?php echo $this->data['subject_data']['title']; ?>"><br>
                    </div>
                        <input type="submit" name="submit" value="Submit" class="btn btn-success btn-block">
                </form>
        </div>
    </div>
</div>
