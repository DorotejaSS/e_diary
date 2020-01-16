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
            <option selected value="0">--- Choose student group ---</option>
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
                <td width=100 class="subjectTd" id="mon1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="tue1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="wed1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="thr1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="fri1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="sat1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>
            <tr>
                <td width=100>2.</td>
                <td width=100 class="subjectTd" id="mon2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="tue2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="wed2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="thr2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="fri2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="sat2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>
            <tr>
                <td width=100>3.</td>
                <td width=100 class="subjectTd" id="mon3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="tue3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="wed3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="thr3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="fri3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="sat3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>
            <tr>
                <td width=100>4.</td>
                <td width=100 class="subjectTd" id="mon4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select> </td>
                <td width=100 class="subjectTd" id="tue4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="wed4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="thr4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="fri4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="sat4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>
            <tr>
                <td width=100>5.</td>
                <td width=100 class="subjectTd" id="mon5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="tue5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="wed5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="thr5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="fri5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="sat5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>
            <tr>
                <td width=100>6.</td>
                <td width=100 class="subjectTd" id="mon6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="tue6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="wed6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="thr6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="fri6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="sat6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>
            <tr>
                <td width=100>7.</td>
                <td width=100 class="subjectTd" id="mon7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="tue7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="wed7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="thr7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="fri7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td width=100 class="subjectTd" id="sat7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>
        </table>
        <br>
        <button hidden id="editBttn">Edit</button> <button hidden id="cancelBttn">Cancel</button> <button hidden id="saveBttn">Save</button>

        <?php include './app/views/inc/footer.php'; ?>

    </body>
</html>