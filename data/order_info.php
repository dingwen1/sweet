<?php
@$uid=$_REQUEST["uid"];

require("init.php");
$sql="select status,order_time,orderInfo,order_price,phone,addr from swt_order,swt_user where swt_order.user_id=swt_user.uid and user_id=$uid";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,1);

echo json_encode($row);


?>