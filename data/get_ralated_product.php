<?php
$pid = $_REQUEST["pid"];

require("init.php");
$sql = "select pid,pname,pic,price,onsale from swt_product where family_id=(select family_id from swt_product where pid=$pid) limit 2,4";

$result = mysqli_query($conn,$sql);
$relatedPro = mysqli_fetch_all($result,1);
echo json_encode($relatedPro);

?>