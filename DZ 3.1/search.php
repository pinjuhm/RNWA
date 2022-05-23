<?php 
  require_once './db.php';

  const MAX_DATA_NUMBER = 10;
  $search_term = $_GET['s'];

  try {
    $db = new DB('hospital');
    $result = $db->get_all_by('naziv', $search_term, MAX_DATA_NUMBER);
    echo json_encode($result);
  } catch(PDOException $ex) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'DB error with connecting or query executing']);
  } 
  catch(Exception $ex) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Unexpected exception occured, please try again later!']);
  } 
?>