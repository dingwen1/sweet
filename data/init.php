<?php
#连接数据库sweet并初始化字符集
$conn=mysqli_connect("127.0.0.1","root","","sweet",3306);
$sql="set names utf8";
mysqli_query($conn,$sql);

?>