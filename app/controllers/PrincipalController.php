<?php

class PrincipalController extends BaseController
{
    protected $role_id = '2';
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
        $this->model = new Principal();
    }

    public function homePage()
    {
        $view = new View();
        $view->loadPage('principal', 'index');
        
    }

    public function ajax()
    {
        if (isset($_POST['method']) && $_POST['method'] != '')
        {
            switch ($_POST['method'])
            {
                case 'fillStudentGroup':
                    $this->model->fillStudentGroup();
                    echo json_encode($this->model->result, 256);
                    break;

                case 'fillSubjects':
                    $this->model->fillSubjects();
                    echo json_encode($this->model->result, 256);
                    break;

                case 'getSgData':
                    $this->model->getSgData($_POST['id']);
                    echo json_encode($this->model->result, 256);
                    break;
            }
        }
    }
}