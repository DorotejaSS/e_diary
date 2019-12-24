<?php

// require('./app/db.php');

class User extends BaseModel
{
    public function __construct()
    {

    }

    public function login($email, $password)
	{   
        // db.php je konekcija sa bazom
        require('./app/db.php');
       
        if($_SERVER["REQUEST_METHOD"] == "POST") {

            $email = $conn->escape_string($_POST['email']);
            $password = $conn->escape_string($_POST['password']);

            $sql = 'select * from users where email = "'.$email.'" and password = "'.$password.'"';

            $result = $conn->query($sql);
            $user_data = $result->fetch_assoc();
            // var_dump($user_data);
            
            // Ako se poklapaju sa podacima iz baze num_rows ce biti 1 
            if ($result->num_rows === 1) {
                $_SESSION['login_user_email'] = $email;

                switch ($user_data['role_id']) {
                    case '1':
                        // $_REQUEST['path'] //login
                        // $view = new View();
                        // $view->loadPage('admin', 'index');
                        if (isset($_SESSION['login_user_email'])) {
                            header('Location: /admin');
                        } else {
                            echo 'nisi ulogovan';
                        }
                        //url je i dalje /login
                        break;
                     case '2':
                        $view = new View();
                        $view->loadPage('principal', 'index');
                        break;
                     case '3':
                        $view = new View();
                        $view->loadPage('professor', 'index');
                        break;
                     case '4':
                        $view = new View();
                        $view->loadPage('teacher', 'index');
                        break;
                     case '5':
                        $view = new View();
                        $view->loadPage('parent', 'index');
                        break;
                    
                    default:
                        $view = new View();
                        $view->loadPage('pages', '404');
                        break;
                }

                $view = new View();
                $view->loadPage('pages', 'welcome');

            } else {
                $error = "Your Email or Password is invalid";
                echo $error;
            }

            
            if(!isset($_SESSION['login_user_email'])){
                $view->loadPage('pages', 'login');
                die;
            }
        }
    }
}