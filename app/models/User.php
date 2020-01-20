<?php

class User extends BaseModel
{
    private $row_count;
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
            $email = $_POST['email'];
            $password = $_POST['password'];
            
            $sql = $conn->prepare('select * from users where email = ? and password = ?');
            $sql->execute(array($email, $password));
            $user_data = $sql->fetch(PDO::FETCH_ASSOC);
            
            $_SESSION['user_data'] = $user_data;
            $this->row_count = $sql->rowCount();
            $this->role_id = $user_data['role_id'];
        }
        $this->checkCredentials($this->role_id);
    }

    public function resetPassword($email, $child_social_id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select users.id from users 
                                inner join students on 
                                users.email = "'.$email.'" and students.social_id = "'.$child_social_id.'" and
                                users.id = students.parent_id');
        $sql->execute();
        $data = '';
        $data = $sql->fetchAll();
        $_SESSION['id'] = $data[0]['id'] ?? array();
    
        if (!empty($data)) {
            return true;
        } else {
            return false;
        }
    }

    public function updatePassword()
    {
        require('./app/db.php');
        var_dump($_POST);
        var_dump($_SESSION);
        if($_POST['password'] === $_POST['re-password']) {
            $sql = $conn->prepare('update users set password = "'.$_POST['password'].'" where id = "'.$_SESSION['id'].'"');
            return $sql->execute();
        } else {
            echo 'Try Again. Enter the same password twice.';
        }
    }
        
        
    public function update($id)
    {
        require('./app/db.php');


        $sql = $conn->prepare('update users set 
                            first_name = "'.$this->first_name.'",
                            last_name = "'.$this->last_name.'",
                            email = "'.$this->email.'",
                            password = "'.$this->password.'",
                            role_id = "'.$this->role_id.'"
                            WHERE id = "'.$id.'"');
        $sql->execute();
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
        
        $sql = $conn->prepare('insert into users (first_name, last_name, email, password, role_id)
                                 values (?, ?, ?, ?, ?)');
        $sql->execute(array($this->first_name, $this->last_name, $this->email, $this->password, $this->role_id));
    }

    public function permissionTitles($role_id)
    {
        require('./app/db.php');
        
        $sql = 'select permissions.title, role_permissions.* from permissions 
                inner join role_permissions 
                on permissions.id = role_permissions.permission_id
                where role_permissions.role_id = ?';

        $stmt = $conn->prepare($sql);
        $stmt->execute(array($role_id));
        $permission_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $permission_data;
    }
    
    public function checkCredentials($role_id)
    {  
        // $permission_data = $this->permissionTitles($this->role_id);
        // var_dump($permission_data); die;
        if ($this->row_count === 1) {
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
            
        
        } else {
            $error = 'Your Email or Password is invalid';
            echo $error;
            $view = new View();
            $view->loadPage('pages', 'login');
        }
    }
}