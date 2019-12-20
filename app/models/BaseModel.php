<?php
// ovim baznim modelom komuniciramo sa bazom preko PDO (nisam nikad radila ovo tako da ne znam da objasnim dok ne naucim :D)
class BaseModel
{
    private $conn;

    public function __construct()
    {
        $dsn = "mysql:host=".DB_HOST.";dbname=".DB_NAME.";";
        $opt = [
            \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            \PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        $pdo = new \PDO($dsn, DB_USER, DB_PASS); //, $opt
        $this->conn = $pdo;
    }
}