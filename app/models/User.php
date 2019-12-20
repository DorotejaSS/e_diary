<?php
class User extends BaseModel
{
    public $a = 'ovo je properti';

    public function __construct()
    {
        global $conn;
        $base_model = new BaseModel();
        
        
    }
}