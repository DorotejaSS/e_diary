<?php

class ScheduleController extends BaseController
{
    protected $role_id = '1';
    protected $request;
    //private $model;

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
        $model = new Schedule();

        $view = new View();
        $view->loadPage('admin', 'schedule');
    }

    public function ajax()
    {
        if (isset($_POST['method']) && $_POST['method'] == "getSubGroup")
        {
            $model = new Schedule();
            $model->getSubGroup();
            echo json_encode($model->result, 256);
        }
    }
}