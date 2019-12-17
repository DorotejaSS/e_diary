<?php
class Parents extends Controller {
public function __construct(){
    if ($_SESSION['role_id'] != 'parent') {
        redirect('pages/index'); 
    }
    $this->userModel = $this->model('Parents_user');

}

public function parents(){

    
    //Init data

   $data =[
        'title' => 'Parent page',
        'description' => 'This is a Parent page'


];

    //Load view

$this->view('parents/parents', $data);

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
    
    $this->view('parents/poruke', $data);
    
    

} else {

//Init data

$data =[
    'title' => 'Poruke',
    'message' => '',
    'message_err' => ''
];

//Load view
  $this->view('parents/poruke', $data);
        }
    }
    
    public function uvid_u_ocene(){

    
        //Init data
    
       $data =[
            'title' => 'Uvid u ocene',

    ];
    
        //Load view
    
    $this->view('parents/uvid_u_ocene', $data);
    
    }

    public function zakazivanje_dolaska_na_otvorena_vrata(){

    
        //Check for POST
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            //Process form
        
            //Sanitize POST data
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        
    
        //Init data
    
       $data =[
            'title' => 'Zakazivanje dolaska na otvorena vrata',
            
    ];

    //Validate Message
    //if(empty($data['message'])){
      //  $data['message_err'] = 'Please enter message';
    //}

         //Load view
    
    $this->view('parents/zakazivanje_dolaska_na_otvorena_vrata', $data);
    
    

} else {

//Init data

$data =[
    'title' => 'Zakazivanje dolaska na otvorena vrata',
    'message' => '',
    'message_err' => ''
];

//Load view
  $this->view('parents/zakazivanje_dolaska_na_otvorena_vrata', $data);
        }
    }

    public function obavesetnja(){

    
        //Init data
    
       $data =[
            'title' => 'Obaveštenja',

    ];
    
        //Load view
    
    $this->view('parents/obavesetnja', $data);
    
    }
}
