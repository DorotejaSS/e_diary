<?php $id = $this->data['subject']['id'];?>
 
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
