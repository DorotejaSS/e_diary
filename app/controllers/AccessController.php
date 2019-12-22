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

    // unistavamo sesiju i pozivamo view da se vratimo nazad na login stranu
    public function logout()
    {
        if(session_destroy()) {
           $view = new View();
           $view->loadPage('pages', 'login');
        }
    }

}