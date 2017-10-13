<?php
$uid=$_REQUEST["uid"];

require("init.php");
$sql="select onsale,count,price from swt_shoppingcart,swt_product where
swt_shoppingcart.product_id=swt_product.pid and user_id=$uid";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,MYSQLI_ASSOC);
#var_dump($row);

$totalPrice=0;
$countPro=0;
foreach($row as $k=>$v){
    $totalPrice+=$v["count"]*$v["price"]*$v["onsale"];
    $countPro+=$v["count"];
}
$arr = [$totalPrice,$countPro];
echo json_encode($arr);

?>