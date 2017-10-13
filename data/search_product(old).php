<?php
@$fid=$_REQUEST["fid"];
@$title=$_REQUEST["title"];
@$price=$_REQUEST["price"];
@$kw=$_REQUEST["kw"];

if($fid==null){
    $fid=1;
}
if($title=null){
    $title="";
}
if($price==null){
    $price=9999;
}
if($kw==null){
    $kw="";
}


require("init.php");
$sql="select pname,price,onsale from swt_product where family_id=$fid and
title like '%$title%' and price<'$price' and (pname like '%$kw%' or title like '%$kw%')";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,MYSQLI_ASSOC);
#var_dump($result);
#var_dump($row);

echo json_encode($row);


?>