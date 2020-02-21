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
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>


<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 用户信息</strong></div>
    <div class="body-content">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-10 column" id="content">
                    <table id="table" class="table table-bordered table-hover">
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
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
</div>
<script>
    function confirmDel(param){
        if(window.confirm("您确定要删除吗？")){
            document.location="/user/delete?uid="+param
        }
    }
</script>



</body>
</html>
