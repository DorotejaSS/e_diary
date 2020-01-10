<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <script src="./././public/js/jquery-3.4.1.js"></script>
        <script src="./././public/js/schedule.js"></script>

        <title>Schedule</title>

    </head>

    <body>
        <?php include './app/views/inc/header.php'; ?>

        <select id="select">
            <option selected value="0">--- Chose student group ---</option>
        </select>
        <br><br>

        <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse" bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
            <tr>
                <td width=100>Class</td>
                <td width=100>Monday</td>
                <td width=100>Tuesday</td>
                <td width=100>Wednesday</td>
                <td width=100>Thursday</td>
                <td width=100>Friday</td>
                <td width=100>Satuday</td>
            </tr>
            <tr>
                <td width=100>1.</td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
            </tr>
            <tr>
                <td width=100>2.</td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
            </tr>
            <tr>
                <td width=100>3.</td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
            </tr>
            <tr>
                <td width=100>4.</td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
            </tr>
            <tr>
                <td width=100>5.</td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
            </tr>
            <tr>
                <td width=100>6.</td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
            </tr>
            <tr>
                <td width=100>7.</td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
                <td width=100></td>
            </tr>
        </table> 
        <p id="para"></p>

        <?php include './app/views/inc/footer.php'; ?>

    </body>
</html>