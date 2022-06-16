<?php 
    class Employee_Deparment_Dto {
        public $id;
        public $name;
        public $description;

        public function  __construct($employee_data){
            $this->id = $employee_data['id'];
            $this->name = $employee_data['name'];
            $this->description = $employee_data['description'];
        }
    }
?>