<?php

class PermissionController extends BaseController
{
   
    public function __construct($request)
    {
        $this->request = $request;
    }

    public function permissions()
    {
        $view = new View();

        $base_model = new BaseModel();
        $base_model->showAll('permissions');
    
        $view->data = $base_model->showAll('permissions');
        $view->loadPage('admin', 'permissions');
    }

    public function addPermission()
    {
        $this->loadView('admin', 'permissionadd');
        if (!empty($this->request->post_params['permission']) && isset($this->request->post_params['submit'])) {
            $permission = new Permission();
            $permission->addPermission($this->request->post_params['permission']);
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
        $view = new View();
        $id = $this->request->url_parts[1];

        $base_model = new BaseModel();
        $base_model->getOne('permissions', $id);

        $view->data = $base_model->getOne('permissions', $id)[0];
        $view->loadPage('admin', 'permissionedit');

        if (isset($this->request->post_params['submit'])) {
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
        $view = new View();
       
        $permissions = new Permission();
        $permissions->selectPermissions($id);
        $permissions->getOne('roles', $id);

        $view->data['permissions'] = $permissions->selectPermissions($id);
        $view->data['role'] = $permissions->getOne('roles', $id);
        $view->loadPage('admin', 'rolepermissionsedit');
       
        if (isset($this->request->post_params['submit'])) { 
            $allowed_permissions = $this->request->post_params['allowed'];
            $permissions->updatePermissions($allowed_permissions); 
            die;
            $permissions->allowedPermissionsForRole($id);
            var_dump($permissions->allowedPermissionsForRole($id));
            // $view->loadPage('admin', 'showrolepermissions');
        }
        // $all_permissions = $view->data['permissions'];
    }
}