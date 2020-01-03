<?php

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
        while($row = $result->fetch_assoc()) {
           $results[] = $row;
        }
        return $results;
    }
 
    public function getOne($table, $id)
    {        
        require('./app/db.php');
        
        $sql = 'select * from '.$table. ' where id ="'.$id.'"';
        $result = $conn->query($sql);
        
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

}