<?php

class StudentController
{
    public function __construct($request)
    {
         $this->request = $request;
    }

    public function showAll()
    {
        $base_model = new BaseModel();
        $base_model->showAll('students');
    
        $view = new View();
        $view->data = $base_model->showAll('students');
        $view->loadPage('admin', 'students');
    }

    public function getOne()
    {
        $id = $this->request->url_parts[1];
        $parent = new Parents($this->request);
        $parent_data = $parent->parentStudentCollation($id);
        $base_model = new BaseModel();
        $get_one_student = $base_model->getOne('students', $id);

        $view = new View();
        $view->data['parent_data'] = $parent_data[0] ?? array();
        $view->data['student_data'] = $get_one_student[0];
        $view->loadPage('admin', 'onestudent');
    }

    public function edit()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $get_one_student = $base_model->getOne('students', $id);

        $view = new View();
        $view->data['student'] = $get_one_student[0];
        $view->loadPage('admin', 'editstudent'); 

         if (isset($this->request->post_params['submit'])) {
            $student = new Student($this->request);
            $student->update($id);
            header('Location: /students');
        }
    }

    public function delete()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $base_model->delete('students', $id);
        header('Location: /students');
    }
    


}