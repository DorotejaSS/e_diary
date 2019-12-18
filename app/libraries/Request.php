<?php

class Request
{
    public $url_parts = array();
    public $post_params = array();
    public $get_params = array();
    public $request_uri;

    public function __construct()
    {
        $this->request_uri = $_SERVER['REQUEST_URI'];
        $this->extractUrl();
        $this->extractGetParams();
        $this->extractPostParams();
    }

    private function extractUrl()
    {
        $url = explode('?', $_SERVER['REQUEST_URI']);
        $url = explode('/', substr($url[0], 1));
        $this->url_parts = $url;
    }
    
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