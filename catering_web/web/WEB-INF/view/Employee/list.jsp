<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/2
  Time: 16:25
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
    <script src="/static/js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript">
        var rows = document.getElementsByTagName('tr');//取得行
        for(var i=0 ;i<rows.length; i++){
            rows[i].onmouseover = function(){//鼠标移上去,添加一个类'hilite'
                this.className += 'hilite';
            }
            rows[i].onmouseout = function(){//鼠标移开,改变该类的名称
                this.className = this.className.replace('hilite','');
            }
        }
    </script>

    <style type="text/css">
        .table1 tr:hover,.table1 tr.hilite
        {
            background-color:#99FF66;
            color:#0000CC;
        }
    </style>

</head>
<body>
<div style="padding: 20px 50px 10px;">
    <form class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath}/catering/listEmployee" method="post">
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <input type="text" class="form-control" name="ename">
                    <span class="input-group-btn">
						<button class="btn btn-default" type="submit">
							查询员工信息
						</button>
					</span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div><!-- /.row -->
    </form>

   <%-- <form action="${pageContext.request.contextPath}/catering/listEmployee" class="form form-horizontal">
        <input type="text" class="input-text" style="width:250px" placeholder="请输入"  name="ename">&nbsp;
        <input type="submit" class="btn btn-success Hui-iconfont radius" name="" value="&#xe665;搜产品">
    </form>--%>
</div>



<table class="table" class="table1">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>身份证号</th>
        <th>手机号码</th>
        <th>住址</th>
        <th>部门</th>
        <th>职位</th>
        <th>入职日期</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${page.list}" var="emp">
        <tr>
            <td>${emp.eid}</td>
            <td>${emp.ename}</td>
            <td>${emp.egender}</td>
            <td>${emp.eidcard}</td>
            <td>${emp.ephone}</td>
            <td>${emp.eaddress}</td>
            <td>${emp.edeptid}</td>
            <td>${emp.ejodlevelid}</td>
            <td>${emp.edegindate}</td>
            <td>
                <a href='/catering/getById?eid=${emp.eid}' class='edit btn btn-info'>编辑</a>
                <a href='/catering/deleteEmp?eid=${emp.eid}' class='edit btn btn-info'>删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<ul class="pagination">
    <li><a href="/catering/addView">添加</a></li>
    <li><a href="/catering/list?pageNum=1"> 首页</a></li>
    <li><a href="/catering/list?pageNum=${page.prePage}"> 上一页</a></li>
    <c:forEach items="${page.navigatepageNums}" var="p">
        <li><a href="/catering/list?pageNum=${p}"> ${p}</a></li>
    </c:forEach>
    <li><a href="/catering/list?pageNum=${page.nextPage}"> 下一页</a></li>
    <li><a href="/catering/list?pageNum=${page.pages}"> 尾页</a></li>
</ul>
</body>
</html>
