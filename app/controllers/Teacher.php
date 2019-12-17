<?php
class Teacher extends Controller {
public function __construct(){
    if ($_SESSION['role_id'] != 'teacher') {
        redirect('pages/index');
    }
    $this->userModel = $this->model('Teacher_user');

}

public function teacher(){

    
    //Init data

   $data =[
        'title' => 'Teacher page',
        'description' => 'This is a Teacher page'


];

     //Load view

$this->view('teacher/teacher', $data);

}

public function createUserSession($users){
    $_SESSION['user_id'] = $users->id;
    $_SESSION['user_email'] = $users->email;
    $_SESSION['user_name'] = $users->username;
    redirect('pages/index');
    }
    public function logout(){
        unset($_SESSION['user_id']);
        unset($_SESSION['user_email']);
        unset($_SESSION['user_name']);
        session_destroy();
        redirect('pages/index');
    }

    public function isLoggedIn(){
        if(isset($_SESSION['user_id'])){
            return true;
        } else {
            return false;
        }
    }

    public function dnevnik_odeljenja(){

    
        //Init data
    
       $data =[
            'title' => 'Dnevnik odeljenja',
          
    ];
    
         //Load view
    
    $this->view('teacher/dnevnik_odeljenja', $data);
    
    }

    public function odobravanje_dolaska_na_otvorena_vrata(){

    
        //Init data
    
       $data =[
            'title' => 'Odobravanje dolaska na otvorena vrata',
          
    ];
    
         //Load view
    
    $this->view('teacher/odobravanje_dolaska_na_otvorena_vrata', $data);
    
    }

    public function poruke(){

        //Check for POST
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            //Process form
        
            //Sanitize POST data
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        
    
        //Init data
    
       $data =[
            'title' => 'Poruke',
            'message' =>  trim($_POST['message']),
            'message_err' => ''
    ];

    //Validate Message
    if(empty($data['message'])){
        $data['message_err'] = 'Please enter message';
    }

         //Load view
    
    $this->view('teacher/poruke', $data);
    
    

} else {

//Init data

$data =[
    'title' => 'Poruke',
    'message' => '',
    'message_err' => ''
];

//Load view
  $this->view('teacher/poruke', $data);
        }
    }
    


    public function raspored_casova(){

    
        //Init data
    
       $data =[
            'title' => 'Raspored časova',
        
    ];
    
         //Load view
    
    $this->view('teacher/raspored_casova', $data);
    
    }

    public function generisanje_svedocanstva(){

    
        //Init data
    
       $data =[
            'title' => 'Svedočanstvo',
         
    ];
    
         //Load view
    
    $this->view('teacher/generisanje_svedocanstva', $data);
    
    }
}
