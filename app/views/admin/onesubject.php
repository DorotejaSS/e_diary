<title>Subject <?= $this->data['subject']['title']; ?></title>   
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
                    <a class="nav-link" href="/subjects">Subjects</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="btn btn-success btn-block" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
</nav>

        <?php $id = $this->data['subject']['id'];?>
        
</br></br></br>
    <h3>Subject</h3>
        <table id="myTable">
                <h3><?php echo $this->data['prof_data'][0]['title'] ?? false; ?></h3>
                    <tr>
                        <th>ID:</th> 
                        <th>Title:</th> 
                        <th>Lecturer:</th>
                        <th>Edit:</th>
                        <th>Delete:</th>
                    </tr>              
                    <tr> 
                        <td><?php echo $this->data['subject']['id']; ?></td> 
                        <td><?php echo $this->data['subject']['title']; ?></td> 
                        <td><?php echo $this->data['lecturer_subject'][0]['first_name'].' '.$this->data['lecturer_subject'][0]['last_name']; ?></td> 
                        <td><a class="btn btn-primary" href="/subjects/<?= $id ?>/edit">Edit</a></td>
                        <td><a class="btn btn-danger" href="/subjects/<?= $id; ?>/delete">Delete</a></td>
                    </tr>  
        </table> 