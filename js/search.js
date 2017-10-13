function pFamily() {
    var xhr = getXhr();
    xhr.open("get", "data/product_family.php", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var resText = xhr.responseText;
            var resText = JSON.parse(resText);
            var fname = "";
            //console.log(resText.length);
            for (var i = 0; i < resText.length; i++) {
                fname += "<label class='checkbox'>";
                fname += "<input type='checkbox' name='fid' onclick='pSearch(1)' value='" + resText[i].fid + "'>";
                fname += "<i></i>";
                fname += resText[i].fname;
                fname += "</label>";
            }
            //console.log(fname);
            GI("fname").innerHTML = fname;
        }
    }
    xhr.send(null);
}


//获取产品种类ID 
function getFid() {
    var obj = document.getElementsByName("fid");
    //选择所有name="fid"的对象，返回数组 
    var fid = [];
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].checked) {
            fid[fid.length] = obj[i].value;
        }
    }
    fid = JSON.stringify(fid);
    console.log(fid);
    return fid;
}

//获取价格区间
function getPrice() {
    var str = document.getElementById("amount").value;
    var i = str.indexOf(" - ", i);
    //console.log(i);
    var pMin = str.slice(0, i);
    var pMax = str.slice(i + 3);
    //console.log(pMin,pMax);
    var price = [pMin, pMax];
    //console.log(price);
    price = JSON.stringify(price);
    return price;
}


//获取折扣区间
function getDiscount() {
    var obj = document.getElementsByName("discount");
    //console.log(obj[0].value);
    for (var i = 0; i < obj.length; i++) {
        //var off = [0, 1]; //打折区间
        if (obj[i].checked) {
            var flag = obj[i].value;
        }
    }
    var discount = [];
    if (flag == 0) { discount = [0.8, 0.9] }
    if (flag == 1) { discount = [0.6, 0.8] }
    if (flag == 2) { discount = [0.5, 0.6] }
    if (flag == 3) { discount = [0, 1] }
    discount = JSON.stringify(discount);
    return discount;
}

function pSearch(currentPage) {
    var xhr = getXhr();
    var fid = getFid();
    var price = getPrice();
    var discount = getDiscount();
    var kw = localStorage.kw;
    
    var url = "data/search_product.php?fid=" + fid + "&price=" + price + "&discount=" + discount + "&kw=" + kw + "&currentPage=" + currentPage;
    xhr.open("get", url, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // 对获取到的数据进行处理
            var resStr = JSON.parse(xhr.responseText);
            var html = "";
            for(var i =0;i<resStr.length-1;i++){
                html+="<div class='product-grid animated jackInTheBox'>";
                html+=    "<a href='single.html' onclick='upPid("+resStr[i].pid+")'>";
                html+=        "<div class='more-product'><span> </span></div>";
                html+=        "<div class='product-img b-link-stripe b-animate-go  thickbox'>";
                html+=            "<img src='"+resStr[i].pic+"' class='img-responsive' alt=''>";
                html+=            "<div class='b-wrapper'>";
                html+=                "<h4 class='b-animate b-from-left  b-delay03'>";
                html+=                    "<button>View</button>";
                html+=                "</h4>";
                html+=            "</div>";
                html+=        "</div>";
                html+=    "</a>";
                html+=    "<div class='product-info simpleCart_shelfItem'>";
                html+=        "<div class='product-info-cust prt_name'>";
                     var xingxing="——<span style='color:#55D2FF'>评分：";
                     for(var j=0;j<resStr[i].score;j++){
                         xingxing += "★";
                     }
                xingxing+="</span>";
                html+=            "<h4>"+resStr[i].pname+xingxing+"</h4>";
                html+=            "<span class='item_price'>折后价：￥"+(resStr[i].price*resStr[i].onsale).toFixed(2)+"</span>";
                html+=            "<div class='ofr'>";
                html+=                "<p class='pric1'><del>原价：￥"+resStr[i].price+"</del></p>";
                html+=                "<p class='disc'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+resStr[i].onsale*10+"折优惠</p>";
                html+=            "</div>";
                html+=            "<input type='text' class='item_quantity' value='1' id='quantity"+i+"' />";
                html+=            "<input type='button' class='item_add items' value='购买' onclick='addProductCart("+resStr[i].pid+","+i+")'>";
                html+=            "<div class='clearfix'> </div>";
                html+=        "</div>";
                html+=    "</div>";
                html+="</div>";
            }
            GI("product-show").innerHTML=html;

            $("#pageBox .prePage").attr('onclick',"pSearch("+resStr[resStr.length-1].prePage+")");
            $("#pageBox .nextPage").attr('onclick',"pSearch("+resStr[resStr.length-1].nextPage+")");
            $("#pageBox .lastPage").attr('onclick',"pSearch("+resStr[resStr.length-1].totalPage+")");
            $("#pageBox .curPage").html("第"+resStr[resStr.length-1].currentPage+"页");
            console.log(resStr[resStr.length-1].nextPage);
            var page = "";
            for(var k =1;k<=resStr[resStr.length-1].totalPage;k++){
               page+= "<button onclick='pSearch("+k+")'>"+k+"</button>";
            }
            $("#pageBox .pageNum").html(page);
            /*for (var i = 0; i < resStr.length; i++){
                $(".col-md-9>div:nth-child(" + (i + 1) + ") a").attr('onclick', "upPid(" + resStr[i].pid + ")");
                $(".col-md-9>div:nth-child(" + (i + 1) + ") img").attr('src', resStr[i].pic);
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .prt_name h4").html(resStr[i].pname);
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .item_price").html("折后价：￥" + resStr[i].price * resStr[i].onsale+"");

                var xingxing = "<span style='color:#55D2FF'>评分：";
                for (var j = 0; j < resStr[i].score; j++) { 
                    xingxing += "★";
                }
                xingxing += "</span>";
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .item_price").append(xingxing);

                $(".col-md-9>div:nth-child(" + (i + 1) + ") .pric1 del").html("原价：￥" + resStr[i].price);
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .disc").html(resStr[i].onsale * 10 + "折优惠");
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .item_add").attr('onclick',"addProductCart("+resStr[i].pid+")");
            }  */       
        }
    }
    xhr.send(null);
    localStorage.kw = "";    
}

function pSearchBad(currentPage) {
    var xhr = getXhr();
    var fid = getFid();
    var price = getPrice();
    var discount = getDiscount();
    var kw = localStorage.kw;
    
    var url = "data/search_product.php?fid=" + fid + "&price=" + price + "&discount=" + discount + "&kw=" + kw + "&currentPage=" + currentPage;
    xhr.open("get", url, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // 对获取到的数据进行处理
            var resStr = JSON.parse(xhr.responseText);
            for (var i = 0; i < resStr.length; i++){
                $(".col-md-9>div:nth-child(" + (i + 1) + ") a").attr('onclick', "upPid(" + resStr[i].pid + ")");
                $(".col-md-9>div:nth-child(" + (i + 1) + ") img").attr('src', resStr[i].pic);
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .prt_name h4").html(resStr[i].pname);
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .item_price").html("折后价：￥" + resStr[i].price * resStr[i].onsale+"");

                var xingxing = "<span style='color:#55D2FF'>评分：";
                for (var j = 0; j < resStr[i].score; j++) { 
                    xingxing += "★";
                }
                xingxing += "</span>";
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .item_price").append(xingxing);

                $(".col-md-9>div:nth-child(" + (i + 1) + ") .pric1 del").html("原价：￥" + resStr[i].price);
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .disc").html(resStr[i].onsale * 10 + "折优惠");
                $(".col-md-9>div:nth-child(" + (i + 1) + ") .item_add").attr('onclick',"addProductCart("+resStr[i].pid+")");
            }    
            localStorage.kw = "";
        }
    }
    xhr.send(null);
}