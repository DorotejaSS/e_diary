<?php

class StudentController
{
    public function __construct()
    {
        var_dump('STUDENT KONTROLER');
    }

    public function showAll()
    {
        var_dump('prikazujem sve studente');
    }

    public function getOne()
    {
        var_dump('get One metoda');
    }
}