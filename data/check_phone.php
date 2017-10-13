<?php
$phone=$_REQUEST["phone"];

require("init.php");
$sql="select * from swt_user where phone='$phone'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);

if($row==null){
    echo "用户名不正确";
}else{
    echo "可以登录";
}


?>