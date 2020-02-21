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
    <title>Title</title>
    <script src="https://cdn.staticfile.org/jquery/1.12.4/jquery.min.js"></script>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class="text-c">
    <form action="${pageContext.request.contextPath}/ProductOperation/productListAll2" class="form form-horizontal">
        <input type="text" class="input-text" style="width:250px" placeholder="请输入"  name="pname">&nbsp;
        <input type="submit" class="btn btn-success Hui-iconfont radius" name="" value="&#xe665;搜产品">
    </form>
</div>
<table class="table">
    <tr>
        <th>编号</th>
        <th>名称</th>
        <th>价格</th>
        <th>类型</th>
        <th>介绍</th>
        <th>图片</th>
        <th>数量</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${pageInfo.list}" var="product">
        <tr>
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
</table>


<ul class="pagination">
    <li><a href="/ProductOperation/productAdd"> 添加</a></li>
    <li><a href="/ProductOperation/productListAll2?pageNum=1"> 首页</a></li>
    <li><a href="/ProductOperation/productListAll2?pageNum=${pageInfo.prePage}"> 上一页</a></li>
    <c:forEach items="${pageInfo.navigatepageNums}" var="p">
        <li><a href="/ProductOperation/productListAll2?pageNum=${p}"> ${p}</a></li>
    </c:forEach>
    <li><a href="/ProductOperation/productListAll2?pageNum=${pageInfo.nextPage}"> 下一页</a></li>
    <li><a href="/ProductOperation/productListAll2?pageNum=${pageInfo.pages}"> 尾页</a></li>
</ul>
</body>
</html>
