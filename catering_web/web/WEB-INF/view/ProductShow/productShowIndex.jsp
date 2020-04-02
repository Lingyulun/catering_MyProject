<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/3/9
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>产品显示页面</title>
    <link rel="stylesheet" type="text/css" href="/static/before_product/css/style.css" />

    <script src="/static/before_product/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="section">
    <div class="container">
        <div class="mod-title">
            <h2><a href="${pageContext.request.contextPath}/beforeIndexView">返回产品主界面</a></h2>
        </div>
        <div class="case-list">
            <ul>
                <c:forEach items="${pvo.products}" var="products">
                     <form method="post" action="${pageContext.request.contextPath}/viewCart/addToCart">
                            <li>
                                <div class="case-show">
                                    <div class="show-text">
                                        <input type="hidden" name="pid" value="${products.pid}" />
                                        <div class="case-logo"><h1 style="color: #0b0b0b">${products.pname}</h1></div>
                                        <div class="case-intro"><h1>单价：${products.psalary}</h1></div>
                                        <input type="hidden" id="ptype" value="${products.ptype}">
                                        <input type="submit" value="添加到购物车" class="btn btn-primary" />
                                    </div>
                                    <div class="show-qrcode">
                                        <ul>
                                            <li>
                                                <div class="img"><img src="${pageContext.request.contextPath}/static/before_product/images/1_app.png"></div>
                                                <div class="intro">扫码查看APP</div>
                                                <div class="tips">（定位在麦市街）</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="case-demo">
                                        <p class="fl">查看演示：</p>
                                        <p class="fr"><i class="phone"></i></p>
                                    </div>
                                </div>
                                <div class="case-show-img">
                                    <div class="case-type">
                                        <p class="fl">案例类型：</p>
                                        <p class="fr"><i class="ios"></i><i class="android"></i></p>
                                    </div>
                                    <div class=""><img src="${products.pimage}" width="240px" height="150px"></div>
                                    <div class="case-logo"><img src="/static/before_product/images/logo_1.png"></div>
                                </div>
                        </li>
                </form>
                </c:forEach>
                <a id="first" href=""> 首页</a>
                <a id="prev" href="">上一页</a>
                <a id="next" href="">下一页</a>
                <a id="end" href="">尾页</a>
            </ul>
        </div>
    </div>
</div>


<script>
    $(function () {
       /* alert($("#ptype").val());*/
        var s="/beforeInfo?ptype="+$("#ptype").val();
        $("#first").attr('href',s+"&pageNum=${pco.prePage}");
        $("#prev").attr('href',s+"&pageNum=${pco.prePage}");
        $("#next").attr('href',s+"&pageNum=${pco.nextPage}");
        $("#end").attr('href',s+"&pageNum=${pco.pages}");
    });

</script>

<script type="text/javascript">
    //鼠标悬浮显示介绍
    $(".case-list li").hover(function() {
        $(this).find('.case-show-img').hide();
        $(this).find('.case-show').stop().fadeIn();
    }, function() {
        $(".case-list li .case-show").hide();
        $(this).find('.case-show-img').stop().fadeIn();
    });
    //鼠标悬浮微信，手机，小程序图标展示相应二维码
    $(".case-list .case-demo i").hover(function() {
        var i = $(this);
        var parent = i.parent();
        var case_show = parent.parent().parent();
        var text = case_show.find('.show-text');
        var qrcode = case_show.find('.show-qrcode');
        var ul = case_show.find('.show-qrcode ul');

        var index = parent.children("i").index(i);
        i.addClass('active');
        text.hide();
        qrcode.show();
        ul.children('li').hide()
        ul.children('li').eq(index).fadeIn();
    }, function() {
        $('.case-demo i').removeClass('active');
        $('.show-qrcode li').hide();
        $('.show-qrcode').hide();
        $('.show-text').show();
    });
</script>
<script>
    $(function () {
        $("#btnFirst").click(function () {
            var firstdzi='http://localhost:8070/beforeInfo?ptype='+$("#ptype").val()+'pageNum='+1
            $("#first").attr('href',firstdzi);
            $("#first").click();
        })
    })
</script>
</body>
</html>
