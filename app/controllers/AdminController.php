<?php

    class AdminController extends BaseController {

        public function __construct()
        {
           $this->checkSession();
        }

        public function homePage()
        {
            $view = new View();
            $view->loadPage('admin', 'index');
             $view->loadPage('pages', 'welcome');
        }

        
    }
