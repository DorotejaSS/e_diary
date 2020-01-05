<?php

class PermissionController extends BaseController
{
   
    public function __construct($request)
    {
        $this->request = $request;
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
        $id = $this->request->url_parts[1];
        $permission = new Permission();
        $permissions_for_role = $permission->allowedPermissionsForRole($id);
        $role = $permission->getOne('roles', $id);

        $view = new View();
        $view->data['permissions'] = $permissions_for_role;
        $view->data['role'] = $role;
        $view->loadPage('admin', 'showrolepermissions');
    }

    public function editPermission()
    {
        $id = $this->request->url_parts[1];
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
        $id = $this->request->url_parts[1];
        $permission = new Permission();
        $permission->delete($id);
        header('Location: /permissions');
    }

    public function rolePermissionsEdit()
    {   
        $id = $this->request->url_parts[1];
        $permissions = new Permission();
        $permissions->selectPermissions($id);
        $permissions->getOne('roles', $id);

        $view = new View();
        $view->data['permissions'] = $permissions->selectPermissions($id);
        $view->data['role'] = $permissions->getOne('roles', $id);
        $view->loadPage('admin', 'rolepermissionsedit');
       
        if (isset($_POST['submit'])) {
            $allowed_permissions = $_POST['allowed'];
            $permissions->updatePermissions($allowed_permissions);
            $permissions->allowedPermissionsForRole($id);
            var_dump($permissions->allowedPermissionsForRole($id));
            // $view->loadPage('admin', 'showrolepermissions');
        }
        // $all_permissions = $view->data['permissions'];
    }
}