<?php

class StudentGroupController 
{
    public function __construct($request)
    {
        $this->request = $request;
        var_dump($this->request);
    }

    public function showAll()
    {
        $base_model = new BaseModel();
        $students = $base_model->showAll('students');
        $student_data = [];
        foreach ($students as $index => $student) {
            $student_id = $student['id'];

            $birth_date = $student['date_of_birth'];
            $birth_year = explode('-', $birth_date);
            $birth_year = $birth_year[0];

            $start_year = $birth_year + 7;
            $finish_year = $start_year + 8;

            $student_data[] = array(
                                1 => $student_id,
                                2 => $start_year,
                                3 => $finish_year
            );
        }
        
        $student = new Student($this->request);
        $student->studentGroup($student_data);
        
    }
}