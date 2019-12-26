<?php
// allowed routes
$routes = array(
    '/login' => 'AccessController@login',
    '/logout' => 'AccessController@logout',
    '/reset-password' => 'AccessController@resetPassword',
    '/students' => 'StudentController@showAll',
    '/students/:id' => 'StudentController@getOne',
    '/admin' => 'AdminController@homePage',
    '/users' => 'UserController@showAll',
    '/users/:id' => 'UserController@getOne',
<<<<<<< HEAD
    '/parents' => 'ParentController@showChild',
    '/proffesor' => 'ProffesorController@homePage',
=======
    '/users/:id/edit' => 'UserController@edit',
    '/principal' => 'PrincipalController@homePage',
    '/parents' => 'ParentController@showChild'
>>>>>>> 4536a5038a7a3593a37a6f4f225e0993bb1bd0ad
);