<?php
require_once('./app/db.php');

class User extends BaseModel
{
    public $a = 'ovo je properti';

    public function __construct()
    {
        // $base_model = new BaseModel();
        $this->login($_POST['email'], $_POST['password']);
    }

    public function login($email, $password)
	{
        global $db;

        
	}

}