<?php
// allowed routes
$routes = array(
    '/login' => 'AccessController@login',
    '/logout' => 'AccessController@logout',
    '/reset-password' => 'AccessController@resetPassword',

    '/students' => 'StudentController@showAll',
    '/students/:id' => 'StudentController@getOne',

    '/admin' => 'AdminController@homePage',

    '/roles' => 'RoleController@roles',
    '/roles/add' => 'RoleController@roleAdd',
    '/roles/:id' => 'RoleController@getOne',
    '/roles/:id/edit' => 'RoleController@roleEdit',
    '/roles/:id/delete' => 'RoleController@roleDelete',

    '/permissions' => 'PermissionController@permissions',
    '/permissions/add' => 'PermissionController@addPermission',
    '/permissions/:id' => 'PermissionController@getOne',
    '/permissions/:id/edit' => 'PermissionController@editPermission',
    '/permissions/:id/delete' => 'PermissionController@deletePermission',

    '/rolepermissions/:id/edit' => 'PermissionController@rolePermissionsEdit',

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