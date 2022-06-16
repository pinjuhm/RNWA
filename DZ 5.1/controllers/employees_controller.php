<?php
  class EmployeesController {
    private $employe_model;

    public function __construct() {
        $this->employee_model = new Employee();
    }

    public function index() {
      $employees = $this->employee_model->get_all();

      require_once('views/employees/index.php');
    }

    public function show() {
      $id = $_GET['id'];
      if (!isset($id))
        return call('pages', 'error');

      $employee = $this->employee_model->find($id);
      require_once('views/employees/show.php');
    }
  }
?>