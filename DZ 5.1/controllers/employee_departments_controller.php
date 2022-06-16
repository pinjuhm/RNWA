<?php
  class EmployeeDepartmentsController {
    private $employe_department_model;

    public function __construct() {
        $this->employe_department_model = new Employee_Department();
    }

    public function index() {
      $employee_departments = $this->employe_department_model->get_all();

      require_once('views/employee-departments/index.php');
    }

    public function show() {
      $id = $_GET['id'];
      if (!isset($id))
        return call('pages', 'error');

      $employee_department = $this->employe_department_model->find($id);
      require_once('views/employee-departments/show.php');
    }
  }
?>