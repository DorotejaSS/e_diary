<?php

class ParentController extends BaseController
{
    private $role_id = '5';
    private $child_id;

    public function __construct()
    {
        $this->checkSession();
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
    }

    public function showChild()
    {
        $this->loadView('parent', 'index');
    }
}