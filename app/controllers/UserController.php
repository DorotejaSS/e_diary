<?php

class UserController extends BaseController
{
    public $name;
    public $last_name;
    public $email;
    public $role_id;
    public $password;

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
        var_dump('editujemo');
    }

    public function delete()
    {
        var_dump('deletujem');
    }

    public function add()
    {

    }
}