<?php
/* 这个页面写的是根据提供的pid返回商品的所有信息 */
$pid = $_REQUEST["pid"];
require("init.php");
$sql = "select pid,pname,price,title,pic,onsale,fname,sm,md,lg,avg(score) as score from swt_product,swt_product_pic,swt_product_family,swt_comment where pid=$pid and swt_product.family_id=swt_product_family.fid and aid=$pid and swt_comment.product_id=$pid";

$result = mysqli_query($conn,$sql);
$arr = mysqli_fetch_all($result,1);
$arr = $arr[0];
echo json_encode($arr);


?>