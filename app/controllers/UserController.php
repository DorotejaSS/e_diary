<?php
//user nasledjuje admina, a admin bazni kontroler
class UserController extends AdminController
{
    protected $role_id = '1';

    public function __construct($request)
    {
        $this->request = $request;
        $this->checkSession();
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
    }

    public function showAll()
    {
        $user = new User();
        $user->showAll('users');
       
        $view = new View();
        $view->data = $user->showAll('users');
        $view->loadPage('admin','showallusers');
    }

    public function getOne()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $get_one_user = $base_model->getOne('users', $id);
        $view = new View();
        
        if ($get_one_user[0]['role_id'] === '3') {
            $get_by_role_id = $base_model->getByRoleId($id);
        } else if($get_one_user[0]['role_id'] === '5') {
            var_dump('roditelj');
            $bring_the_child = $base_model->usersChild($id);
        }
        $view->data['child_data'] = $bring_the_child ?? array();
        $view->data['prof_data'] = $get_by_role_id  ?? array();
        $view->data['user'] = $get_one_user[0];
        $view->loadPage('admin', 'showoneuser');
    }

    public function edit()
    {   
        $id = $this->request->url_parts[1];
        $user = new User();
        $get_one_user = $user->getOne('users', $id);
        $show_all_subj = $user->distinctShowAll('subjects');
        
        $view = new View();
        $view->data['subjects'] = $show_all_subj;
        if ($get_one_user[0]['role_id'] === '3') {
            $get_by_role_id = $user->getByRoleId($id);
        } 

        $view->data['prof_data'] = $get_by_role_id  ?? array();
        $view->data['user'] = $get_one_user[0];
        $view->loadPage('admin', 'edituser');

        if ($get_one_user[0]['role_id'] === '3' && isset($this->request->post_params['submit'])) {
            $user = new User();
            $user->update($id);
            $subject = new Subject();
            $subject->update($id);
        }
     
        if (isset($this->request->post_params['submit'])) {
            $user = new User();
            $user->update($id);
        }
    
    }

    public function delete()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $base_model->deleteParent($id);
        $base_model->delete('users', $id);
        header('Location: /users');
    }

    public function add()
    {
        $view = new View();
        
        if (isset($_POST['hash'])) {
            $password = $this->generatePassword();
            $this->generatePassword();
        }
        
        $view->data['password'] = $password ?? false;
        $view->loadPage('admin', 'adduser');
        
        if (isset($_POST['submit'])) {
            $user = new User();
            $user->add();
            header('Location: /users');
        }
    }

    public function generatePassword($length = 10)
    {   
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $password = substr(str_shuffle($chars), 0, $length);
        return $password;
    }
}