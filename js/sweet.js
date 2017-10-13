/* 不懂问丁稳
 */

function GI(id) {
    return document.getElementById(id);
}
function getXhr() {
    var xhr;
     if(window.XMLHttpRequest){
          xhr = new XMLHttpRequest();
     }else{
           xhr = new ActiveXObject("Microsoft.XMLHttp"); 
      }
     return xhr;
}

/* window.onload = function(){
    uidCheck();//检查用户id是否存在
    headerMain();
} */

//登录按钮按下进行的登录验证操作
/* function login() {
    var xhr = getXhr();
    var phone = GI("phone").value;
    var upwd = GI("upwd").value;
    xhr.open("post","data/login.php",true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var uid = Number(xhr.responseText);
            if (uid) {
                console.log("执行到这里");
                localStorage.uid = uid;
                //刷新当前页面
                //window.location.href =window.location;
            } else{ 
                GI("upwd").value = "用户名或者账号错误";
            }
        }
    }
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send("phone="+phone+"&upwd="+upwd);
} */

//页面加载时，决定显示还是不显示登录框+如果已经登录，在导航栏显示该用户购物车总价，没有登录显示提示。
function uidCheck() {
    var uid = localStorage.uid;
    if (uid) {
        GI("loginBox").innerHTML = "<div class='welcome'>欢迎回来，客官<br><a href='javascript:loginOut()'>登出</a></div>";
        // GI("loginBox").innerHTML += ""
        var xhr = getXhr();
        xhr.open("get", "data/show_price.php?uid="+uid, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var result = JSON.parse(xhr.responseText);
                GI("simpleCart_total").innerHTML = "￥"+result[0];
                GI("simpleCart_quantity").innerHTML = result[1];
            }
        }
       
        xhr.send(null);
    } else { 
        GI("nav-cart-box").innerHTML = "<p class='simpleCart_empty'>你还没有登录哟！</p>";
    }
}

//这里的方法是登录框中的异步提醒
 function checkPhone(){
    var phone = GI("phone").value;
    if (phone == "") {
        GI("phone").value = "号码一定要写哟！";
        return;
    }
    var xhr = getXhr();
    xhr.open("get", "data/check_phone.php?phone=" + phone, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var res = xhr.responseText;
            GI("login").value = res;
        }
    }
    xhr.send(null);
}

//登出
function loginOut() { 
    localStorage.uid = "";
    window.location.href = window.location;   
}

//导航菜单栏  first 很棒
function headerMain() {
    var xhr = getXhr();
    xhr.open("get","data/nav_info.php",true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var arrObj = JSON.parse(xhr.responseText);
            console.log(arrObj);
            var html = "";
            for (var i in arrObj) {
                html += "<div class='col-sm-3'><h4>"+i+"</h4><ul class='multi-column-dropdown'>";
                for (var j in arrObj[i]) {
                    html += "<li class='  animated  '><a class='list' href='single.html' onclick='upPid("+j+")'>"+arrObj[i][j]+"</a></li>";
                }
                html += "</ul></div>";
            }
            GI("navShowOne").innerHTML = html;
            GI("navShowTwo").innerHTML = html;
            GI("navShowThree").innerHTML = html;
         }
    }
    xhr.send(null);
}

//将搜索框中的kw提交至缓存
function uploadKw() {
    var kw = GI("upload-kw").value;
    localStorage.kw = kw;
    window.location.href = "products.html";
}

//这是首页删除个人所有购物车所调用的方法。建议不使用。
 function deleteCart(pid) { 
    var uid = localStorage.uid;
    var xhr = getXhr();
    xhr.open("post", "data/delete_product_cart.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("uid=" + uid+"&pid="+pid);
    uidCheck(); 
} 

//购物车页面删除单行购物所需要调用的方法
function deleteCartRow(pid){
    deleteCart(pid);
    shoppingcartLoad();
}

//上传pid至缓存
function upPid(pid) { 
    localStorage.pid = pid;
}

// 添加至购物车事件
function addProductCart(pid,i) {
    var count = GI("quantity"+i).value;
    var uid = localStorage.uid;
    if (!uid) {
        window.alert("你还没有登录！");
        return;
     }
    var xhr = getXhr();
    xhr.open("post","data/add_product_cart.php",true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState==4 && xhr.status==200){ 
            console.log("执行了添加商品的回调");
        }
    }
     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
     xhr.send("uid=" + uid + "&pid=" + pid + "&count=" + count);
     uidCheck();
}

//获取当前时间
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}

//上传订单信息
function upOrderInfo(orderInfo, allPrice) { 
    console.log("已触发事件");
    console.log(orderInfo);
    var orderTime = getNowFormatDate();
    var uid = localStorage.uid;
    var xhr = getXhr();
    xhr.open("post","data/update_order.php",true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            if (xhr.responseText == 1) {
                setTimeout("deleteCart(-1)", 1000);
                deleteCart(-1);
                window.location.href = "order.html";
            }    
        }
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("orderInfo=" + orderInfo + "&allPrice=" + allPrice + "&orderTime=" + orderTime + "&uid=" + uid);
}

//order.html 页面生成内容
function loadOrder() { 
    var uid = localStorage.uid;
    var xhr = getXhr();
    xhr.open("get","data/order_info.php?uid="+uid,true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var orderInfo = JSON.parse(xhr.responseText);
            //开始处理数据
            var stajujuju = ["未付款","已付款","发货中","已到手"]
            var infoAll = "";
            for (var i = 0; i < orderInfo.length; i++){
                
            infoAll+=    "<div class='orderbox'>";
			infoAll+=        "<div class='orderInfo'>";
			infoAll+=        	"<div class='info'>";
			infoAll+=        		"<span class='info-name'>订单详情：</span>";
			infoAll+=        		"<span class='info-msg'>"+orderInfo[i].orderInfo+"</span>";
			infoAll+=        	"</div>";
            infoAll +=           "<div class='order-statu'>";
                
			infoAll+=        		"<span class='os-s'>订单状态：<span>"+stajujuju[orderInfo[i].status]+"</span></span>";
			infoAll+=        		"<span class='all-price'>总价钱：$<span>"+orderInfo[i].order_price+"元</span></span>";
			infoAll+=        		"<span class='order-time'>下单时间：<span>"+orderInfo[i].order_time+"</span></span>";
			infoAll+=        	"</div>";
			infoAll+=        "</div>";
		    infoAll+=    "</div>	";

            }
            GI("orderInfos").innerHTML = infoAll;
        }
    }
    xhr.send();
}