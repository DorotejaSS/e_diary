<?php

class PermissionController extends BaseController
{
    public function __construct()
    {

    }

    public function permissions()
    {
        $base_model = new BaseModel();
        $base_model->showAll('permissions');
        
        $view = new View();
        $view->data =  $base_model->showAll('permissions')[0];
        $view->loadPage('admin', 'permissions');
    }

    public function addPermission()
    {
        $this->loadView('admin', 'permissionadd');
        if (!empty($_POST['permission']) && isset($_POST['submit'])) {
            $permission = new Permission();
            $permission->addPermission($_POST['permission']);
            header('Location: /permissions');
        }   
    }

    public function getOne()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];

        $permission = new Permission();
        $permissions_for_role = $permission->permissionsForRole($id);

        $view = new View();
        $view->data =  $permissions_for_role;
        $view->loadPage('admin', 'showrolepermissions');
    }

    public function editPermission()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];
       
        $base_model = new BaseModel();
        $base_model->getOne('permissions', $id);

        $view = new View();
        $view->data = $base_model->getOne('permissions', $id)[0];
        $view->loadPage('admin', 'permissionedit');

        if (isset($_POST['submit'])) {
            $permission = new Permission();
            $permission->edit($id);
            header('Location: /permissions');
        }
    }

    public function deletePermission()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];
      
        $permission = new Permission();
        $permission->delete($id);
        header('Location: /permissions');
    }
}