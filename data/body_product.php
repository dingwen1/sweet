<?php
require("init.php");
$sql="select pid,pname,price,title,onsale,pic as md  from swt_product limit 0,10";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,MYSQLI_ASSOC);

echo json_encode($row);

?>