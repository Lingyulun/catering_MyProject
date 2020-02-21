<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/17
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
    <script src="/static/js/jquery-3.3.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
            <h1>产品分类</h1>
        </div>
        <div class="col-md-8 column">
            <h1><a href="/miniproject/viewcart" class="pull-right">查看购物车
                <span class="badge pull-right">分类数量：</span>
                <span class="badge pull-right">总数量：</span>
            </a>
            </h1>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <c:forEach items="${pvo.productTypes}" var="productTypes">
                    <c:choose>
                        <c:when test="${productTypes.tid == 1}">
                            <li class="active">
                                <a href="/beforeInfo?tid=${productTypes.tid}">${productTypes.typeName}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="/beforeInfo?tid=${productTypes.tid}">${productTypes.typeName}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>
        <div class="col-md-10 column">
            <div class="row">
                <!-- 搜索用get请求 -->
                <form action="/miniproject/fe/index" method="get">
                    <input type="hidden" name="cid" id="cid"/>
                    <div class="col-md-10">
                        <!-- 这里利用了el表达式的隐式对象param，
                        param用来读取查询参数，比如url上的查询字符窜数据 -->
                        <input type="text" name="pname" id="pid" class="form-control center-block" value="${param.pname}" />
                    </div>
                    <div class="col-md-2">
                        <input type="submit" value="搜索" id="btnSearch" class="btn btn-primary btn-danger" />
                    </div>
                </form>
                <div class="row">
                    <c:forEach items="${pvo.products}" var="products">
                        <form method="post">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img src="${products.pimage}" width="150px" height="100px" />
                                    <input type="hidden" name="pid" value="${products.pid}" />
                                    <div class="caption">
                                        <h3>
                                                ${products.pname}
                                        </h3>
                                        <p>
                                            单价：${products.psalary}
                                        </p>
                                        <p>
                                            <input type="submit" value="添加到购物车" class="btn btn-primary" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>

                <div class="row">
                    <ul class="pagination pagination-lg">
                        <li>
                            <a href="#">首页</a>
                        </li>
                        <li>
                            <a href="#">上一页</a>
                        </li>
                        <li>
                            <a href="#">下一页</a>
                        </li>
                        <li>
                            <a href="#">尾页</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
