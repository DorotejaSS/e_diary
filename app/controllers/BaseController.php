<?php
// bazni kontroler koji nasledjuju ostali, iz njega pozivamo view izmedju ostalog za sad
class BaseController
{
    protected $request;
    protected $role_id;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function loadView($dir_name, $partial_name)
    {
        $view = new View();
        $view->loadPage($dir_name, $partial_name);
    }

    public function checkSession()
    {
        if (!isset($_SESSION['user_data']['email'])){
            header('Location:/login');
            die;
        }
    }

    public function checkRole($role_id)
    {
        if ($_SESSION['user_data']['role_id'] !== $role_id)
            return false;
    }
}