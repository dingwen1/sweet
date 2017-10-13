<?php
@$fid=$_REQUEST["fid"];
@$price=$_REQUEST["price"];
@$discount=$_REQUEST["discount"];
@$kw=$_REQUEST["kw"];



@$currentPage=$_REQUEST["currentPage"];  //分页查询参数 currentPage
if($currentPage==null){   //如果参数为空，设为默认值1
    $currentPage=1;
}
#var_dump($currentPage);

//将客户端传过来的json字符串转换成php数组
$fid=json_decode($fid,true);

$price=json_decode($price,true);
$discount=json_decode($discount,true);

require("init.php");
if(count($fid)==0){ //如果客户端没有选择产品类fid，默认显示所有fid
    $sql="select fid from swt_product_family";
    $result=mysqli_query($conn,$sql);
    $arr=mysqli_fetch_all($result,MYSQLI_ASSOC);
    foreach($arr as $k=>$v){
        $fid[]=$v["fid"];
    }
}

//如果客户端没有选取折扣区间，将其设为0~1
if(count($discount)==0){
    $discount=[0,1];
}


  
//拼写sql语句，查询条件筛选后的数据总数量
$sqlStr="select count(*) from swt_product where swt_product.family_id in (";
foreach($fid as $k=>$v){
    if($k!=(count($fid)-1)){  //(1,2,3)最后一个数字不需要","
        $sqlStr.=$v.",";
    }else{
        $sqlStr.=$v;
    }
}
$sqlStr.=") and (price>='$price[0]' and price<='$price[1]') and (onsale>'$discount[0]' and onsale<='$discount[1]') and (pname like '%$kw%' or title like '%$kw%')";

$result=mysqli_query($conn,$sqlStr);
#var_dump($result);
$row=mysqli_fetch_row($result);
$total=$row[0];
if($total%9==0){
    $totalPage=$total/9;  //9为每页显示的商品数
}else{
    $totalPage=ceil($total/9);  
}

$start=($currentPage-1)*9;

$sql="select pid,pname,price,onsale,pic from swt_product where swt_product.family_id in (";
foreach($fid as $k=>$v){
    if($k!=(count($fid)-1)){  //(1,2,3)最后一个数字不需要","
        $sql.=$v.",";
    }else{
        $sql.=$v;
    }
}
$sql.=") and (price>='$price[0]' and price<='$price[1]') and (onsale>'$discount[0]' and onsale<='$discount[1]') and (pname like '%$kw%' or title like '%$kw%') limit $start,9";

$result=mysqli_query($conn,$sql);
$array=mysqli_fetch_all($result,MYSQLI_ASSOC);
#var_dump($row);

//获取商品评分,并拼接到原数组
foreach($array as $k=>$v){
    $sql="select avg(score) from swt_comment where product_id=";
    $sql.=$v["pid"];
    //var_dump($sql);
    $result=mysqli_query($conn,$sql);
    $arr=mysqli_fetch_row($result);
    $v["score"]=$arr[0];
    $array[$k]=$v;
}
#var_dump($row);

/* $sql="select pname,price,onsale,pic,score from swt_product,swt_comment where swt_product.pid=swt_comment.product_id and swt_product.family_id in $fidAll and (price>'$price[0]' and price<'$price[1]') and (onsale>'$discount[0]' and onsale<'$discount[1]') and (pname like '$kw' or title like '$kw')"; */

//上一页prePage
$prePage=1;
if($currentPage>1){
    $prePage=$currentPage-1;
}

//下一页nextPage
$nextPage=$totalPage;
if($currentPage<$totalPage){
    $nextPage=$currentPage+1;
}
$array[]=["prePage"=>$prePage,"nextPage"=>$nextPage,"currentPage"=>$currentPage,"totalPage"=>$totalPage];

echo json_encode($array); 


?>