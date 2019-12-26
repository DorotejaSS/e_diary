<?php

    class AdminController extends BaseController {

        public function __construct()
        {
           $this->checkSession();
            var_dump($_SESSION);
        }

        public function homePage()
        {
            $view = new View();
            $view->loadPage('admin', 'index');
        }

        
    }
