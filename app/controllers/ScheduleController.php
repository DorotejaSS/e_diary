<?php

class ScheduleController extends BaseController
{
    protected $role_id = '1';
    protected $request;
    private $model;

    public function __construct($request)
    {
        $this->request = $request;
        $this->checkSession();
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
        $this->model = new Schedule();
    }

    public function index()
    {
        $view = new View();
        $view->loadPage('admin', 'schedule');
    }

    public function ajax()
    {
        if (isset($_POST['method']) && $_POST['method'] != '')
        {
            switch ($_POST['method'])
            {
                case 'fillSelect':
                    $this->model->fillSelect();
                    echo json_encode($this->model->result, 256);
                    break;

                case 'fillSubjects':
                    $this->model->fillSubjects();
                    echo json_encode($this->model->result, 256);
                    break;
                
                case 'getSchedule':
                    $this->model->getSchedule($_POST['id']);
                    echo json_encode($this->model->result, 256);
                    break;

                case 'saveData':
                    $this->model->saveData($_POST['subject_data'], $_POST['position_data'], $_POST['id']);
                    echo json_encode($this->model->result, 256);
                    break;
            }
        }
        else
        {
            header('Refresh: 1; URL = /admin'); 
        }
    }
}