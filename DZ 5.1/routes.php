<?php
  function call($controller, $action) {
    require_once('controllers/' . $controller . '_controller.php');

    switch($controller) {
      case 'pages':
        $controller = new PagesController();
        break;
	   case 'employees':
        require_once('models/employee.php');
		    $controller = new EmployeesController();
        break;
      case 'employee_departments':
          require_once('models/employee_department.php');
          $controller = new EmployeeDepartmentsController();
          break;
      default: 
        break;      
    }

    $controller->{ $action }();
  }

  $controllers = [
    'pages'       => ['home', 'error'],
    'employees' 	=> ['index', 'show'],
    'employee_departments' 	=> ['index', 'show'],
  ];

  if (array_key_exists($controller, $controllers)) {
    if (in_array($action, $controllers[$controller])) {
      call($controller, $action);
    } else {
      call('pages', 'error');
    }
  } else {
    call('pages', 'error');
  }
?>