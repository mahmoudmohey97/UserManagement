<?php
class Database
{
    private $host = "172.17.0.1";
    private $db_name = "usermanagement";
    private $username = "root";
    private $password = "test";
    public $conn;

    public function getConnection()
    {
        $this->conn = null;
        try
        {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        }
        catch(PDOException $exception)
        {
            echo "Connection error: " . $exception->getMessage();
        }

        return $this->conn;
    }
}
?>
