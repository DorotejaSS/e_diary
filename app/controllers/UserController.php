<?php

class UserController extends BaseController
{

    public function __construct($request)
    {
        $this->request = $request;
        $this->checkSession();
    }

    public function showAll()
    {
        $user = new User();
        $user->showAll('users');
       
        $view = new View();
        $view->data = $user->showAll('users');
        $view->loadPage('admin','showallusers');
    }

    public function getOne()
    {
        $id = $this->request->url_parts[1];
        $user = new User();
        $get_one_user = $user->getOne('users', $id);

        $view = new View();
        $view->data = $get_one_user[0];
        $view->loadPage('admin', 'showoneuser');
    }

    public function edit()
    {   
        $id = $this->request->url_parts[1];
        $user = new User();
        $get_one_user = $user->getOne('users', $id);

        $view = new View();
        $view->data = $get_one_user[0];
        $view->loadPage('admin', 'showoneuser');
        $view->loadPage('admin', 'edituser');
     
        if (isset($_POST['submit'])) {
            $user = new User();
            $user->update($id);
            header('Location: /users');
        }
    }

    public function delete()
    {
        $id = $this->request->url_parts[1];
        $user = new User();
        $user->delete($id);
        header('Location: /users');
    }

    public function add()
    {
        $view = new View();
        
        if (isset($_POST['hash'])) {
            $password = $this->generatePassword();
            $this->generatePassword();
        }
        
        $view->data['password'] = $password ?? false;
        $view->loadPage('admin', 'adduser');
        
        if (isset($_POST['submit'])) {
            $user = new User();
            $user->add();
            header('Location: /users');
        }
    }

    public function generatePassword($length = 10)
    {   
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $password = substr(str_shuffle($chars), 0, $length);
        return $password;
    }
}