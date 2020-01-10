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

    public function addSubject()
    {
        echo 'ovde dodajemo novi predmet';
        $view = new View();
        $view->loadPage('admin', 'addsubject');
        die;
        if (isset($_POST['submit'])) {
            $user = new User();
            $user->add();
            header('Location: /users');
        }
    }
}
    
        
        
        
    