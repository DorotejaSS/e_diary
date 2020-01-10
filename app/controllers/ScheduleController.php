<?php

class ScheduleController extends BaseController
{
    protected $role_id = '1';
    protected $request;

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
        $model = new Schedule($this->request);

        $view = new View();
        $view->loadPage('admin', 'schedule');
    }
}