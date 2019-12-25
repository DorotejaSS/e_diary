<?php

class UserController
{
    public function __construct()
    {

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