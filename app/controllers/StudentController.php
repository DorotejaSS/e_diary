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
        var_dump($parent_ids);
        $parent = new Parents($this->request);
    }

    public function delete()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $base_model->delete('students', $id);
        header('Location: /students');
    }

    public function add()
    {
        $student = new Student($this->request);
        $years = $student->years();
        $subgroups = $student->subgroups();
        $parents = $student->getUsersByRoleId('5');

        $view = new View();
        $view->data['parents'] = $parents;
        $view->data['years'] = $years;
        $view->data['subgroups'] = $subgroups;
        $view->loadPage('admin', 'addstudent');
        

        $first_name = $this->request->post_params['first_name'] ?? array();
        $last_name = $this->request->post_params['last_name'] ?? array();
        $date_of_birth = $this->request->post_params['date_of_birth'] ?? array();
        $social_id = $this->request->post_params['social_id'] ?? array();
        $year_id = $this->request->post_params['year_id'] ?? array();
        $subgroup_id = $this->request->post_params['subgroup'] ?? array();
        $parent_id = $this->request->post_params['parent'] ?? array();

        
        if (!empty($first_name) && !empty($last_name) 
        && !empty($date_of_birth) && !empty($social_id) 
        && !empty($year_id) && !empty($subgroup_id)
        && !empty($parent_id)
        && isset($this->request->post_params['submit'])) {
            $student_group_id = $student->alignToStudentGroup($year_id, $subgroup_id); 
            $student->add($student_group_id);
        }
    }
    


}