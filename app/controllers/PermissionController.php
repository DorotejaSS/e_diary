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
        $view = new View();
        $permission = new Permission();
        $role_data = [];
        foreach ($permission->showAll('roles') as $value) {
            $role_data[] = $value;
        }
        $view->data['role_data'] = $role_data;
        $view->loadPage('admin', 'permissionadd');
        
        $permission_param = $this->request->post_params['permission'] ?? array();
        $role_param = $this->request->post_params['roles'] ?? array();
        $submit = $this->request->post_params['submit'] ?? array();

        if (!empty($permission_param) && !empty($role_param) && isset($submit)) {
            $inserted_permission_id = $permission->addPermission($permission_param);
            $permission->updateRolePermissions($inserted_permission_id, $role_param);
            $asign_role_permission = $permission->asignRolePermission($role_param, $inserted_permission_id);
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
            // var_dump('DA');
            // var_dump($allowed_permissions);
            $available_permissions_raw = $permissions->selectPermissions($id);
            $available_permissions = array_map(function($permission_row){
                return $permission_row['id'];
            }, $available_permissions_raw);
            // available_permissions su sve permisije koje postoje
            
            // forbidden_permissions su permisije koje nisu dozvoljene ili su unchecked, dobijamo ih 
            //diferencijom SVIH(available_permissions) i ONIH koje su checkirane(allowed_permissions)
            $forbidden_permissions = array_diff($available_permissions, $allowed_permissions);         
            // var_dump('NE');
            // var_dump($forbidden_permissions);
            // var_dump($id);
            $permissions->updatePermissions($id, $allowed_permissions, $forbidden_permissions);
        }
        
        $permissions->selectPermissions($id);
        $permissions->getOne('roles', $id);

        $view->data['permissions'] = $permissions->selectPermissions($id);
        $view->data['role'] = $permissions->getOne('roles', $id);
        $view->loadPage('admin', 'rolepermissionsedit');
        
    }
}