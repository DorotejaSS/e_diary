<?php

class Request
{
    
    public $url_parts = array();    // url parts je deo url-a do "?" 
    public $post_params = array(); // post params su parametri koje saljemo preko posta (jos ih nema)
    public $get_params = array(); // get params je deo koda posle '?' 
    public $request_uri;

    public function __construct()
    {
        $this->request_uri = $_SERVER['REQUEST_URI'];
        $this->extractUrl();
        $this->extractGetParams();
        $this->extractPostParams();
    }
    // razdvajamo url parts 
    private function extractUrl()
    {
        $url = explode('?', $_SERVER['REQUEST_URI']);
        $url = explode('/', substr($url[0], 1));
        $this->url_parts = $url;
    }
    // i drugi deo koji je get parts, ovo path ce vam biti jasno kada pogledate htaccess ,trazi deo 'path'
    private function extractGetParams()
    {
        unset($_GET['path']);
        $this->get_params = $_GET;
    }

    private function extractPostParams()
    {
        $this->post_params = $_POST;
    }

}