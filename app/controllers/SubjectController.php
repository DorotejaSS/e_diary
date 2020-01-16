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
        var_dump($view->data);
        $view->loadPage('admin', 'subjects');
    }
}