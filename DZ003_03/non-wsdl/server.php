<?php
  function returnStudent($id) {
    include('../db.php');
    $output = '';
    $query = "SELECT patient.Name AS patient_name, doctor.Name AS doctor_name FROM patient INNER JOIN doctor ON patient.PatientId = patient_doctor.Patient_PatientId WHERE patient.PatientId = $id";
    $result = mysqli_query($conn, $query);
    echo $result;
    if (mysqli_num_rows($result) > 0)
    {
      while ($row = mysqli_fetch_assoc($result)) {
        $output .= '
        <tr>
          <td>'.$row['patient_name'].'</td>
          <td>'.$row['doctor_name'].'</td>
        </tr>
        ';
      }
      return $output;
    } else {
      return "empty";
    }
  }

  $server = new SoapServer(null, [
    'uri' => 'http://test-uri'
  ]);
  $server->addFunction('returnPatient');
  $server->handle();
?>