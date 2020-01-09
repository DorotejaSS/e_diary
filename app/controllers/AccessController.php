<?php
// preko ovog kontrolera cemo se logovati i komunicirati sa modelom oko toga
class AccessController extends BaseController
{
    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $user = new User();
            $user->login($_POST['email'], $_POST['password']);
        } else {
            $this->loadView('pages', 'login');
        }
        //users data are saved in $_SESSION['user_data]
        
    }

    public function logout()
    {   
        unset($_SESSION["user_data"]);
        
        echo 'You have cleaned session';
        header('Refresh: 2; URL = /login');

    }

}