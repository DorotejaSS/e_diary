<?php $id = $this->data['user']['id'];?>
<!DOCTYPE html>
<html lang=en>
    <head>
        <meta charset=UTF-8>
        <meta name=viewport content=width=device-width, initial-scale=1.0>
        <meta http-equiv=X-UA-Compatible content=ie=edge>
            <title>User</title>
    </head>
    <body>
    
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 fixed-top">
            <button class="navbar-toggler" type="button" 
                    data-toggle="collapse" 
                    data-target="#navbarsExampleDefault" 
                    aria-controls="navbarsExampleDefault" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto" >
                    <li class="nav-item">
                        <a class="nav-link" href="/admin">Admin page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/users">Users</a>
                    </li>
                    <li class="nav-item mr-2">
                        <a class="btn btn-success btn-block" href="/users/<?= $id ?>/edit">Edit</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-success btn-block" href="/users/<?= $id; ?>/delete">Delete</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="btn btn-success btn-block" href="/logout">Sign Out</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="subject">
            <h3><?php echo $this->data['prof_data'][0]['title'] ?? false; ?></h3>
        </div>
        
        <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>First Name:</th> 
                <th>Last Name:</th> 
                <th>Email:</th> 
                <th>Role ID:</th>
                <th>Password:</th> 
                <th>Updated at:</th> 
                <th>Created at:</th> 
                <th>Last Login at:</th> 
            </tr>
       
            <tr> 
                <td><?php echo $this->data['user']['id']; ?></td> 
                <td><?php echo $this->data['user']['first_name']; ?></td> 
                <td><?php echo $this->data['user']['last_name']; ?></td> 
                <td><?php echo $this->data['user']['email']; ?></td>
                <td><?php echo $this->data['user']['role_id']; ?></td>
                <td><?php echo $this->data['user']['password']; ?></td>
                <td><?php echo $this->data['user']['updated_at']; ?></td>
                <td><?php echo $this->data['user']['created_at']; ?></td> 
                <td><?php echo $this->data['user']['last_login_at']; ?></td> 
            </tr>  
        </table> 
    
        <?php if (isset($this->data['child_data'])) : ?>
            
            <?php foreach ($this->data['child_data'] as $key => $child) : ?>
                <h3 class="child">Child</h3>
                <table id="myTable">
                    <tr>
                        <th>ID:</th> 
                        <th>First Name:</th> 
                        <th>Last Name:</th> 
                        <th>Date Of Birth:</th> 
                        <th>Social ID:</th>
                        <th>Student Group ID:</th> 
                    </tr> 
                    <tr> 
                        <td><?php echo $child['id']; ?></td> 
                        <td><?php echo $child['first_name']; ?></td> 
                        <td><?php echo $child['last_name']; ?></td> 
                        <td><?php echo $child['date_of_birth']; ?></td>
                        <td><?php echo $child['social_id']; ?></td>
                        <td><?php echo $child['student_group_id']; ?></td>
                    </tr>  
                </table> 
            <?php endforeach; ?>
        <?php endif; ?>