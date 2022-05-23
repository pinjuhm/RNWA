<?php
  if(!extension_loaded("soap")){
    dl("php_soap.dll");
  }
  $server = new SoapServer("patient.wsdl");
  function returnPatient($id) {
    include('../db.php');
    $output = '';
    $query = "SELECT patient.Name AS Patient_name, doctors.Name AS doctor_name FROM patient INNER JOIN patient_doctors ON patient.PatientId = patient_doctors.patient_PatientId INNER JOIN doctors ON doctors.doctorId = patient_doctors.doctors_doctorId WHERE patient.PatientId = $id";
    $result = mysqli_query($conn, $query);
    echo $result;
    if (mysqli_num_rows($result) > 0)
    {
      while ($row = mysqli_fetch_assoc($result)) {
        $output .= '
        <tr>
          <td>'.$row['Patient_name'].'</td>
          <td>'.$row['doctor_name'].'</td>
        </tr>
        ';
      }
      return $output;
    } else {
      return "empty";
    }
  }

  
  $server->addFunction('returnPatient');
  $server->handle();
?>