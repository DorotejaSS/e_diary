<?php
// preko ovog kontrolera cemo se logovati i komunicirati sa modelom oko toga
class AccessController extends BaseController
{
    public $email;
    public $password;

    public function __construct($request)
    {
        $this->request = $request;
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
        unset($_SESSION['user_data']);    
        echo 'You have cleaned session';
        header('Refresh: 2; URL = /login');
    }

    public function resetPassword()
    {
        $view = new View();
        $view->loadPage('pages', 'forgottenpassword');
    
        $email = $this->request->post_params['email'] ?? array();
        $child_social_id = $this->request->post_params['child_social_id'] ?? array();
        $submit = $this->request->post_params['submit'] ?? array();

        if (!empty($email) && !empty($child_social_id) && !empty($submit)) {
            $user = new User();
            if ($user->resetPassword($email, $child_social_id)) {
                echo 'You have entered valid informations, please save your new password and log in.';
                $view->loadPage('pages', 'newpassword');
                var_dump($_POST);
            } else {
                echo 'Invalid informations, access denied.';
                header('Refresh: 2; URL = /login');
            } 
        }
    }

}