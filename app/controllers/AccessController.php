<?php
// preko ovog kontrolera cemo se logovati i komunicirati sa modelom oko toga
class AccessController extends BaseController
{
    // pozivamo view za login i zovemo model User kome prosledjujemo ono sto smo dobili iz post-a
    public function login()
    {
        $this->loadView('pages', 'login');
        $user = new User();
        $user->login($_POST['email'], $_POST['password']);
    }

    // unistavamo sesiju i vracamo se na login nakon toga
    public function logout()
    {   
        unset($_SESSION["email"]);
        unset($_SESSION["password"]);
        
        echo 'You have cleaned session';
        header('Refresh: 2; URL = /login');

    }

}