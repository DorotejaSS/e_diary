<?php
class Proffesor extends Controller {
public function __construct(){
    if ($_SESSION['role_id'] != 'proffesor') {
        redirect('pages/index'); 
    }
    $this->userModel = $this->model('Proffesor');

}

public function proffesor(){

    
    //Init data

   $data =[
        'title' => 'Proffesor page',
        'description' => 'This is a Proffesor page'


];

     //Load view

$this->view('proffesor/proffesor', $data);

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
    
    $this->view('proffesor/dnevnik_odeljenja', $data);
    
    }

    public function odobravanje_dolaska_na_otvorena_vrata(){

    
        //Init data
    
       $data =[
            'title' => 'Odobravanje dolaska na otvorena vrata',
        
    ];
    
         //Load view
    
    $this->view('proffesor/odobravanje_dolaska_na_otvorena_vrata', $data);
    
    }

    public function poruke(){

    
        //Init data
    
       $data =[
            'title' => 'Poruke',
         
    ];
    
         //Load view
    
    $this->view('proffesor/poruke', $data);
    
    }

    public function raspored_casova(){

    
        //Init data
    
       $data =[
            'title' => 'Raspored časova',
        
    ];
    
         //Load view
    
    $this->view('proffesor/raspored_casova', $data);
    
    }

    public function generisanje_svedocanstva(){

    
        //Init data
    
       $data =[
            'title' => 'Svedočanstvo',
          
    ];
    
         //Load view
    
    $this->view('proffesor/generisanje_svedocanstva', $data);
    
    }
}
