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

            var_dump($_SERVER['REQUEST_METHOD']);

            $email = $conn->escape_string($_POST['email']);
            var_dump($email);
            $password = $conn->escape_string($_POST['password']);
            var_dump($password);

            $sql = 'select * from users where email = "'.$email.'" and password = "'.$password.'"';
            var_dump($sql);

            $result = $conn->query($sql);
            var_dump($result);
            $result->fetch_assoc();
            var_dump($result);

            // Ako se poklapaju sa podacima iz baze num_rows ce biti 1 
            // ako je 1, upisi email u Sesiju[login user] i pozovi view za korisnika (za sad je obican view koji pokazuje da si ulogovan)
            if ($result->num_rows == 1) {
                $_SESSION['login_user'] = $email;
                $view = new View();
                $view->loadPage('pages', 'welcome');
            } else {
                $error = "Your Email or Password is invalid";
                echo $error;
            }

    
            $user_check = $_SESSION['login_user'];
            var_dump($user_check);
   
            $ses_sql = mysqli_query($conn, "select email from users where email = '$user_check'");
            var_dump($ses_sql);
            
            $row = mysqli_fetch_array($ses_sql, MYSQLI_ASSOC);
            var_dump($row);
            
            $login_session = $row['email'];
            var_dump($login_session);
            
            if(!isset($_SESSION['login_user'])){
                $view->loadPage('pages', 'login');
                die;
            }


        }
    }
}