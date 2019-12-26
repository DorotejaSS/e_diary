<?php
// ovim baznim modelom komuniciramo sa bazom preko PDO (nisam nikad radila ovo tako da ne znam da objasnim dok ne naucim :D)
class BaseModel
{

    public function __construct()
    {   
    }

    public function showAll($table)
    {
         require('./app/db.php');
         $sql = 'select * from '.$table.'';
         $result = $conn->query($sql);
         
        print "
            <table border=\"5\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-  collapse: collapse\" bordercolor=\"#808080\" width=\"100&#37;\" bgcolor=\"#C0C0C0\">
            <tr>
            <td width=100>ID:</td> 
            <td width=100>First Name</td> 
            <td width=100>Last Name</td> 
            <td width=100>Email</td> 
            <td width=100>Role Id</td>
            <td width=100>Password</td> 
            <td width=100>Updated at</td> 
            <td width=100>Created at</td> 
            <td width=100>Last Login at</td> 
            </tr>"; 
        while($row = $result->fetch_array(MYSQLI_BOTH))
        { 
            $id = $row['id'];
            print "<tr>"; 
            print '<td> <a href="/users/'.$id.'">'. $row['id'].'</a></td>'; 
            print '<td> <a href="/users/'.$id.'">'. $row['first_name'].'</a></td>'; 
            print '<td> <a href="/users/'.$id.'">'. $row['last_name'].'</a></td>'; 
            print "<td>" . $row['email'] . "</td>";
            print "<td>" . $row['role_id'] . "</td>";
            print "<td>" . $row['password'] . "</td>";
            print "<td>" . $row['updated_at'] . "</td>";
            print "<td>" . $row['created_at'] . "</td>"; 
            print "<td>" . $row['last_login_at'] . "</td>"; 
            print "</tr>"; 
        } 
        print "</table>"; 
    }

    public function getOne($table, $id)
    {
        var_dump('u modelu si');
        
         require('./app/db.php');
        var_dump($_GET);
        $sql = 'select * from '.$table. ' where id ="'.$id.'"';
        $result = $conn->query($sql);
        $row = $result->fetch_array(MYSQLI_BOTH);
        var_dump($row);
        
    }
}