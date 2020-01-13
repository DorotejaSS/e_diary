<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <script  type="text/javascript" src="./././public/js/jquery-3.4.1.js"></script>
        <script  type="text/javascript" src="./././public/js/schedule.js"></script>

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
                <td width=100><input hidden type="text" name="mon1" id="mon1"></td>
                <td width=100><input hidden type="text" name="tue1" id="tue1"></td>
                <td width=100><input hidden type="text" name="wed1" id="wed1"></td>
                <td width=100><input hidden type="text" name="thr1" id="thr1"></td>
                <td width=100><input hidden type="text" name="fri1" id="fri1"></td>
                <td width=100><input hidden type="text" name="sat1" id="sat1"></td>
            </tr>
            <tr>
                <td width=100>2.</td>
                <td width=100><input hidden type="text" name="mon2" id="mon2"></td>
                <td width=100><input hidden type="text" name="tue2" id="tue2"></td>
                <td width=100><input hidden type="text" name="wed2" id="wed2"></td>
                <td width=100><input hidden type="text" name="thr2" id="thr2"></td>
                <td width=100><input hidden type="text" name="fri2" id="fri2"></td>
                <td width=100><input hidden type="text" name="sat2" id="sat2"></td>
            </tr>
            <tr>
                <td width=100>3.</td>
                <td width=100><input hidden type="text" name="mon3" id="mon3"></td>
                <td width=100><input hidden type="text" name="tue3" id="tue3"></td>
                <td width=100><input hidden type="text" name="wed3" id="wed3"></td>
                <td width=100><input hidden type="text" name="thr3" id="thr3"></td>
                <td width=100><input hidden type="text" name="fri3" id="fri3"></td>
                <td width=100><input hidden type="text" name="sat3" id="sat3"></td>
            </tr>
            <tr>
                <td width=100>4.</td>
                <td width=100><input hidden type="text" name="mon4" id="mon4"></td>
                <td width=100><input hidden type="text" name="tue4" id="tue4"></td>
                <td width=100><input hidden type="text" name="wed4" id="wed4"></td>
                <td width=100><input hidden type="text" name="thr4" id="thr4"></td>
                <td width=100><input hidden type="text" name="fri4" id="fri4"></td>
                <td width=100><input hidden type="text" name="sat4" id="sat4"></td>
            </tr>
            <tr>
                <td width=100>5.</td>
                <td width=100><input hidden hidden type="text" name="mon5" id="mon5"></td>
                <td width=100><input hidden type="text" name="tue5" id="tue5"></td>
                <td width=100><input hidden type="text" name="wed5" id="wed5"></td>
                <td width=100><input hidden type="text" name="thr5" id="thr5"></td>
                <td width=100><input hidden type="text" name="fri5" id="fri5"></td>
                <td width=100><input hidden type="text" name="sat5" id="sat5"></td>
            </tr>
            <tr>
                <td width=100>6.</td>
                <td width=100><input hidden type="text" name="mon6" id="mon6"></td>
                <td width=100><input hidden type="text" name="tue6" id="tue6"></td>
                <td width=100><input hidden type="text" name="wed6" id="wed6"></td>
                <td width=100><input hidden type="text" name="thr6" id="thr6"></td>
                <td width=100><input hidden type="text" name="fri6" id="fri6"></td>
                <td width=100><input hidden type="text" name="sat6" id="sat6"></td>
            </tr>
            <tr>
                <td width=100>7.</td>
                <td width=100><input hidden type="text" name="mon7" id="mon7"></td>
                <td width=100><input hidden type="text" name="tue7" id="tue7"></td>
                <td width=100><input hidden type="text" name="wed7" id="wed7"></td>
                <td width=100><input hidden type="text" name="thr7" id="thr7"></td>
                <td width=100><input hidden type="text" name="fri7" id="fri7"></td>
                <td width=100><input hidden type="text" name="sat7" id="sat7"></td>
            </tr>
        </table> 
        <button id="editBttn">Edit</button>

        <?php include './app/views/inc/footer.php'; ?>

    </body>
</html>