<?php
@$phone=$_REQUEST["phone"];
@$upwd=$_REQUEST["upwd"];

require("init.php");
$sql="select * from swt_user where phone='$phone' and upwd='$upwd';";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);

if($row!=null){
     $uid = $row["uid"];
    echo "<script>
        localStorage.uid = $uid;
       window.location.href = '../index.html';
    </script>";
}else{
    echo "
        <script>
        window.alert('账号或者密码错误');
         window.location.href = '../index.html';
    </script>
    ";
}


?>