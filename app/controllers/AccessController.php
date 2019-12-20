<?php
// preko ovog kontrolera cemo se logovati i komunicirati sa modelom oko toga
class AccessController extends BaseController
{
    public function login()
    {
        var_dump('logujemo se');
        $this->loadView('pages', 'login');
    }

    public function logout()
    {
        var_dump('logout');
    }

    
}