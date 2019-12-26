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
}