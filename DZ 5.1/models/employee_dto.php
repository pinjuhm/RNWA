<?php 
    class Employee_Dto {
        public $id;
        public $firstName;
        public $lastName;
        public $birthData;
        public $gender;
        public $hireDate;
		public $contact
        public $departmentName;

        public function  __construct($employee_data){
            $this->id = $employee_data['emp_no'];
            $this->firstName = $employee_data['first_name'];
            $this->lastName = $employee_data['last_name'];
            $this->birthDate = $employee_data['birth_date'];
            $this->gender = $employee_data['gender'];
            $this->hireDate = $employee_data['hire_date'];
			$this->contact = $employee_data['contact'];
            $this->departmentName = $employee_data['department_name'] ?? '';
        }
    }
?>