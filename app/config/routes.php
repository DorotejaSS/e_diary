<?php
// allowed routes
$routes = array(
    '/login' => 'AccessController@login',
    '/logout' => 'AccessController@logout',
    '/reset-password' => 'AccessController@resetPassword',
    '/newpassword' => 'AccessController@newPassword',

    '/students' => 'StudentController@showAll',
    '/students/add' => 'StudentController@add',
    '/students/:id' => 'StudentController@getOne',
    '/students/:id/edit' => 'StudentController@edit',
    '/students/:id/delete' => 'StudentController@delete',

    '/studentgroup' => 'StudentGroupController@showAll',
    '/studentgroup/:id' => 'StudentGroupController@index',
    '/studentgroup/:id/students' => 'StudentGroupController@students',
    '/studentgroup/:id/schedule' => 'StudentGroupController@schedule',

    '/admin' => 'AdminController@homePage',

    '/roles' => 'RoleController@roles',
    '/roles/add' => 'RoleController@roleAdd',
    '/roles/:id/edit' => 'RoleController@roleEdit',
    '/roles/:id/delete' => 'RoleController@roleDelete',

    '/permissions' => 'PermissionController@permissions',
    '/permissions/add' => 'PermissionController@addPermission',
    '/permissions/:id/edit' => 'PermissionController@editPermission',
    '/permissions/:id/delete' => 'PermissionController@deletePermission',

    '/rolepermissions/:id/edit' => 'PermissionController@rolePermissionsEdit',

    '/users' => 'UserController@showAll',
    '/users/add' => 'UserController@add',
    '/users/:id' => 'UserController@getOne',
    '/users/:id/edit' => 'UserController@edit',
    '/users/:id/delete' => 'UserController@delete',

    '/subjects' => 'SubjectController@showAll',
    '/subjects/add' => 'SubjectController@addSubject',
    '/subjects/:id' => 'SubjectController@getOne',
    '/subjects/:id/edit' => 'SubjectController@edit',
    '/subjects/:id/delete' => 'SubjectController@delete',

    '/schedule' => 'ScheduleController@index',
    '/ajax' => 'ScheduleController@ajax',

    '/parents' => 'ParentController@index',
    '/parents/:id' => 'ParentController@showGrades',

    '/professor' => 'ProfessorController@homePage',
    '/mystudents/:id' => 'ProfessorController@mainClass',
    '/studentgroups/:id' => 'ProfessorController@otherClasses',
    '/grades/:id' => 'ProfessorController@gradesTeacherView',
    '/mystudentgrade/:id' => 'ProfessorController@gradesMainTeacherView',

    '/principal' => 'PrincipalController@homePage',
    '/charts' => 'PrincipalController@ajax',
    
    '/teacher' => 'TeacherController@studentGroup'
);