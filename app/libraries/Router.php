<?php

class Router
{
    public $request;

    public function __construct()
    {   
        $this->request = new Request();
        // if route exists (config/routes.php) instatiate controller
        if ($this->routeExists()) {
            $this->instantiateController();
        }
    }

    /***
     * kada se u if-u nalazi return, nema potrebe za pravljenjem else grane, moze se i bez nje
     * ako skripta udje u if, izacice iz metode, ako ne udje, nastavice da se izvrsava ostatak koda bio on u else-u ili ne
     * probaj malo ovo da refaktorises, sigurno moze sa manje else grana
     * vidim i da je u else granama slicna logika samo se pattern i resolver_key razlikuju, don't repeat yourself :)
     * Probaj da napravis jos jednu metodu kojoj ces poslati pattern i jednostavno je dva puta pozvati
     */
    public function routeExists()
    {
        global $routes;
        if (in_array($this->request->request_uri, array_keys($routes))) {
            //čišćene ekrana
           /* var_dump('imamo rutu, slucaj 1, basic');*/
            return true;
        } else {
            $pattern = '/^\/[a-z]{2,}\/[0-9]{1,}+$/';
            preg_match($pattern, $this->request->request_uri, $matches);
            if (count($matches) === 1){
                $resolver_key = sprintf('/%s/:id', $this->request->url_parts[0]);
                // var_dump($resolver_key);
                if (array_key_exists($resolver_key, $routes)) {
                   $this->request->request_uri = $resolver_key;
                    return true;
                }
            } else {
                $pattern = '/^\/[a-z]{2,}\/[0-9]{1,}\/[a-z]{2,}+$/';
                preg_match($pattern, $this->request->request_uri, $matches);
                if (count($matches) === 1) {
                    $resolver_key = sprintf('/%s/:id/%s', $this->request->url_parts[0], $this->request->url_parts[2]);
                    // var_dump($resolver_key);
                    if (array_key_exists($resolver_key, $routes)) {
                        // var_dump($this->request->request_uri);
                        $this->request->request_uri = $resolver_key;
                    }
                    return true;
                }
            }
        }
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