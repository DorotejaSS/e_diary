<?php
// allowed routes
$routes = array(
    '/login' => 'AccessController@login',
    '/logout' => 'AccessController@logout',
    '/reset-password' => 'AccessController@resetPassword',
    '/students' => 'StudentController@showAll',
    '/students/:id' => 'StudentController@getOne',
    '/admin' => 'AdminController@homePage'
);