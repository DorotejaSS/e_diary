<?php

class RoleController extends BaseController
{

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function roles()
    {
        $base_model = new BaseModel();
        $base_model->showAll('roles');

        $view = new View();
        $view->data = $base_model->showAll('roles');
        $view->loadPage('admin', 'roles');
    }

    public function roleAdd()
    {
        $this->loadView('admin', 'roleadd');
        if (!empty($this->request->post_params['role']) && isset($this->request->post_params['submit'])) {
            $role = new Role();
            $role->addRole($this->request->post_params['role']);
            header('Location: /roles');
        }   
    }

    public function getOne()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $base_model->getOne('roles', $id);

        $view = new View();
        $view->data = $base_model->getOne('roles', $id)[0];
        $view->loadPage('admin', 'showonerole');
    }

    public function roleEdit()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $base_model->getOne('roles', $id);

        $view = new View();
        $view->data = $base_model->getOne('roles', $id)[0];
        $view->loadPage('admin', 'roleedit');

        if (isset($this->request->post_params['submit'])) {
            $role = new Role();
            $role->edit($id);
            header('Location: /roles');
        }
    }

    public function roleDelete()
    {
        $id = $this->request->url_parts[1];
        $role = new Role();
        $role->delete($id);
        header('Location: /roles');
    }
}