<?php

class StudentController extends BaseController
{
    public function __construct()
    {
        $this->checkSession();
    }

    public function showAll()
    {
        // $user = new User();
        // $user->showAll();
    }

    public function getOne()
    {
        var_dump('get One metoda');
    }
}