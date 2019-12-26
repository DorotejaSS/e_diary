<?php

    class AdminController extends BaseController {

        public function __construct()
        {
           $this->checkSession();
<<<<<<< HEAD
=======
            var_dump($_SESSION);
>>>>>>> aca86017b8f8b551aae802054a462b58903042a4
        }

        public function homePage()
        {
            $view = new View();
            $view->loadPage('admin', 'index');
        }



    }
