<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Grades Page</title>
</head>
<body>

    <?php include './app/views/inc/header.php'; ?>

    <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse" bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
        <tr>
            <td width=100>Subject</td>
            <td width=100>Grades</td>
            <td width=100>Closing grade</td>
        </tr>

        <?php

        foreach ($this->data['subjects'] as $subjects)
        {
            echo "<tr>";
                echo "<td width=100>".$subjects['title']."</td>";
                echo "<td width=100>";
                foreach ($this->data['grades'] as $grades)
                {
                    
                    if ($grades['title'] == $subjects['title'])
                    {
                        if ($grades['closing'] != '1')
                        {
                            echo $grades['grade']." ";
                        }
                    }
                }
                echo "</td>";
                echo "<td width=100>";
                foreach ($this->data['grades'] as $grades)
                {
                    
                    if ($grades['title'] == $subjects['title'])
                    {
                        if ($grades['closing'] != '0')
                        {
                            echo $grades['grade']." ";
                        }
                    }
                }
                echo "</td>";
            echo "</tr>";
        }

        ?>

    </table>

    <?php include './app/views/inc/footer.php'; ?>
    
</body>
</html>