<?php

    class ProfessorController extends BaseController 
    {
        protected $role_id = '3';

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

        public function homePage()
        {
           $view = new View();
           $view->loadPage('professor', 'index');
        }

        public function mainClass()
        {
            $lecturer_id = $this->request->url_parts[1];
            $student = new Student($this->request);
            $student_group_id = $student->mainTeacherClass($lecturer_id);
            $students = $student->studentsInGroups($student_group_id);
            
            $view = new View();
            $view->data = $students;
            $view->loadPage('professor', 'mainclass');

        }

        public function otherClasses()
        {
            $lecturer_id = $this->request->url_parts[1];
            $student = new Student($this->request);
            $classes = $student->otherClasses($lecturer_id);
            // $main_teacher_id = [];
            // foreach ($classes as $key => $main_teacher_data) {
            //    $main_teacher_id[] = $main_teacher_data['main_teacher_id'];
            // }
            // $main_teacher = $student->mainTeacherForClass($main_teacher_id);
               

            $view = new View();
            $view->data['students'] = $classes;
            // $view->data['main_teacher'] = $main_teacher;
            $view->loadPage('professor', 'otherclasses');
        }

        public function gradesTeacherView()
        {
           $student_id = $this->request->url_parts[1];
           $lecturer_id = $_SESSION['user_data']['id'];
           $student = new Student($this->request);
           $grades = $student->getGrades($student_id, $lecturer_id); 
           
           $view = new View();
           $view->data['grades'] = $grades;
           $view->loadPage('professor', 'studentgrades');
        }

        public function gradesMainTeacherView()
        {
            $student_id = $this->request->url_parts[1];
            $student = new Student($this->request);
            $grades = $student->getGradesMainTeacher($student_id);  
            
            $view = new View();
            $view->data = $grades;
            $view->loadPage('professor', 'mystudentgrades');
        }
        
    }
