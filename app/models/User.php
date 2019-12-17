<?php
class User {
    private $db;

    public function __construct(){
        $this->db = new Database;        
    }

    // Register user
public function register($data){
    $this->db->query('INSERT INTO users (username, email, password) VALUES(:username; :email, :password)');
    // Bind values
    $this->db->bind(':username', $data['username']);
    $this->db->bind(':email', $data['email']);
    $this->db->bind(':password', $data['password']);

    //Execute
    if($this->db->execute()){
        return true;
    } else {
        return false;
    }
}

    //Login User
    public function login ($email, $password) {
        $this->db->query('SELECT * FROM users WHERE email = :email');
        $this->db->bind(':email', $email);
        
        $row = $this->db->single();
        
        $hashed_password = $row->password;
        if($password === $row->password){
            return $row;
        } else {
            return false;
        }
    }
        

    //Find user by email
    public function findUserByEmail($email){
        $this->db->query('SELECT * FROM users WHERE email = :email');
    //Bind value
        $this->db->bind(':email', $email);

        $row = $this->db->single();

    //Check row
    if($this->db->rowCount() > 0){
        return true;
    } else {
        return false;
    }
  }

  //Find user byRollId
  public function findUserByrol_id($role_id){
    $this->db->query('SELECT * FROM users WHERE role_id = :role_id');
//Bind value
    $this->db->bind(':role_id', $role_id);

    $row = $this->db->single();

//Check row
if($this->db->rowCount() > 0){
    return true;
} else {
    return false;
}
}

}