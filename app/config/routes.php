<?php
// allowed routes
$routes = array(
    '/login' => 'AccessController@login',
    '/logout' => 'AccessController@logout',
    '/reset-password' => 'AccessController@resetPassword',
    '/students' => 'StudentController@showAll',
    '/students/:id' => 'StudentController@getOne',
    '/admin' => 'AdminController@homePage',
    '/roles' => 'AdminController@roles',
    '/roles/add' => 'AdminController@roleAdd',
    '/roles/edit' => 'AdminController@roleEdit',
    '/roles/delete' => 'AdminController@roleDelete',
    '/permissions' => 'AdminController@permissions',
    '/permissions/add' => 'AdminController@addPermission',
    '/permissions/edit' => 'AdminController@editPermission',
    '/permissions/delete' => 'AdminController@deletePermission',
    '/role-permissions/edit' => 'AdminController@rolePermissionEdit',
    '/users' => 'UserController@showAll',
    '/users/add' => 'UserController@add',
    '/users/:id' => 'UserController@getOne',
    '/users/:id/edit' => 'UserController@edit',
    '/users/:id/delete' => 'UserController@delete',
    '/parents' => 'ParentController@showChild',
    '/professor' => 'ProfessorController@homePage',
    '/principal' => 'PrincipalController@homePage',
    '/teacher' => 'TeacherController@studentGroup'
);