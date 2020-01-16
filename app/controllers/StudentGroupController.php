<?php

class StudentGroupController 
{
    public function __construct($request)
    {
        $this->request = $request;
    }

    public function showAll()
    {
        $student = new Student($this->request);
        $student->studentGroups();
        
        $view = new View();
        $view->data['student_groups'] = $student->studentGroups();
        $view->loadPage('admin', 'studentgroups');
        
    }

    public function index()
    {
        $id = $this->request->url_parts[1];
        $student = new Student();
    }
}