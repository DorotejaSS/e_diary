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
    // '/roles/:id' => 'RoleController@getOne',
    '/roles/:id/edit' => 'RoleController@roleEdit',
    '/roles/:id/delete' => 'RoleController@roleDelete',

    '/permissions' => 'PermissionController@permissions',
    '/permissions/add' => 'PermissionController@addPermission',
    // '/permissions/:id' => 'PermissionController@getOne',
    '/permissions/:id/edit' => 'PermissionController@editPermission',
    '/permissions/:id/delete' => 'PermissionController@deletePermission',

    '/rolepermissions/:id/edit' => 'PermissionController@rolePermissionsEdit',

    '/users' => 'UserController@showAll',
    '/users/add' => 'UserController@add',
    '/users/:id' => 'UserController@getOne',
    '/users/:id/edit' => 'UserController@edit',
    '/users/:id/delete' => 'UserController@delete',

    '/subjects' => 'SubjectController@showAll',

    '/schedule' => 'ScheduleController@index',

    '/parents' => 'ParentController@index',
    '/parents/:id' => 'ParentController@showGrades',

    '/professor' => 'ProfessorController@homePage',

    '/grades' => 'GradesController@Grades',
    '/grades/:id/addgrades' => 'ProfessorController@addGrades',
    '/grades/:id/editgrades' => 'ProfessorController@editGrades',
    '/grades/:id/concludegrades' => 'ProfessorController@concludeGrades',


    '/principal' => 'PrincipalController@homePage',
    '/teacher' => 'TeacherController@studentGroup'
);