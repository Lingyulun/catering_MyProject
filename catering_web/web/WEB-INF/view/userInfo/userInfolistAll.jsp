<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/11
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
   <%-- <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
--%>
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>
</head>
<body>

<%--<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 用户信息</strong></div>
    <div class="body-content">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-10 column" id="content">
                    <table id="table" class="table table-bordered table-hover">
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>出生日期</th>
                            <th>年龄</th>
                            <th>电话号码</th>
                            <th>地址</th>
                            <th>性别</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pageUserInfoAll.list}" var="userInfo">
                            <tr>
                                <td>${userInfo.uid}</td>
                                <td>${userInfo.username}</td>
                                <td>${userInfo.ubirthday}</td>
                                <td>${userInfo.uage}</td>
                                <td>${userInfo.uphone}</td>
                                <td>${userInfo.uaddress}</td>
                                <td>${userInfo.usex}</td>
                                <td>
                                    <a href="/user/getById?uid=${userInfo.uid}" class='edit btn btn-info' id="typeId">编辑</a>
                                    <a href='#' class='delete btn btn-danger' onclick="confirmDel(${userInfo.uid})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7">
                                <button class="btn btn-info add"><a href="/user/insertView">新增</a></button>
                                <ul class="pagination">
                                    <li><a href="/user/userInfoAll?pageNum=1"> 首页</a></li>
                                    <li><a href="/user/userInfoAll?pageNum=${pageUserInfoAll.prePage}"> 上一页</a></li>
                                    <c:forEach items="${pageUserInfoAll.navigatepageNums}" var="p">
                                        <li><a href="/user/userInfoAll?pageNum=${p}"> ${p}</a></li>
                                    </c:forEach>
                                    <li><a href="/user/userInfoAll?pageNum=${pageUserInfoAll.nextPage}"> 下一页</a></li>
                                    <li><a href="/user/userInfoAll?pageNum=${pageUserInfoAll.pages}"> 尾页</a></li>
                                </ul>
                            </td>
                        </tr>
                    </table>
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
<xblock>
    <button class="layui-btn" onclick="x_admin_show('添加用户','/user/insertView')"><i class="layui-icon"></i>添加</button>
    <span class="x-right" style="line-height:40px">共有数据：88 条</span>
</xblock>
<div class="x-body">
    <table class="layui-table">
        <thead>
        <tr>
            <th>编号</th>
            <th>姓名</th>
            <th>出生日期</th>
            <th>年龄</th>
            <th>电话号码</th>
            <th>地址</th>
            <th>性别</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pageUserInfoAll.list}" var="userInfo">
            <tr>
                <td>${userInfo.uid}</td>
                <td>${userInfo.username}</td>
                <td>${userInfo.ubirthday}</td>
                <td>${userInfo.uage}</td>
                <td>${userInfo.uphone}</td>
                <td>${userInfo.uaddress}</td>
                <td>${userInfo.usex}</td>
                <td>
                    <a title="编辑"  onclick="x_admin_show('编辑','/user/getById?uid=${userInfo.uid}')" href="javascript:;">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${userInfo.uid}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div class="pagination">
            <a class="num" href="/user/userInfoAll?pageNum=1"> 首页</a>
            <a class="prev" href="/user/userInfoAll?pageNum=${pageUserInfoAll.prePage}">&lt;&lt;</a>
            <c:forEach items="${pageUserInfoAll.navigatepageNums}" var="p">
                <li><a href="/user/userInfoAll?pageNum=${p}"> ${p}</a></li>
            </c:forEach>
            <a class="next" href="/user/userInfoAll?pageNum=${pageUserInfoAll.nextPage}"> &gt;&gt;</a>
            <a href="/user/userInfoAll?pageNum=${pageUserInfoAll.pages}"> 尾页</a>
        </div>
       <%-- <ul class="pagination">
            <li><a href="/user/userInfoAll?pageNum=1"> 首页</a></li>
            <li><a href="/user/userInfoAll?pageNum=${pageUserInfoAll.prePage}"> 上一页</a></li>
            <c:forEach items="${pageUserInfoAll.navigatepageNums}" var="p">
                <li><a href="/user/userInfoAll?pageNum=${p}"> ${p}</a></li>
            </c:forEach>
            <li><a href="/user/userInfoAll?pageNum=${pageUserInfoAll.nextPage}"> 下一页</a></li>
            <li><a href="/user/userInfoAll?pageNum=${pageUserInfoAll.pages}"> 尾页</a></li>
        </ul>--%>
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
            document.location="/user/delete?uid="+id
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }

</script>
<%--<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>--%>



<%--<script>
    function confirmDel(param){
        if(window.confirm("您确定要删除吗？")){
            document.location="/user/delete?uid="+param
        }
    }
</script>--%>



</body>
</html>
