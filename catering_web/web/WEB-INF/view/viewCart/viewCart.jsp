<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" language="java" contentType="text/html; UTF-8" %>
<html>
<head>
    <title>商品信息</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
    <script src="/static/bootstrap/js/bootstrap.js"></script>
   <%-- <script src="/static/js/jquery-3.3.1.min.js"></script>--%>
    <script src="/static/js/jquery-1.2.4.min.js"></script>
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>

</head>
<body>
<div class="container">
<%--<div class="x-body">--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <p>
               <%--<%String ref = request.getHeader("REFERER");%>--%>
                <a href="${pageContext.request.contextPath}/productShowInfo">继续购物</a>

            </p>
            <form method="post">
                <button value="删除"  id="batchDelete" class="btn btn-primary btn-danger">删除</button>
            </form>
            <table class="table table-hover table-bordered" id="mytable">
               <%--<table class="layui-table" id="mytable">--%>
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
                <form method="post" id="form1" action="${pageContext.request.contextPath}/viewCart/removeFromCart">
                <c:forEach items="${cart.items}" var="item">
                            <input type="hidden" name="pid" id="pid" value="${item.p.pid}"/>
                            <%--<tr>
                               <td><input type="checkbox" ></td>
                                <td class="xuhao">${item.p.pid}</td>
                                <td><img src="${item.p.pimage}" width="150px" height="100px"></td>
                                <td class="foodsPrice">${item.p.psalary}</td>
                                <td>
                                    <button type="button" class="add">+</button>
                                    <input type="number" class="num" value="${item.qty}"/>
                                    <button type="button" class="minus">-</button>
                                </td>
                                <td class="smallPrice">${item.subTotal}</td>
                                <td class="td-manage">
                                    &lt;%&ndash;<a title="删除" onclick="deleteCart(this,'/viewCart/delete?id=${item.p.pid}')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>&ndash;%&gt;
                                    <a href="${pageContext.request.contextPath}/viewCart/delete?id=${item.p.pid}">  <i class="layui-icon">&#xe640;</i></a>
                                </td>
                            </tr>--%>

                            <tr>

                                <td><input type="checkbox" ></td>
                                <td class="xuhao">${item.p.pid}</td>
                                <td><img src="${item.p.pimage}" width="150px" height="100px"></td>
                                <td>
                                    <li>
                                        <input type="button" value="-" />
                                        <strong>${item.qty}</strong>
                                        <input type="button" value="+" />
                                        单价：<em>${item.p.psalary}元</em>
                                        小计：<span>${item.subTotal}元</span>
                                    </li>
                                </td>
                            </tr>

                    </c:forEach>
                    <tr>
                        商品合计共：<span>0</span>件，共花费了：<span>0</span>元<br />
                        <td> <input type="submit" value="购买" class="btn btn-primary btn-danger"></td>
                        <%--<td colspan="6">总计:<input type="text" class="totalPrice" value="${cart.total}"/></td>
                    --%>
                    </tr>
                </form>

                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function deleteCart(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }

    $(function () {
        $("#batchDeleteChecked").click(function () {
            $("tbody :checkbox").prop("checked", $(this).prop("checked"));
        });

        //批量删除
        $("#batchDelete").click(function () {
            var url= "/viewCart/addToCart?";
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


        var aLi = document.getElementsByTagName("li");
        var aStrong = document.getElementsByTagName("strong");
        var aEm = document.getElementsByTagName("em");
        var oP = document.getElementsByTagName("p")[0];
        var aSpan = oP.getElementsByTagName("span");
        var number = 0;
        var price = 0;
        for(var i=0;i<aLi.length;i++){
            Price(aLi[i]);
        }
        function Price(obj){
            var aIn = obj.getElementsByTagName("input");
            var oStrong = obj.getElementsByTagName("strong")[0];
            var oEm = obj.getElementsByTagName("em")[0];
            var oSpan = obj.getElementsByTagName("span")[0];
            aIn[0].onclick = function(){
                if(oStrong.innerHTML>0){
                    number--;
                    oStrong.innerHTML--;
                    price -= parseFloat(oEm.innerHTML);
                    oSpan.innerHTML = parseFloat(oEm.innerHTML)*oStrong.innerHTML + "元";
                    aSpan[0].innerHTML = number;
                    aSpan[1].innerHTML = price;
                    aSpan[2].innerHTML = getMax();
                }
            }
            aIn[1].onclick = function(){
                number++;
                oStrong.innerHTML++;
                price += parseFloat(oEm.innerHTML);
                oSpan.innerHTML = parseFloat(oEm.innerHTML)*oStrong.innerHTML + "元";
                aSpan[0].innerHTML = number;
                aSpan[1].innerHTML = price;
                aSpan[2].innerHTML = getMax();
            }
        }
        function getMax(){
            var arr = [];
            for(var i=0;i<aStrong.length;i++){
                if(aStrong[i].innerHTML!=0){
                    arr.push(parseFloat(aEm[i].innerHTML));
                }
            }
            return aStrong == 0 ? 0 : arr.sort(function(a,b){return b-a})[0];
        }

    })
</script>
</body>
</html>
