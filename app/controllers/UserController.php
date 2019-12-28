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
       
        $view = new View();
        $view->data = $_SESSION['users'];
        $view->loadPage('admin','showall');
    }

    public function getOne()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];

        $user = new User();
        $user->getOne('users', $id);

        $view = new View();
        $view->data = $_SESSION['user_data'];
        $view->loadPage('admin', 'showone');
    }

    public function edit()
    {   
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];
        $this->getOne('users', $id);
    
        $view = new View();
        $view->loadPage('admin', 'edit');
     
       if (isset($_POST['submit'])) {
            $user = new User();
            $user->update($id);
            header('Location: /users');
        }
    }

    public function delete()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];
        $user = new User();
        $user->delete($id);
        header('Location: /users');
    }

    public function add()
    {

    }

}