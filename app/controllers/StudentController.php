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
        $this->getParents(); die;
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $get_one_student = $base_model->getOne('students', $id);

        $view = new View();
        $view->data['prof_data'] = $get_by_role_id  ?? array();
        $view->data['user'] = $get_one_user[0];
        $view->loadPage('admin', 'showoneuser');
    }

    public function getParents()
    {
        $base_model = new BaseModel();
        $parents = $base_model->getUsersByRoleId('5');
        $students = $base_model->showAll('students');
        
        $student_ids = [];
        foreach ($students as $key => $student) {
            $student_ids['student_id'][] = $student['id'];
        }
        
        $parent_ids = [];
        foreach ($parents as $key => $parent) {
            $parent_ids['parent_id'][] = $parent['id']; 
        }
        var_dump($parent_ids);
        $parent = new Parents($this->request);
        $parent->asignParentsToStudent($parent_ids, $student_ids);
    }


}