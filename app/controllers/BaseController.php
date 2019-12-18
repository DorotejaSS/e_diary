<?php

class BaseController
{
    private $request;

    public function __construct($request)
    {
        $this->request = $request;
    }
}