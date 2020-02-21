<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/19
  Time: 18:15
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
    <link href="/static/bootstrap/css/pintuer.css" type="text/css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/admin.css" type="text/css" rel="stylesheet"/>

    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <%--  <link href="/static/css/style.css" rel="stylesheet">--%>
    <link href="/static/css/bootstrapStyle/bootstrapStyle.css" rel="stylesheet">

</head>
<body>


<section id="main-content">
    <section class="wrapper">
        <table class="table table-striped table-advance table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>角色名称</th>
                <th>角色描述</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${role}" var="r">
                <tr>
                    <td>${r.id }</td>
                    <td>${r.name }</td>
                    <td>${r.description }</td>
                    <td>
                        <button class="btn btn-success bt-xs accredit" value="${r.id }" data-toggle="modal" >授权</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</section>


<%--弹出修改模块框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <div class="modal-body">
                <ul id="tree" class="ztree"></ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="submit">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<input type="hidden" id="userId" value="${user.id }">

<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/ztree/jquery.ztree.core.js"></script>
<script type="text/javascript" src="/static/js/ztree/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="/static/js/role/accredit.js"></script>
<script src="/static/js/common-scripts.js"></script>
<script type="text/javascript" src="/static/js/menu.js"></script>

</body>
</html>
