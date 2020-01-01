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
        if (isset($_POST['first_name'])) {
            $this->first_name = $_POST['first_name'];
        } 
        if (isset($_POST['last_name'])) {
            $this->last_name = $_POST['last_name'];
        } 
        if (isset($_POST['email'])) {
            $this->email = $_POST['email'];
        } 
        if (isset($_POST['password'])) {
            $this->password = $_POST['password'];
        } 
        if (isset($_POST['role_id'])) {
            $this->role_id = $_POST['role_id'];
        } 
    }

    public function login($email, $password)
	{   
        require('./app/db.php');
       
        if($_SERVER["REQUEST_METHOD"] == "POST") {
            
            $email = $conn->escape_string($_POST['email']);
            $password = $conn->escape_string($_POST['password']);
            
            $sql = 'SELECT * FROM users WHERE email = "'.$email.'" and password = "'.$password.'"';
            
            $this->result = $conn->query($sql);
            $user_data = $this->result->fetch_assoc();
        
            $_SESSION['user_data'] = $user_data;
            
            $this->checkCredentials($user_data['role_id']);
        }
    }

    public function delete($id)
    {
        require('./app/db.php');
       
        $sql = 'DELETE FROM users WHERE id = "'.$id.'"';
        $this->result = $conn->query($sql);
    }

    public function update($id)
    {
        require('./app/db.php');

         $sql = 'UPDATE users SET 
            first_name = "'.$this->first_name.'",
            last_name = "'.$this->last_name.'",
            email = "'.$this->email.'",
            password = "'.$this->password.'",
            role_id = "'.$this->role_id.'"
            WHERE id = "'.$id.'"';
        
        $this->result = $conn->query($sql);
        return $this->result;
    }

    public function add()
    {
        require('./app/db.php');

        if (!empty($_POST['first_name'])) {
            $this->first_name = $_POST['first_name'];
        } 
        if (!empty($_POST['last_name'])) {
            $this->last_name = $_POST['last_name'];
        }
        if (!empty($_POST['email'])) {
            $this->email = $_POST['email'];
        }
        if (!empty($_POST['password'])) {
            $this->password = $_POST['password'];
        } 
        if (!empty($_POST['role_id'])) {
            $this->role_id = $_POST['role_id'];
        }
        
        $sql = "insert into users (first_name, last_name, email, password, role_id)
                values ('$this->first_name', '$this->last_name', '$this->email', '$this->password', '$this->role_id')";
       
        $this->result = $conn->query($sql);
        return $this->result;
    }
    
    public function checkCredentials($role_id)
    {
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
                    header('Location: /professor');
                    break;
                    case '4':
                    header('Location: /teacher');
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
            $error = 'Your Email or Password is invalid';
            echo $error;
            $view = new View();
            $view->loadPage('pages', 'login');
        }
    }
}