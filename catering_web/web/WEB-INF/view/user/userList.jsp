<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/25
  Time: 11:42
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
                        <c:forEach items="${allUser}" var="userInfo">
                            <tr>
                                <td>${userInfo.id}</td>
                                <td>${userInfo.username}</td>
                                <td>${userInfo.name}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <button class="btn btn-info add" id="add">新增</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group">
                        <label for="userName">名称</label>
                        <input type="text" class="form-control" id="userName" placeholder="请输入名称">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" id="password" placeholder="请输入密码">
                    </div>


                    <div class="form-group">
                        <label for="password">角色</label>
                        <select name="role" id="role">
                            <c:forEach items="${roles}" var="r">
                                <option value="${r.id }" class="role" >${r.name }</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $("#add").click(function () {
        var s=document.getElementById("save").value="insert";
        $("#userName").val("");
        $("#password").val("");
        $("#myModal").modal('show');
    })
    //添加操作
    $("#save").click(function () {
        //得到保存按钮修改的值
        var val=document.getElementById("save").value;
        if(val!="insert"){
            return;
        }

        var username = $("#userName").val();
        var passoword=$("#password").val();
        //模态框隐藏
        $("#myModal").modal('hide');
        //ajax做法
        $.ajax({
            type: "post",
            url: "/userInsert",
            data:{
                username:username,
                password:passoword
            },
            success:function (data) {
                window.location.reload();
            }
        });
    });
</script>
</body>
</html>
