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
        if (in_array($this->request->request_uri, array_keys($routes))) {
            var_dump($this->request->request_uri);
            var_dump('imamo rutu, slucaj 1, basic');
            return true;
        } else {
            $pattern = '/^\/[a-z]{2,}\/[0-9]+$/';
            preg_match($pattern, $this->request->request_uri, $matches);
            if (count($matches) === 1){
                var_dump($matches);
                var_dump($this->request->url_parts[0]);
                $resolver_key = sprintf('/%s/:id', $this->request->url_parts[0]);
                var_dump($resolver_key);
                if (array_key_exists($resolver_key, $routes)) {
                   $this->request->request_uri = $resolver_key;
                    return true;
                }
            } else {
                $pattern = '/^\/[a-z]{2,}\/[0-9]\/[a-z]{2,}+$/';
                preg_match($pattern, $this->request->request_uri, $matches);
                if (count($matches) === 1) {
                    $resolver_key = sprintf('/%s/:id/%s', $this->request->url_parts[0], $this->request->url_parts[2]);
                    var_dump($resolver_key);
                    if (array_key_exists($resolver_key, $routes)) {
                        var_dump($this->request->request_uri);
                        $this->request->request_uri = $resolver_key;
                    }
                    return true;
                }
            }
        }
        // die;
        // return in_array($this->request->request_uri, array_keys($routes));
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