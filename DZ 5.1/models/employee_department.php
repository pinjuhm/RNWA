<?php 
    require_once 'employee_department_dto.php';

    class Employee_Department {
        public function get_all() {
            $db = new DB('employee_department');
            $employee_deparments = $db->get_all();
            
            return array_map(function($employee_deparment) {
                return new Employee_Deparment_Dto($employee_deparment);
            }, $employee_deparments);
        }

        public function find($id) {
            $db = new DB('employee_department');
            $employee_deparment = $db->get_single_by('id', $id);

            return new Employee_Deparment_Dto($employee_deparment);
        }
    }
?>