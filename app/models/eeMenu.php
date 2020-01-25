<?php

class eeMenu extends BaseModel
{
    private $role_id;
    public $menu_title = array ();
    public $menu_url = array ();

    public function __construct()
    {
        if (isset($_SESSION['user_data'])) {
            $this->role_id = $_SESSION['user_data']['role_id'];
            var_dump($this->role_id);
        }
    }

    public function getMenu()
    {
        require('./app/db.php');

<<<<<<< HEAD
        if (isset($_SESSION['user_data']))
        {
            $sql = $conn->prepare('SELECT menu.title, menu.url 
                                   FROM menu INNER JOIN role_menu ON menu.id = role_menu.menu_id 
                                   WHERE role_menu.role_id = :id');
=======
        if (isset($_SESSION['user_data'])) {
            $sql = $conn->prepare('SELECT menu.title, menu.url 
                                    FROM menu INNER JOIN role_menu ON menu.id = role_menu.menu_id 
                                    WHERE role_menu.role_id = :id');
>>>>>>> 285d27a69272a5cc48a8ccd3a6e37820103aa988

            $sql->execute(array(':id' => $this->role_id));

            $menu_data = $sql->fetchAll();
            
            foreach ($menu_data as $menu)
            {
                array_push($this->menu_title, $menu[0]);
                array_push($this->menu_url, $menu[1]);
                var_dump($menu);
            }
        }
    }
}