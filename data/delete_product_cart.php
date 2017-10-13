<?php
@$pid=$_REQUEST["pid"];
@$uid=$_REQUEST["uid"];

require("init.php");
if($pid!=-1){
    $sql="delete from swt_shoppingcart where user_id=$uid and product_id=$pid";
}else{
    $sql="delete from swt_shoppingcart where user_id=$uid";
}

$result=mysqli_query($conn,$sql);

/*if($result){
    echo "删除商品成功";
}else{
    echo "删除失败";
}*/


?>