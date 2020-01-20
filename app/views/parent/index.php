<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Parent Page</title>
</head>
<body>

    <?php include './app/views/inc/header.php'; ?>

    <?php

    foreach ($this->data as $data)
    {
        echo '<a href="/parents/' . $data['id'] . '">' . $data['first_name'] . ' ' . $data['last_name'] . '</a> <br>';
    }
    var_dump($this->data);
    ?>

    <?php include './app/views/inc/footer.php'; ?>

</body>
</html>