<?php

$s = $_REQUEST["s"];
$hint = "";
if ($s !== "") {
    $s = strtolower($s);
    $len=strlen($s);

$db = mysqli_connect("localhost:3307","root","","hospital");

if($db) {

$result = mysqli_select_db($db, "hospital") or die("Doslo je do problema prilikom odabira baze...");
$sql="SELECT * FROM doctors where Name LIKE '%$s%'";

$result = mysqli_query($db, $sql) or die("Doslo je do problema prilikom izvrsavanja upita...");

echo "<table>
      <tr>
      <th>Id</th>
      <th>name</th>
      </tr>";
$n=mysqli_num_rows($result);
if ($n > 0){
	while ($myrow=mysqli_fetch_row($result)){
            echo "<tr>";
            echo "<td>" . $myrow[0] . "</td>";
            echo "<td>" . $myrow[1] . "</td>";
            echo "</tr>";
            
		}
        echo "</table>";
	}
else {
//echo "<span>not found</span>";
}	
}
else {
echo "<br>Nije proslo spajanje<br>";
}
	
}


?>