<?php

class Router
{
    public $request;

    public function __construct()
    {   //instanciramo klasu Request
        $this->request = new Request();

        // ako ruta postoji (/config/routes.php) instanciraj kontroler
        if ($this->routeExists()) {
            $this->instantiateController();
        }
    }
    // proveravamo da li ruta postoji
    public function routeExists()
    {
        global $routes;
        return in_array($this->request->request_uri, array_keys($routes));
    }

    // nadji koji kontroler i metod treba da se okine, @ je wildcard po kojoj eksplodiramo
    // *var_dump svaki red i ukucaj u url bilo sta tipa : www.e-dnevnik.com/na/kraj/sela?zuta=kuca ...etc 
    public function instantiateController()
    {
        global $routes;
        $resolver_string = $routes[$this->request->request_uri];
        list($controller_name, $method_name) = explode('@', $resolver_string);
        $controller = new $controller_name($this->request);
        $controller->$method_name();

    }
}