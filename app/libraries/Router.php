<?php

class Router
{
    public $request;

    public function __construct()
    {
        $this->request = new Request();
        if ($this->routeExists()) {
            $this->instantiateController();
        }
    }

    public function routeExists()
    {
        global $routes;
        return in_array($this->request->request_uri, array_keys($routes));
    }

    public function instantiateController()
    {
        global $routes;
        $resolver_string = $routes[$this->request->request_uri];
        list($controller_name, $method_name) = explode('@', $resolver_string);
        $controller = new $controller_name($this->request);
        $controller->$method_name();

    }
}