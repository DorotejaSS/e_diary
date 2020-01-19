<title>Schedule</title>
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
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="btn btn-success btn-block" href="/logout">Logout</a>
        </li>
    </ul>
</div>
</nav>
<div class="row">
    <div class="col-md-4 mx-auto">
        <div class="card card-body bg-light" style="box-shadow: 10px 10px 5px grey; border-radius: 0 0 0 0;">
        <select id="select" class="form-control form-control">
            <option selected value="0">--- Choose student group ---</option>
        </select>
</div>
</div>
</div>
    <h3>Shedule</h3>
        <table id="myTable">
            <tr>
                <th>Class:</th>
                <th>Monday:</th>
                <th>Tuesday:</th>
                <th>Wednesday:</th>
                <th>Thursday:</th>
                <th>Friday:</th>
                <th>Satuday:</th>
            </tr>
            <tr>
                <td>1.</td>
                <td class="subjectTd" id="mon1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="tue1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="wed1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="thr1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="fri1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="sat1"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>

            <tr>
                <td>2.</td>
                <td class="subjectTd" id="mon2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="tue2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="wed2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="thr2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="fri2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="sat2"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>

            <tr>
                <td>3.</td>
                <td class="subjectTd" id="mon3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="tue3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="wed3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="thr3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="fri3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="sat3"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>

            <tr>
                <td>4.</td>
                <td class="subjectTd" id="mon4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select> </td>
                <td class="subjectTd" id="tue4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="wed4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="thr4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="fri4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="sat4"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>

            <tr>
                <td>5.</td>
                <td class="subjectTd" id="mon5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="tue5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="wed5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="thr5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="fri5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="sat5"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>

            <tr>
                <td>6.</td>
                <td class="subjectTd" id="mon6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="tue6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="wed6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="thr6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="fri6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="sat6"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>

            <tr>
                <td>7.</td>
                <td class="subjectTd" id="mon7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="tue7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="wed7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="thr7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="fri7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
                <td class="subjectTd" id="sat7"> <select hidden class="subjects"> <option value="0" selected>-- Choose a subject --</option> </select></td>
            </tr>

        </table>
        <br>
        <button hidden id="editBttn">Edit</button> <button hidden id="cancelBttn">Cancel</button> <button hidden id="saveBttn">Save</button>
