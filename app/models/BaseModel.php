<?php
// TODO : PDO
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
        
        $results = [];
        while($row = $result->fetch_array(MYSQLI_BOTH)) {
           $results[] = $row;
        }
        $row = [];
        foreach ($result as $key => $value) {
            $row[] = $value;
        }
        $_SESSION['users'] = $row;
    }

    public function getOne($table, $id)
    {        
        require('./app/db.php');
        
        $sql = 'select * from '.$table. ' where id ="'.$id.'"';
        $result = $conn->query($sql);
        $row = $result->fetch_array(MYSQLI_BOTH);
        $_SESSION['user_data'] = $row;
    
    }

}