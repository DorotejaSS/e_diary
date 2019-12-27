<?php

class UserController extends BaseController
{

    public function __construct()
    {
        $this->checkSession();
    }

    public function showAll()
    {
       $user = new User();
       $user->showAll('users');
    }

    public function getOne()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];

        $user = new User();
        $user->getOne('users', $id);
    }

    public function edit()
    {   
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];
        $this->getOne('users', $id);
    
        $view = new View();
        $view->loadPage('admin', 'edit');
       // zasto ne ulazi u ovaj blok klikom na submit
       if (isset($_POST['submit'])) {
            $user = new User();
            $user->update($id);
        }
    }

    public function delete()
    {
        var_dump('deletujem');
    }

    public function add()
    {

    }

}