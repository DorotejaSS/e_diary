<?php

class TeacherController extends BaseController
{
    private $role_id = '4';

    public function __construct()
    {
        $this->checkSession();
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
    }

    public function studentGroup()
    {
        echo 'studenti ovog ucitelja su ovde';
    }
}