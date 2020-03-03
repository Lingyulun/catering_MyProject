<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/3/1
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员列表</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
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
        <form class="layui-form layui-col-md12 x-so" action="/managers/listAllmName">
            <input type="text" name="mName"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn" type="submit"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>

        <button class="layui-btn" onclick="x_admin_show('添加用户','/managers/addView')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>姓名</th>
            <th>手机</th>
            <th>登录名</th>
            <th>角色</th>
            <th>操作</th>
        </thead>
        <tbody>
            <c:forEach items="${managers.list}" var="managers">
                <tr>
                   <td>
                       <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${managers.MId}'><i class="layui-icon">&#xe605;</i></div>
                   </td>
                    <td>${managers.MId}</td>
                    <td>${managers.MName}</td>
                    <td>${managers.MPhone}</td>
                    <td>${managers.MUsername}</td>
                    <td>${managers.name}</td>
                    <td class="td-manage">
                        <a title="编辑"  onclick="x_admin_show('编辑','admin-edit.html')" href="javascript:;">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" onclick="member_del(this,'${managers.MId}')" href="javascript:;">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div class="pagination">
            <a class="num" href="/managers/listAll?pageNum=1">首页</a>
            <a class="prev" href="">&lt;&lt;</a>
            <c:forEach items="${managers.navigatepageNums}" var="p">
                <a class="num" href="/managers/listAll?pageNum=${p}"> ${p}</a>
            </c:forEach>
            <a href="/managers/listAll?pageNum=${managers.nextPage}">&gt;&gt;</a></li>
            <a class="num" href="/managers/listAll?pageNum=${managers.pages}">尾页</a>
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
            window.location.href="/managers/delete?MId="+id
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    function delAll (argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                url : "/managers/delBatchesManager",
                data : {
                    "sids" : data
                },
                dataType : "json",
                async : false
            });
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }

</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</body>
</html>
