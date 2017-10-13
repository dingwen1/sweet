<?php
require("init.php");
$sql="select * from swt_product_family";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,MYSQLI_ASSOC);

#var_dump($row);
echo json_encode($row);

?>