<?php

    class AdminController extends BaseController {

        public function __construct()
        {
           var_dump($_SESSION);
        }

        public function homePage()
        {
            var_dump('u home page admina');
        }

        
    }
