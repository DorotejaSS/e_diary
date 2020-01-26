<?php

class Principal extends BaseModel
{
    public $result;

    public function __construct()
    {
       
    }

    public function fillStudentGroup()
    {
        require('./app/db.php');

        $sql = $conn->prepare('SELECT student_group.id, student_group.year_id, student_group.subgroup_id 
                               FROM student_group 
                               ORDER BY student_group.year_id ASC');

        $sql->execute();

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function fillSubjects()
    {
        require('./app/db.php');

        $sql = $conn->prepare('SELECT subjects.lecturer_id, subjects.title, users.first_name, users.last_name 
                               FROM subjects INNER JOIN users ON subjects.lecturer_id = users.id 
                               ORDER BY subjects.title ASC');

        $sql->execute();

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getSgData($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare ('SELECT DISTINCT subjects.title as subject, subjects.lecturer_id as id
                                FROM subjects INNER JOIN schedules ON subjects.id = schedules.subject_id 
                                WHERE schedules.student_group_id = :sg_id');
        $sql->execute (array(':sg_id' => $id));

        $this->result = $sql->fetchAll(PDO::FETCH_ASSOC);
        for ($i = 0; $i < count($this->result); $i++)
        {
            $sql = $conn->prepare ('SELECT grades.grade 
                                    FROM grades INNER JOIN students ON grades.student_id = students.id
                                    WHERE grades.lecturer_id = :id AND grades.closing = 0 AND students.student_group_id = :sg_id');
            $sql->execute (array(':id' => $this->result[$i]['id'], ':sg_id' => $id));

            $grades = $sql->fetchAll(PDO::FETCH_ASSOC);
        
            $i1 = 0;
            $i2 = 0;
            $i3 = 0;
            $i4 = 0;
            $i5 = 0;

            if (count($grades) != 0)
            {
                for ($z = 0; $z < count($grades); $z++)
                {
                    switch ($grades[$z]['grade'])
                    {
                        case '1':
                            $i1++;
                            break;

                        case '2':
                            $i2++;
                            break;

                        case '3':
                            $i3++;
                            break;

                        case '4':
                            $i4++;
                            break;

                        case '5':
                            $i5++;
                            break;
                    }
                }
            }

            $this->result[$i]['1'] = $i1;
            $this->result[$i]['2'] = $i2;
            $this->result[$i]['3'] = $i3;
            $this->result[$i]['4'] = $i4;
            $this->result[$i]['5'] = $i5;

            $i1 = 0;
            $i2 = 0;
            $i3 = 0;
            $i4 = 0;
            $i5 = 0;
        }
    }

    public function getSData($id)
    {
        require('./app/db.php');

        $sql = $conn->prepare ('SELECT grades.grade 
                                FROM grades 
                                WHERE grades.closing = 0 AND grades.lecturer_id = :id');
        $sql->execute (array(':id' => $id));

        $grades = $sql->fetchAll(PDO::FETCH_ASSOC);

        $i1 = 0;
        $i2 = 0;
        $i3 = 0;
        $i4 = 0;
        $i5 = 0;

        if (count($grades) != 0)
        {
            for ($z = 0; $z < count($grades); $z++)
            {
                switch ($grades[$z]['grade'])
                {
                    case '1':
                        $i1++;
                        break;

                    case '2':
                        $i2++;
                        break;

                    case '3':
                        $i3++;
                        break;

                    case '4':
                        $i4++;
                        break;

                    case '5':
                        $i5++;
                        break;
                }
            }
        }

        $this->result[0]['grades'] = '1';
        $this->result[0]['#ofgrades'] = $i1;

        $this->result[1]['grades'] = '2';
        $this->result[1]['#ofgrades'] = $i2;

        $this->result[2]['grades'] = '3';
        $this->result[2]['#ofgrades'] = $i3;

        $this->result[3]['grades'] = '4';
        $this->result[3]['#ofgrades'] = $i4;

        $this->result[4]['grades'] = '5';
        $this->result[4]['#ofgrades'] = $i5;

        $i1 = 0;
        $i2 = 0;
        $i3 = 0;
        $i4 = 0;
        $i5 = 0;
    }
}