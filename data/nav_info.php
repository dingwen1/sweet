<?php
require("init.php");
$sql = "select * from swt_product_family";
$result = mysqli_query($conn,$sql);
$rowfamily = mysqli_fetch_all($result,1);

foreach($rowfamily as $key=>$value){
    $sql="select pid,pname from swt_product where family_id=".($key+1);
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_all($result,MYSQLI_ASSOC);

    foreach($row as $k=>$v){
    $arr[$value['fname']][$v['pid']] = $v['pname'];
    }
}

echo json_encode($arr);

?>