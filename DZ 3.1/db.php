<?php 
class DB {
    private $servername = "localhost";
    private $username = "root";
    private $password = "";
    private $db_name = "world-database";
    private $db;
    private $table_name;

    public function __construct($table_name) {
        try {
            $conn = new PDO(
                "mysql:host=$this->servername;dbname=$this->db_name", 
                $this->username, 
                $this->password
            );
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->db = $conn; 
            $this->table_name = $table_name;
        } catch(PDOException $ex) {
            $this->db = null;
        }
    }

    public function get_all() {
        if ($this->db == null) return null;
        $sql = "SELECT * FROM $this->table_name";
        $statement = $this->db->prepare($sql);
        $statement->execute();
        
        return $statement->fetchall();
    }

    public function get_all_by($attribute, $value, $limit) {
        if ($this->db == null) return null;
        $sql = "SELECT * FROM $this->table_name WHERE $attribute LIKE '%$value%' LIMIT $limit";
        $statement = $this->db->prepare($sql);
        $statement->execute();
        
        return $statement->fetchall();
    }

    public function get_single_by($attribute, $value) {
        if ($this->db == null) return null;
        $sql = "SELECT * FROM $this->table_name WHERE $attribute = $value LIMIT 1";
        $statement = $this->db->prepare($sql);
        $statement->execute();
        
        return $statement->fetch();
    }

    public function insert($sql) {
        if ($this->db == null) return null;
        $statement = $this->db->prepare($sql);
        $result = $statement->execute();
        
        return $this->db->lastInsertId();
    }

    public function update($sql) {
        if ($this->db == null) return null;
        $statement = $this->db->prepare($sql);
        $result = $statement->execute();
        
        return $result;
    }

    public function delete($id) {
        if ($this->db == null) return null;
        $sql = "DELETE FROM $this->table_name WHERE emp_no = $id";
        $statement = $this->db->prepare($sql);
        $result = $statement->execute();
        
        return $result;
    }
}
?>
