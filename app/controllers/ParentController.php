<?php

class ParentController extends BaseController
{
    private $role_id = '5';

    public function __construct($request)
    {
        $this->request = $request;

        $this->checkSession();
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
    }

    public function index()
    {
        $model = new Parents($this->request);

        $view = new View();
        $view->data = $model->child_data;
        $view->loadPage('parent', 'index');
    }

    public function showGrades()
    {
        
        $model = new Parents($this->request);

        $view = new View();
        $view->data = $model->grades_data;
        $view->loadPage('parent', 'grades');
    }
}