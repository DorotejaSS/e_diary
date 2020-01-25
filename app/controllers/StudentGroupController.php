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
        $student_groups = $student->studentGroupsForView();
        
        $view = new View();
        $view->data['student_groups'] = $student_groups;
        $view->loadPage('admin', 'studentgroups');
    }

    public function index()
    {
        $id = $this->request->url_parts[1];
        $student = new Student($this->request);
        $students = $student->studentsInGroups($id);
        $main_teacher = $student->mainTeacher($id);

        $view = new View();
        $view->data['students'] = $students;
        $view->data['main_teacher'] = $main_teacher;
        $view->loadPage('admin', 'onestudentgroup');
    }
}