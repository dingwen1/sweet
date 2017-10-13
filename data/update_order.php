<?php
@$orderInfo=$_REQUEST["orderInfo"];
@$allPrice=$_REQUEST["allPrice"];
@$orderTime=$_REQUEST["orderTime"];
@$uid=$_REQUEST["uid"];

require("init.php");
$sql="insert into swt_order(user_id,status,order_time,orderInfo,order_price) values
($uid,1,'$orderTime','$orderInfo',$allPrice)";
$result=mysqli_query($conn,$sql);

if($result){
    echo 1;
}else{
    echo "出错，没有执行成功";
    echo $orderInfo;
    echo $allPrice;
    echo $orderTime;
    echo $uid;
}


?>