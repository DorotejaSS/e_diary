<?php
// preko ovog kontrolera cemo se logovati i komunicirati sa modelom oko toga
class AccessController extends BaseController
{
    public $email;
    public $password;

    public function __construct($request)
    {
        $this->request = $request;
        //čišćene ekrana
        /*var_dump($this->request);*/
    }
    
    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->email = $this->request->post_params['email'];
            $this->password = $this->request->post_params['password'];
            $user = new User();
            $user->login($this->email, $this->password);
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