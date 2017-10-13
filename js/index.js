/** 
  * 仅仅是首页index需要的js代码。
  */

window.onload = function(){
    uidCheck();
    headerMain();
    productLogin();
}

function productLogin() { 
    // console.log("执行进function");
    var xhr = getXhr();
    xhr.open("get","data/body_product.php",true);
    xhr.onreadystatechange = function () { 
        if (xhr.readyState == 4 && xhr.status == 200) {
            // console.log("执行进if");
			var arr = JSON.parse(xhr.responseText);
           /*  $(".col-md-8 .img-responsive").attr('src', arr[0].md);
            $(".col-md-8 div.galy-info>p").html(arr[0].pname);
            $(".col-md-8 .item_price").append(arr[0].price);
            $(".col-md-4 .img-responsive").attr('src', arr[1].md);
            $(".col-md-4 div.galy-info>p").html(arr[1].pname);
            $(".col-md-4 .item_price").append(arr[1].price); */
            for (var i = 0; i < 11; i++){
                $(".gallery-grids div:nth-child(" + (i + 1) + ") .img-responsive").attr('src', arr[i].md);
                $(".gallery-grids div:nth-child(" + (i + 1) + ") div.galy-info>p").html(arr[i].pname);
                $(".gallery-grids div:nth-child(" + (i + 1) + ") .item_price").html("￥" + arr[i].price);
                $(".gallery-grids div:nth-child(" + (i + 1) + ") .gallery-info a").attr('onclick',"upPid("+arr[i].pid+")");
             }
         }
    }
    xhr.send(null);
}


