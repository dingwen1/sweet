<?php
@$phone=$_REQUEST["phone"] or die('{"code":-1,"msg":"手机号是必须的"}');
@$upwd=$_REQUEST["upwd"] or die('{"code":-2,"msg":"密码是必须的"}');
@$addr=$_REQUEST["addr"];

require("init.php");
$sql="insert into swt_user values(null,'$upwd','$phone','$addr')";
$result=mysqli_query($conn,$sql);
$uid = mysqli_insert_id($conn);

if($result){
    echo $uid;

}


?>