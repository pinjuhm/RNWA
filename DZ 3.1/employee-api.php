<?php 
    class Employee_Api {
        private $db;

        public function __construct($db) {
            $this->db = $db;
            header('Content-Type: application/json');
        }

        public function get_all() {
            $employees = $this->db->get_all();

            return json_encode(['employees' => $employees]);
        }

        public function get_all_by_id($id) {
            $employee = $this->db->get_single_by('emp_no', $id);
            
            return json_encode(['employee' => $employee ?: null]);
        }

        public function insert($employee) {
            $sql = "INSERT INTO employees SET first_name='". $employee->firstName ."', last_name='" . $employee->lastName . "', gender='" . $employee->gender . "'";
            $employee_id = $this->db->insert($sql);
            
            return json_encode(['employee_id' => $employee_id]);
        }

        public function update($employee) {
            $sql = "UPDATE employees SET first_name='". $employee->firstName ."', last_name='" . $employee->lastName . "', gender='" . $employee->gender . "' WHERE emp_no=" . $employee->id;
            $result = $this->db->update($sql);
            
            return json_encode(['success' => $result]);
        }

        public function delete_by_id($id) {
            $result = $this->db->delete($id);

            return json_encode(['success' => $result]);
        }
    }
?>