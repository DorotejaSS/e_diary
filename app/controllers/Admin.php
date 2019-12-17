<?php
class Admin extends Controller {
public function __construct(){
    if ($_SESSION['role_id'] != 'admin') {
        redirect('pages/index'); 
    }
    $this->userModel = $this->model('Admin_user');

}

public function admin(){
        
        
        //Init data

   $data =[
        'title' => 'Admin page',
        'description' => 'This is a Admin page'


];

    //Load view

$this->view('admin/admin', $data);

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

    public function informacije_o_ucenicima(){
        
        
        //Init data

   $data =[
        'title' => 'Informacije o učenicima',
        
];

    //Load view

$this->view('admin/informacije_o_ucenicima', $data);

}

public function kontrola_rasporeda_casova(){
        
        
    //Init data

$data =[
    'title' => 'Kontrola rasporeda časova',
    
];

//Load view

$this->view('admin/kontrola_rasporeda_casova', $data);

}

public function kontrolisanje_korisnika(){
        
        
    //Init data

$data =[
    'title' => 'Kontrola korisnika',
    
];

//Load view

$this->view('admin/kontrolisanje_korisnika', $data);

}

public function kontrolisanje_predmeta_i_odeljenja(){
        
        
    //Init data

$data =[
    'title' => 'Kontrola predmeta i odeljenja',
    
];

//Load view

$this->view('admin/kontrolisanje_predmeta_i_odeljenja', $data);

}

public function obavestenja_roditeljima(){
        
        
    //Init data

$data =[
    'title' => 'Obaveštenja roditeljima',
    
];

//Load view

$this->view('admin/obavestenja_roditeljima', $data);

}
}
