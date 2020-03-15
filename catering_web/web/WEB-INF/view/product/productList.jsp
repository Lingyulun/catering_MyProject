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
  <%--  <script src="https://cdn.staticfile.org/jquery/1.12.4/jquery.min.js"></script>
    <script src="/static/js/jquery.min.js"></script>
    <link href="/static/css/productshow/reset.css" rel="stylesheet" />
    <link href="/static/css/productshow/iconfont.css" rel="stylesheet" />
    <link href="/static/css/productshow/index.css" rel="stylesheet" />
--%>


    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>

  <%--  <script src="https://cdn.staticfile.org/jquery/1.12.4/jquery.min.js"></script>--%>
</head>
<body>
<%--<div class="RightBox">
    <div class="PublicContentBox">
        <!--公用指向页面名字-->
        <div class="PublicPointToAgeText">
            <span class="span1"></span> <span class="span2"></span>
        </div>
        <!--查询-->
        <div class="InquireBox clearfix">
            <div class="InquireleftBox">
                <form action="${pageContext.request.contextPath}/ProductOperation/productListAll2" class="form form-horizontal">
                    <div class="Text">产品名称：</div>
                    <div class="InputDiv">
                        <input class="phoneInput" placeholder="请输入你需要查询的产品名" name="pname" />
                    </div>
                    <div class="PublicBtnIcon Color1Btn fr">
                        <i class="iconfont icon-icon-chaxun"></i>
                        <input type="submit" value="查询">
                    </div>

                </form>
            </div>
        </div>
        <!--表修改-->
        <div class="InquireTableBox">
            <div class="headbox">
                <div class="headboxtext">
                    <span class="span1">后台管理产品列表</span>
                </div>
                <!--批量删除-->
                <div class="PublicBtnIcon Color5Btn">
                    <i class="iconfont  icon-shanchu"></i>
                    <span>批量删除</span>
                </div>

                <div class="PublicBtnIcon Color2Btn fr Js_edit">
                    <i class="iconfont icon-changyongtubiao-mianxing-"></i>
                    <span><a href="/ProductOperation/productAdd"> 添加</a></span>
                </div>
            </div>
            <!--查询到的表格-->
            <div class="InquireSelectTable">
                <table class="PublicTableCss">
                    <thead>
                    <tr>
                        <td>
                            <input id="inputcheck" class="inputcheck" type="checkbox" name="inputcheck" />
                            <label for="inputcheck"></label>
                            <span>全选</span>
                        </td>
                        <td>ID</td>
                        <td>名称</td>
                        <td>价格</td>
                        <td>类型</td>
                        <td>介绍</td>
                        <td>图片</td>
                        <td>数量</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${pageInfo.list}" var="product">
                            <tr>
                               <td>
                                   <input id="aa" class="inputcheck" type="checkbox" name="inputcheck" />
                                   <label for="aa"></label>
                               </td>
                               <td>${product.pid}</td>
                               <td>${product.pname}</td>
                               <td>${product.psalary}</td>
                               <td>${product.ptype}</td>
                               <td>${product.pdesc}</td>
                               <td><img src="${product.pimage}" width="150px" height="50px"/>
                               </td><td>${product.pcount}</td>
                               <td>
                                   <a href='#' class='edit btn btn-info'  id="typeId">编辑</a>
                                   <a href="${pageContext.request.contextPath}/ProductOperation/deleteProduct?pid=${product.pid}" class='delete btn btn-danger' >删除</a>
                               </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="PageNumber">
                <div class="NumbersBox">
                    <ul class="pagination">
                        <li><a href="/ProductOperation/productListAll2?pageNum=1"> 首页</a></li>
                        <li><a href="/ProductOperation/productListAll2?pageNum=${pageInfo.prePage}"> 上一页</a></li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="p">
                            <li><a href="/ProductOperation/productListAll2?pageNum=${p}"> ${p}</a></li>
                        </c:forEach>
                        <li><a href="/ProductOperation/productListAll2?pageNum=${pageInfo.nextPage}"> 下一页</a></li>
                        <li><a href="/ProductOperation/productListAll2?pageNum=${pageInfo.pages}"> 尾页</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>--%>




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
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${product.pid}</td>
                <td>${product.pname}</td>
                <td>${product.psalary}</td>
                <td>${product.ptype}</td>
                <td>${product.pdesc}</td>
                <td><img src="http://localhost:8070/images/Url/${product.pimage}" width="150px" height="50px"/>
                </td><td>${product.pcount}</td>
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
        </tbody>
    </table>
    <div class="page">
        <div class="pagination">
            <a class="num" href="/ProductOperation/productListAll2?pageNum=1">首页</a>
            <a class="prev" href="/ProductOperation/productListAll2?pageNum=${pageInfo.prePage}">&lt;&lt;</a>
            <c:forEach items="${pageInfo.navigatepageNums}" var="p">
                <li><a href="/ProductOperation/productListAll2?pageNum=${p}"> ${p}</a></li>
            </c:forEach>
            <a class="next" href="/ProductOperation/productListAll2?pageNum=${pageInfo.nextPage}">&gt;&gt;</a>
            <a class="num" href="/ProductOperation/productListAll2?pageNum=${pageInfo.pages}"> 尾页</a>
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
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>
</html>
