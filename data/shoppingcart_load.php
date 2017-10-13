<?php
/* 接受uid向数据库获取购物车信息 */
$uid = $_REQUEST["uid"];
require("init.php");
$sql = "select sid,user_id,product_id,count,pname,price,pic,onsale,fname from swt_shoppingcart,swt_product,swt_product_family where swt_shoppingcart.product_id=swt_product.pid and swt_product.family_id=swt_product_family.fid and user_id=$uid";

$result = mysqli_query($conn,$sql);
$cart = mysqli_fetch_all($result,1);
echo json_encode($cart);

?>