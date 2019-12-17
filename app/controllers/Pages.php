<?php
class Pages extends Controller {
public function __construct(){
    $this->userModel = $this->model('User');

}

public function index(){
        
    //Check for POST
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
    //Process form

    //Sanitize POST data
    $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

    //Init data
    $data =[
        'title' => 'E-Diary',
        'email' =>  trim($_POST['email']),
        'password' =>  trim($_POST['password']),
        'email_err' => '',
        'password_err' => ''
    ];

    //Validate Password
    if(empty($data['password'])){
      $data['password_err'] = 'Please enter password';
}

    //Check for User/Email
    if($this->userModel->findUserByEmail($data['email'])){
    //User found
    } else {
    //User not found
      $data['email_err'] = 'No user found';
    } if(empty($data['email'])) {
        $data['email_err'] = 'Please enter email';
    }
    //Make sure errors are empty
    if(empty($data['email_err']) && empty($data['password_err'])){
   
    //Validated
    
    //Check and set logged in user
    $loggedInUser = $this->userModel->login($data['email'], $data['password']);

    if($loggedInUser){
        switch($loggedInUser->role_id) {

            case 1:  
                
    // Load view
    $_SESSION['role_id'] = 'admin';
    header('Location: admin/admin'); 
            break;

            case 2: 
    //Load view
    $_SESSION['role_id'] = 'principal';
    header('Location: principal/principal'); 
            break;

            case 3:
    //Load view
    $_SESSION['role_id'] = 'proffesor';
    header('Location: proffesor/proffesor'); 
            break;

            case 4:
    //Load view
    $_SESSION['role_id'] = 'teacher';
    header('Location: teacher/teacher'); 
            break;
            
            case 5:             
    //Load view
    $_SESSION['role_id'] = 'parent';
    header('Location: parents/parents'); 
            break;
        }
    //Create Session
    } else {
        $data['password_err'] = 'Password incorect';

        $this->view('pages/index', $data);
    }
    } else {
        //Load view with errors
        $this->view('pages/index', $data);
    
    }
        } else {
    
    //Init data
    
    $data =[
        'title' => 'E-Diary',
        'email' => '',
        'password' => '',
        'email_err' => '',
        'password_err' => ''
    ];
    
    //Load view
      $this->view('pages/index', $data);
            }
        } 

        public function logout(){
        
            unset($_SESSION['user_id']);
            unset($_SESSION['user_email']);
            unset($_SESSION['user_name']);
            session_destroy();
            redirect('pages/index');
        }

public function about(){
    $data = [
        'title' => 'About Us',
        'description' => 'App to share posts with other users'
    ];
      $this->view('pages/about', $data);
}
}
