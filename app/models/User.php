<?php
// require ('./app/db.php');

class User extends BaseModel
{
    private $result;
    public $first_name;
    public $last_name;
    public $email;
    public $password;
    public $role_id;
    
    public function __construct()
    {
        // var_dump($_POST);
        // if (!empty($_POST)) {
        //     $this->first_name = $_POST['first_name'];
        //     $this->last_name = $_POST['last_name'];
        //     $this->email = $_POST['email'];
        //     $this->password = $_POST['password'];
        //     $this->role_id = $_POST['role_id'];
        // }
    }

    public function login($email, $password)
	{   
        // db.php je konekcija sa bazom - ne bi trebala da stoji ovde vec izvan klase 
        //ali je problem sa autoloaderima koji ucitavaju klasu od linije gde se klasa definise
        //TODO: popraviti
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

    public function delete($id)
    {
        require('./app/db.php');
    }

    public function update($id)
    {
        require('./app/db.php');
         $sql = 'update users set 
            first_name = "'.$_POST['first_name'].'",
            last_name = "'.$_POST['last_name'].'",
            password = "'.$_POST['password'].'",
            email = "'.$_POST['email'].'",
            password = "'.$_POST['password'].'",
            role_id = "'.$_POST['role_id'].'"
            where id = "'.$id.'"';
        
            $this->result = $conn->query($sql);
            var_dump($this->result);
        return $this->result;


    }
    
    public function checkCredentials($role_id)
    {
            // Ako se poklapaju sa podacima iz baze num_rows ce biti 1 
            if ($this->result->num_rows === 1) {
                $this->role_id = $_SESSION['user_data']['role_id'];

                switch ($this->role_id) {
                    case '1':
                        header('Location: /admin');
                        break;
                     case '2':
                        header('Location: /principal');
                        break;
                     case '3':
                        header('Location: /proffesor');
                        break;
                     case '4':
                        $view = new View();
                        $view->loadPage('teacher', 'index');
                        break;
                     case '5':
                        header('Location: /parents');
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
                $view = new View();
                $view->loadPage('pages', 'login');
            }
    }
}