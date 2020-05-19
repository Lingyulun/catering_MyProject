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
    <title>客户信息</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
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
        <c:forEach items="${pageUserInfoAll.list}" var="client">
            <tr>
                <td>${client.uid}</td>
                <td>${client.username}</td>
                <td>${client.ubirthday}</td>
                <td>${client.uage}</td>
                <td>${client.uphone}</td>
                <td>${client.uaddress}</td>
                <td>${client.usex}</td>
                <td>
                    <a title="编辑"  onclick="x_admin_show('编辑','/client/getById?uid=${client.uid}')" href="javascript:;">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${client.uid}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div class="pagination">
            <a class="num" href="/client/clientInfoAll?pageNum=1"> 首页</a>
            <a class="prev" href="/client/clientInfoAll?pageNum=${pageUserInfoAll.prePage}">&lt;&lt;</a>
            <c:forEach items="${pageUserInfoAll.navigatepageNums}" var="p">
                <li><a href="/client/clientInfoAll?pageNum=${p}"> ${p}</a></li>
            </c:forEach>
            <a class="next" href="/client/clientInfoAll?pageNum=${pageUserInfoAll.nextPage}"> &gt;&gt;</a>
            <a href="/client/clientInfoAll?pageNum=${pageUserInfoAll.pages}"> 尾页</a>
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
            document.location="/client/delete?uid="+id
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }

</script>
</body>
</html>
