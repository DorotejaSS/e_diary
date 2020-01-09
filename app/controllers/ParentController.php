<?php

class ParentController extends BaseController
{
    protected $role_id = '5';

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
        
    }
}