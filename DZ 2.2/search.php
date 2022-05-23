<?php 
  require_once './db.php';

  $search_term = $_GET['s'];
  $sql = "SELECT * FROM baze_podataka WHERE naziv LIKE '%$search_term%' LIMIT 10";
  $query = $conn->query($sql);
  $result = $query->fetch_all(MYSQLI_ASSOC);
  echo json_encode($result);
?>