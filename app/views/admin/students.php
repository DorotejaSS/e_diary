<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Welcome</title>
</head>
<body>
    
    <?php include ('././app/views/inc/header.php') ?>

    </br></br></br>
    <h3>Students</h3>
        <table id="myTable">
            <tr>
                <th>ID:</td> 
                <th>First Name:</th>
                <th>Last Name:</th>
                <th>Birth Date:</th>
                <th>Social ID:</th>
                <th>Created at:</th>
                <th>Updated at:</th>
                <th>Student Group ID:</th> 
            </tr>
       
                <?php foreach ($this->data as $key => $value) : ?>
                <?php $id = $value['id']; ?>
                    
            <tr> 
                <td><a href="/students/<?= $id ?>"> <?php echo $value['id']; ?></a></td>
                <td><a href="/students/<?= $id ?>"> <?php echo $value['first_name']; ?></a></td>
                <td><a href="/students/<?= $id ?>"> <?php echo $value['last_name']; ?></a></td>
                <td> <?php echo $value['date_of_birth']; ?> </td>
                <td> <?php echo $value['social_id']; ?> </td>
                <td> <?php echo $value['created_at']; ?> </td>
                <td> <?php echo $value['updated_at']; ?></td>
                <td> <?php echo $value['student_group_id']; ?> </td>
            </tr>

                <?php endforeach; ?>

        </table> 
            
<a class="scroll" href="#"><img src="././public/img/top.png" alt="top" width="50" height="50" onmouseover="this.src='././public/img/top1.png'" alt="top1" onmouseout="this.src='././public/img/top.png'" alt="top" /></a>
<script>
$(document).ready(function(){

    //if user scroll down then show the scroll image with fade effect
    $(window).scroll(function(){
        if ($(this).scrollTop() > 500) {
            $('.scroll').fadeIn();
        } 
        else 
        {
            $('.scroll').fadeOut();
        }
    });

    //if user click on scroll link then scroll window to top
    $('.scroll').click(function(){
    $('html, body').animate({scrollTop : 0},1600);

          return false;
    });

});
</script>

    <?php include ('././app/views/inc/footer.php') ?>

</body>
</html>

