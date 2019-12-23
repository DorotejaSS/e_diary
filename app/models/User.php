<?php

// require('./app/db.php');
// var_dump($conn);

class User extends BaseModel
{
    public function __construct()
    {

    }

    public function login($email, $password)
	{   
        // db.php je konekcija sa bazom
        require('./app/db.php');
        // var_dump($conn);
        // ako je request method post , udji u if
        if($_SERVER["REQUEST_METHOD"] == "POST") {

            $email = $conn->escape_string($_POST['email']);
            $password = $conn->escape_string($_POST['password']);

            $sql = 'select * from users where email = "'.$email.'" and password = "'.$password.'"';

            $result = $conn->query($sql);
            $user_data = $result->fetch_assoc();
            // var_dump($user_data);
            

            // Ako se poklapaju sa podacima iz baze num_rows ce biti 1 
            // ako je 1, upisi email u Sesiju[login user] i pozovi view za korisnika (za sad je obican view koji pokazuje da si ulogovan)
            if ($result->num_rows == 1) {
                $_SESSION['login_user_email'] = $email;

                switch ($user_data['role_id']) {
                    case '1':
                        $view = new View();
                        $view->loadPage('admin', 'index');
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
                        echo '<h1>STRANA NIJE PRONADJENA</h1>';
                        break;
                }

                $view = new View();
                $view->loadPage('pages', 'welcome');

            } else {
                $error = "Your Email or Password is invalid";
                echo $error;
            }

    
            $user_check = $_SESSION['login_user_email'];
            $ses_sql = mysqli_query($conn, "select email from users where email = '$user_check'");
            
            $row = mysqli_fetch_array($ses_sql, MYSQLI_ASSOC);                    
            $login_session['email'] = $row['email'];
        
            
            if(!isset($_SESSION['login_user_email'])){
                $view->loadPage('pages', 'login');
                die;
            }


        }
    }
}