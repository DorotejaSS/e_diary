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
    '/parents' => 'ParentController@showChild',
    '/proffesor' => 'ProffesorController@homePage',
    '/users/:id/edit' => 'UserController@edit',
    '/users/:id/delete' => 'UserController@delete',
    '/principal' => 'PrincipalController@homePage',
    '/parents' => 'ParentController@showChild'
);