<?php
class Principal extends Controller {
public function __construct(){
    if ($_SESSION['role_id'] != 'principal') {
        redirect('pages/index');
    }
    $this->userModel = $this->model('Principal_user');

}

public function principal(){

    
    //Init data

   $data =[
        'title' => 'Principal page',
        'description' => 'This is a Principal page'


];

     //Load view

$this->view('principal/principal', $data);

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

    public function uspesnost_odeljenja_po_predmetima(){

    
        //Init data
    
       $data =[
            'title' => 'Uspešnost odeljenja po predmetima',    
    
    ];
    
         //Load view
    
    $this->view('principal/uspesnost_odeljenja_po_predmetima', $data);
    
    }

    public function uspesnost_po_predmetima_na_nivou_skole(){

    
        //Init data
    
       $data =[
            'title' => 'Uspešnost po predmetima na nivou škole',
                
    ];
    
         //Load view
    
    $this->view('principal/uspesnost_po_predmetima_na_nivou_skole', $data);
    
    }
}
