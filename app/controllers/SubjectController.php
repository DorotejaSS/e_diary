<?php

class SubjectController extends AdminController
{
    public function __construct($request)
    {
        $this->request = $request;
    }

    public function showAll()
    {   
        var_dump('PREDMETI');
        $subject = new Subject();
        $subject_data = $subject->lecturerSubject();

        $view = new View();
        $view->data = $subject_data;
        $view->loadPage('admin', 'subjects');
    }

    public function getOne()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $get_one_subject = $base_model->getOne('subjects', $id);
        $lecturer_subj = $base_model->getOne('users', $get_one_subject[0]['lecturer_id']);

        $view = new View();
        $view->data['lecturer_subject'] = $lecturer_subj;
        $view->data['subject'] = $get_one_subject[0];
        $view->loadPage('admin', 'onesubject');
    }

    public function addSubject()
    {
        $view = new View();
        $subject = new Subject();
        $lecturers = [];
        foreach ($subject->getUsersByRoleId('3') as $value) {
            $lecturers[] = $value;
        }
        $view->data['lecturers'] = $lecturers;
        $view->loadPage('admin', 'addsubject');
        var_dump($this->request->post_params);
    
        if (!empty($this->request->post_params['title']) 
            && !empty($this->request->post_params['lecturers']) 
            && isset($this->request->post_params['submit'])) {
                $subject->addNewSubject($this->request->post_params['title'], $this->request->post_params['lecturers'][0]);
        }
    }

    public function edit()
    {
        $view = new View();
        $id = $this->request->url_parts[1];
    
        $base_model = new BaseModel();
        $base_model->getOne('subjects', $id);
        $base_model->getUsersByRoleId('3');

        $view->data['subject_data'] = $base_model->getOne('subjects', $id)[0];
        $view->data['lecturers'] = $base_model->getUsersByRoleId('3');
        $view->loadPage('admin', 'editsubject'); die;

        if (isset($this->request->post_params['submit'])) {
            $permission = new Permission();
            $permission->edit($id);
            header('Location: /permissions');
        }
    }
}
    
        
        
        
    