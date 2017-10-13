<?php
@$pid=$_REQUEST["pid"];
@$count=$_REQUEST["count"];
@$uid=$_REQUEST["uid"];

require("init.php");
/* 1。查询数据有没有uid和pid的信息 */
$sql = "select count from swt_shoppingcart where user_id=$uid and product_id=$pid";
$result = mysqli_query($conn,$sql);
$oldcount = mysqli_fetch_row($result);
if($oldcount[0]){
    $sql = "update swt_shoppingcart set count=($oldcount[0]+$count) where user_id=$uid and product_id=$pid";
}else{
    $sql="insert into swt_shoppingcart(user_id,product_id,count) values($uid,$pid,$count)";
}
$result=mysqli_query($conn,$sql);
/* $sql="insert into swt_shoppingcart(user_id,product_id,count) values($uid,$pid,$count)";
$result=mysqli_query($conn,$sql);
 */
/*if($result){
    echo "添加商品成功";
}else{
    echo "添加失败";
}*/


?>