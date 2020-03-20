<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/9
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>产品信息</title>


    <script src="/static/js/jquery-1.2.4.min.js"></script>
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>

</head>
<body>


<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/ProductOperation/productListAll2">
            <input type="text" name="pname"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn" type="submit"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','/ProductOperation/productAdd')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>

    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>名称</th>
            <th>价格</th>
            <th>类型</th>
            <th>介绍</th>
            <th>图片</th>
            <th>数量</th>
            <th>操作</th>
        </thead>
        <tbody>

        <c:forEach items="${pageInfo.list}" var="product">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${product.pid}'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${product.pid}</td>
                <td>${product.pname}</td>
                <td>${product.psalary}</td>
                <td>${product.ptype}</td>
                <td>${product.pdesc}</td>
                <td><img src="${product.pimage}" alt="" width="200px" height="80px" class="pimages"/></td>
                <td>${product.pcount}</td>
                <td class="td-manage">
                    <a title="编辑"  onclick="x_admin_show('编辑','/ProductOperation/getUpdateProductPid?pid=${product.pid}')" href="javascript:;">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${product.pid}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        <div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2000;width:100%;height:100%;display:none;">
            <!-- 放大后的图片 -->
            <div id="innerdiv" style="position:absolute;z-index: 2000">
                <img id="bigimg" style="border:5px solid #fff;" src="" />
            </div>
        </div>
        </tbody>
    </table>
    <div class="page">
        <div class="pagination">
            <a class="num" href="/ProductOperation/productListAll?pageNum=1">首页</a>
            <a class="prev" href="/ProductOperation/productListAll?pageNum=${pageInfo.prePage}">&lt;&lt;</a>
            <c:forEach items="${pageInfo.navigatepageNums}" var="p">
                <li><a href="/ProductOperation/productListAll?pageNum=${p}"> ${p}</a></li>
            </c:forEach>
            <a class="next" href="/ProductOperation/productListAll?pageNum=${pageInfo.nextPage}">&gt;&gt;</a>
            <a class="num" href="/ProductOperation/productListAll?pageNum=${pageInfo.pages}"> 尾页</a>
        </div>
    </div>
</div>


<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });


    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            window.location.href="/ProductOperation/deleteProduct?pid="+id;
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    function delAll (argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                url : "/ProductOperation/delBatchesProduct",
                data : {
                    "pids" : data
                },
                dataType : "json",
                async : false
            });
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }



    // 图片点击事件
    $(".pimages").click(function () {
        enlarge(this);
    })
    // 图片放大函数
    function enlarge(obj) {
        var _this = $(obj);
        imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
        function imgShow(outerdiv, innerdiv, bigimg, _this) {
            var src = _this.attr("src"); //获取当前点击的pimg元素中的src属性
            $(bigimg).attr("src", src); //设置#bigimg元素的src属性
            /*获取当前点击图片的真实大小，并显示弹出层及大图*/
            $("<img/>").attr("src", src).load(function () {
                var windowW = $(window).width(); //获取当前窗口宽度
                var windowH = $(window).height(); //获取当前窗口高度
                var realWidth = this.width; //获取图片真实宽度
                var realHeight = this.height; //获取图片真实高度
                var imgWidth, imgHeight;
                var scale = 0.8; //缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
                if (realHeight > windowH * scale) { //判断图片高度
                    imgHeight = windowH * scale; //如大于窗口高度，图片高度进行缩放
                    imgWidth = imgHeight / realHeight * realWidth; //等比例缩放宽度
                    if (imgWidth > windowW * scale) { //如宽度扔大于窗口宽度
                        imgWidth = windowW * scale; //再对宽度进行缩放
                    }
                } else if (realWidth > windowW * scale) { //如图片高度合适，判断图片宽度
                    imgWidth = windowW * scale; //如大于窗口宽度，图片宽度进行缩放
                    imgHeight = imgWidth / realWidth * realHeight; //等比例缩放高度
                } else { //如果图片真实高度和宽度都符合要求，高宽不变
                    imgWidth = realWidth;
                    imgHeight = realHeight;
                }
                $(bigimg).css("width", imgWidth); //以最终的宽度对图片缩放
                var w = (windowW - imgWidth) / 2; //计算图片与窗口左边距
                var h = (windowH - imgHeight) / 2; //计算图片与窗口上边距
                $(innerdiv).css({
                    "top": h,
                    "left": w
                }); //设置#innerdiv的top和left属性
                $(outerdiv).fadeIn("fast"); //淡入显示#outerdiv及.pimg
            });
            $(outerdiv).click(function () { //再次点击淡出消失弹出层
                $(this).fadeOut("fast");
            });
        }
    }
</script>

</body>
</html>
