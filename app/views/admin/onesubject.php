<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=]; ?>, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Subject <?= $this->data['subject']['title']; ?></title>
    </head>
    <body>
        <?php $id = $this->data['subject']['id'];?>

        <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse"
            bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
            <h3><?php echo $this->data['prof_data'][0]['title'] ?? false; ?></h3>
            <tr>
                <td width=100>ID:</td> 
                <td width=100>Title</td> 
                <td width=100>Lecturer</td>
            </tr> 
            
            <button><a href="/subjects/<?= $id ?>/edit">EDIT</a></button>
            <button><a href="/subjects/<?= $id; ?>/delete">DELETE</a></button>
                
            <tr> 
                <td><?php echo $this->data['subject']['id']; ?></td> 
                <td><?php echo $this->data['subject']['title']; ?></td> 
                <td><?php echo $this->data['lecturer_subject'][0]['first_name'].' '.$this->data['lecturer_subject'][0]['last_name']; ?></td> 
            </tr>  
        </table> 