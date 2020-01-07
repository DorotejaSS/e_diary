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
       
        if (isset($this->request->post_params['submit'])) {
            //null coalescing operator (??)
            // It is used to replace the ternary operation in conjunction with isset() function. 
            //The Null coalescing operator returns its first operand if it exists and is not NULL; 
            //otherwise it returns its second operand.
            $allowed_permissions = $this->request->post_params['allowed'] ?? array();
            //allowed_permissions su permisije koje su dozvoljene(checkirane)

            $available_permissions_raw = $permissions->selectPermissions($id);
            $available_permissions = array_map(function($permission_row){
                return $permission_row['id'];
            }, $available_permissions_raw);
           // available_permissions su sve permisije koje postoje
            
            // forbidden_permissions su permisije koje nisu dozvoljene ili su unchecked, dobijamo ih 
            //diferencijom SVIH(available_permissions) i ONIH koje su checkirane(allowed_permissions)
            $forbidden_permissions = array_diff($available_permissions, $allowed_permissions);         
            $permissions->updatePermissions($id, $allowed_permissions, $forbidden_permissions);
        }
        
        $permissions->selectPermissions($id);
        $permissions->getOne('roles', $id);

        $view->data['permissions'] = $permissions->selectPermissions($id);
        $view->data['role'] = $permissions->getOne('roles', $id);
        $view->loadPage('admin', 'rolepermissionsedit');
        
    }
}