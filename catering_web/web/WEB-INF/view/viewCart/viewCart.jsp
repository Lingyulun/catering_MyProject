<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" language="java" contentType="text/html; UTF-8" %>
<html>
<head>
    <title>商品信息</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <p>
               <%String ref = request.getHeader("REFERER");%>
                <a href="<%=ref %>">继续购物</a>
            </p>
            <form method="post">
                <button value="删除"  id="batchDelete" class="btn btn-primary btn-danger">删除</button>
            </form>
            <table class="table table-hover table-bordered" id="mytable">
                <thead>
                <tr>
                    <th><input type="checkbox" id="batchDeleteChecked"></th>
                    <th>编号</th>
                    <th>图片</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart.items}" var="item">
                    <form method="post" id="form1" action="/viewCart/removeFromCart">
                        <input type="hidden" name="pid" id="pid" value="${item.p.pid}"/>
                        <tr>
                            <td><input type="checkbox" ></td>
                            <td class="xuhao">${item.p.pid}</td>
                            <td><img src="${item.p.pimage}" width="150px" height="100px"></td>
                            <td class="foodsprice">${item.p.psalary}</td>
                            <td>
                                <button type="button" class="add">+</button>
                                <input type="number" class="num" value="${item.qty}"/>
                                <button type="button" class="minus">-</button>
                            </td>
                            <td class="smallprice">${item.subTotal}</td>
                            <td><input type="submit" value="删除" class="btn btn-primary btn-danger"></td>
                        </tr>
                    </form>
                </c:forEach>
                <tr><td>总计:</td><td colspan="5" class="totalprice" style="align-content: right">${cart.total}</td></tr>
                </tbody>


            </table>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#batchDeleteChecked").click(function () {
            $("tbody :checkbox").prop("checked", $(this).prop("checked"));
        });

        //批量删除
        $("#batchDelete").click(function () {

            var url= "/removefromcart?";
            $("tbody :checkbox").each(function (index,ele) {
                if($(ele).prop("checked")){
                    url += ("pid=" + $(ele).closest("tr").find("td:eq(1)").text());
                    url += "&";
                }
            });
            url = url.substring(0, url.length - 1);

            var $form = $(this).parent();
            $form.prop("action", url);
            alert($form.prop("action"));
            $form[0].submit();

        });


        $(".add").click(function(){			//产品数量添加，则对应的商品总价格上升
            var num = $(this).siblings("input");
            num.val(parseInt(num.val())+1);//对应商品数量+1
            var goods_price =parseInt($(this).parent().siblings(".foodsprice").text());//得到对应商品价格
            var smallprice=parseInt($(this).parent().siblings(".smallprice").text());//得到对应的商品小计
            $(this).parent().siblings(".smallprice").text(smallprice+goods_price);
            var n = parseInt($(".totalprice").text()); //得到商品总价
            $(".totalprice").text(goods_price+n);     	 //数量+1时得到商品总计加上对应商品数量的价格
        });
        $(".minus").click(function(){			//产品数量添加，则对应的商品总价格上升
            var num = $(this).siblings("input");
            num.val(parseInt(num.val())-1);//对应商品数量-1
            if(num.val()<=0){	//当商品数量为0时不能继续再减少数量
                $(this).siblings("input").val(0);	//数量框为0
                $(this).parent().siblings(".smallprice").text(0);//商品小计为0;
            }else{
                var goodsprice =parseInt($(this).parent().siblings(".foodsprice").text());//得到对应商品价格
                var smallprice=parseInt($(this).parent().siblings(".smallprice").text());  //得到对应的商品小计
                $(this).parent().siblings(".smallprice").text(smallprice-goodsprice);	//得到
                var n = parseInt($(".totalprice").text());
                $(".totalprice").text(n-goodsprice);
            }

        });
    })
</script>
</body>
</html>
