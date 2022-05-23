<?php 
	require_once './db.php';
	require_once './employee-api.php';
	
	function handle_employee_request() {
		$db = new DB('employees');
		$employee_api = new Employee_Api($db);

		$request_method = $_SERVER['REQUEST_METHOD'];
		$id = $_GET['id'] ?? null;
		$id = !empty($id) 
			? (int) filter_var($id, FILTER_SANITIZE_NUMBER_INT)  
			: null;

		switch ($request_method) {
			case 'GET':
				if (empty($id)) {
					echo $employee_api->get_all();
				} else {
					echo $employee_api->get_all_by_id($id);
				}
				break;
			case 'POST':
				$data = json_decode(file_get_contents('php://input'), true);
				echo $employee_api->insert((object)$data);
				break;
			case 'PUT':
				$data = json_decode(file_get_contents('php://input'), true);
				$employee_api->update((object)$data);
				break;
			case 'DELETE':
				$employee_api->delete_by_id($id);
				break;
			default:
				header("HTTP/1.0 405 Method Not Allowed");
				break;
		}
	}

	handle_employee_request();
?>