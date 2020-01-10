<?php

class eeMenu extends BaseModel
{
    private $role_id;
    public $menu_title = array ();
    public $menu_url = array ();

    public function __construct()
    {
        if (isset($_SESSION['user_data']))
        {
            $this->role_id = $_SESSION['user_data']['role_id'];
        }
    }

    public function getMenu()
    {
        require('./app/db.php');

        if (isset($_SESSION['user_data']))
        {
            $sql = $connn->prepare('    SELECT menu.title, menu.url 
                                        FROM menu INNER JOIN role_menu ON menu.id = role_menu.menu_id 
                                        WHERE role_menu.role_id = :id');

            $sql->execute (array(':id' => $this->role_id));

            $menu_data = $sql->fetchAll();

            //var_dump($menu_data);

            /*
            $sql= '
            SELECT menu.title, menu.url 
            FROM menu INNER JOIN role_menu 
            ON menu.id = role_menu.menu_id 
            WHERE role_menu.role_id = '.$this->role_id;
            
            $this->result = $conn->query($sql);
            
            $menu_data = $this->result->fetch_all();
            */
            foreach ($menu_data as $menu)
            {
                array_push ($this->menu_title, $menu[0]);
                array_push ($this->menu_url, $menu[1]);
            }
        }
    }
}