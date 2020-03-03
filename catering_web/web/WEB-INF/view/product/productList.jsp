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
    <%--<script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
--%>

    <link href="/static/css/productshow/reset.css" rel="stylesheet" />
    <link href="/static/css/productshow/iconfont.css" rel="stylesheet" />
    <link href="/static/css/productshow/index.css" rel="stylesheet" />

</head>
<body>
<div class="RightBox">
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

              <%--  <div class="Text">产品名称：</div>
                <div class="InputDiv">   <input class="phoneInput" placeholder="请输入你需要查询的产品名" /></div>--%>
            </div>
           <%-- <div class="InquireleftBox">
                <div class="Text">产品分类：</div>
                <div class="InputDiv">
                    <i class=" iconfont icon-xiala"></i>
                    <select class="phoneInput">
                        <option>请选择你的产品分类</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select>
                </div>
            </div>
            <div class="PublicBtnIcon Color1Btn fr">
                <i class="iconfont icon-icon-chaxun"></i>
                <span>查询</span>
            </div>--%>
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
                        <%--<li><a href="/ProductOperation/productAdd"> 添加</a></li>--%>
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

</div>

</body>
</html>
