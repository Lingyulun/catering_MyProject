<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/1/30
  Time: 11:22
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
                            <th>角色名称</th>
                            <th>角色描述</th>
                        </tr>
                        <c:forEach items="${userRoleVos}" var="userInfo">
                            <tr>
                                <td>${userInfo.id}</td>
                                <td>${userInfo.username}</td>
                                <td>${userInfo.roleEntityList.list.description}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <button class="btn btn-info add" id="add">新增</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
