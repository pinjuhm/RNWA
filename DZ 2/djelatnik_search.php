<?php
// get the q parameter from URL
$s = $_REQUEST["s"];
$hint = "";

// lookup all hints from array if $q is different from "" 
if ($s !== "") {
    $s = strtolower($s);
    $len=strlen($s);
    /*
	foreach($a as $name) {
        if (stristr($s, substr($name, 0, $len))) {
            if ($hint === "") {
                $hint = $name;
            } else {
                $hint .= ", $name";
            }
        }
    }
	
	*/
	

/**********************************************************/
$db = mysqli_connect("localhost","id11438358_jure","Fntdqpb4TCHAE}[D");

if($db) {

$result = mysqli_select_db($db, "id11438358_northwind") or die("Došlo je do problema prilikom odabira baze...");
$sql="SELECT * FROM employees where FirstName LIKE '%$s%' OR LastName LIKE '%$s%'";
//echo $sql;
$result2 = mysqli_query($db, $sql) or die("Došlo je do problema prilikom izvrsavanja upita...");
$n=mysqli_num_rows($result2);

if ($n > 0){
	while ($myrow=mysqli_fetch_row($result2)){
			//echo $myrow[0].",".$myrow[1].",".$myrow[2];
			$hint .= "<div name=\"result\" id=\"".$myrow[1]."\">".$myrow[0].",".$myrow[1].",</div>";

		}
	}
else {
//echo "No patern rows returned<br>";
}	
}
else {
echo "<br>Nije proslo spajanje<br>";
}
/**********************************************************/
	
}

// Output "no suggestion" if no hint was found or output correct values 
echo $hint === "" ? "no suggestion" : $hint;

?>