<?php
/*
* Base Contoller
*Load the models and views
*/

class Controller {
    //Load model
    public function model($model){ 
        //Require model file
<<<<<<< HEAD
        if (file_exists('../app/models/' . $model . '.php'))
        {
            require_once '../app/models/' . $model . '.php';

            //Instatiate model
            return new $model();
        }
        else {
            //Model does not exist
            die('Model does not exist');
        }
       
=======
        require_once '../app/models/' . $model . '.php';
        
        //Instatiate model
        return new $model();
>>>>>>> f6bef7ae98afea90bb31522c5d9ca91b53106158
    }

    //Load view
    public function view($view, $data = []){
        //Check for view file

        if (file_exists('../app/views/' . $view . '.php'))
        {
            require_once '../app/views/' . $view . '.php';
        }
        else {
            //View does not exist
            die('View does not exist');
        }
    }
}