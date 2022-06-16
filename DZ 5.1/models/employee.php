<?php 
    require_once 'employee_dto.php';

    class Employee {
        public function get_all() {
            $db = new DB('employees');
            $employees = $db->get_all();
            
            return array_map(function($employee) {
                return new Employee_Dto($employee);
            }, $employees);
        }

        public function find($id) {
            $db = new DB('employees');
            $employee = $db->get_single_by('emp_no', $id);

            $db = new DB('employee_department');
            $department = $db->get_single_by('id', $employee['employee_department_id']);
            $employee['department_name'] = $department['name'];

            return new Employee_Dto($employee);
        }
    }
?>