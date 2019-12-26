<?php
// bazni kontroler koji nasledjuju ostali, iz njega pozivamo view izmedju ostalog za sad
class BaseController
{
    private $request;

    public function __construct($request)
    {
        $this->request = $request;
        var_dump($this->request);
        // TODO: proveri iz sesije ko je ulogovan i koje su mu permisije
    }

    public function loadView($dir_name, $partial_name)
    {
        $view = new View();
        $view->loadPage($dir_name, $partial_name);
    }

    public function loadHomePage()
    {
        
    }

    public function checkSession()
    {
        if(!isset($_SESSION['user_data']['email'])){
            header('Location:/login');
            die;
        }
    }    
}