<?php

class Schedule extends BaseModel
{
    public function __construct()
    {
        if (isset($_POST['func']))
        {
            switch ($_POST['func'])
            {
                case 'getSubGroup':
                    $this->getSubGroup();
                break;
                
                default:
                    echo 'Nista!';

            }
        }
    }

    public function getSubGroup()
    {
        require('./app/db.php');

        $sql = $conn->prepare('SELECT student_group.id, student_group.year_id, student_group.subgroup_id FROM student_group ORDER BY student_group.id ASC');

        $sql->execute ();

        $result = $sql->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode($result, 256);
    }
}
