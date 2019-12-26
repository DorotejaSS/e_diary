<?php
// require ('./app/db.php');

class User extends BaseModel
{
    private $result;

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

            $this->result = $conn->query($sql);
            $user_data = $this->result->fetch_assoc();
            $_SESSION['user_data'] = $user_data;
            
            $this->checkCredentials($user_data['role_id']);
        }
    }

    public function checkCredentials($role_id)
    {
        // Ako se poklapaju sa podacima iz baze num_rows ce biti 1 
            if ($this->result->num_rows === 1) {
                $this->role_id = $_SESSION['user_data']['role_id'];

                switch ($this->role_id) {
                    case '1':
                        header('Location: /admin');
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
    }
}