<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/11
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/bootstrap/css/admin"></script>
    <link href="/static/bootstrap/css/pintuer.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/js/pintuer.js"></script>
    <script src="/static/js/jquery-3.3.1.min.js"></script>

</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>添加用户信息</strong></div>
    <div class="body-content">
        <form class="form-x" action="/user/update" method="post">
            <div class="form-group">
                <div class="label">
                    <label>编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="uid" id="uid" value="${userInfoById.uid}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="username" id="username" value="${userInfoById.username}"/>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>年龄：</label>
                </div>
                <div class="field">
                    <input type="number" class="input" name="uage" id="uage" value="${userInfoById.uage}"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>手机号码：</label>
                </div>
                <div class="field">
                    <input type="number" class="input" name="uphone" id="uphone" value="${userInfoById.uphone}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="uaddress" id="uaddress" class="uaddress" value="${userInfoById.uaddress}" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field" id="usernameId" name="${userInfoById.usex}">
                    <input type="radio" name="usex" class="usex" id="man" value="男" /> 男
                    <input type="radio" name="usex" class="usex" id="women" value="女"/> 女
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" id="updateUserInfo"> 修改</button>
                    <button class="button bg-main " type="reset"> 重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var s=$("#usernameId").attr("name");
        if (s== "女") {
            document.getElementById('women').checked = true;
        } else {
            document.getElementById('man').checked = true;
        }
       /* $("#updateUserInfo").click(function () {
            $.ajax({
                url:"/user/update",
                type:"post",
                data:{
                    uid:$("#uid").val(),
                    username:$("#user").val(),
                    uage:$("#uage").val(),
                    uphone:$("#uphone").val(),
                    uaddress:$("#uaddress").val(),
                    usex:$(".usex").val()
                },
                success:function (data) {
                    location.href="/user/userInfoAll";
                }
            });
        })*/
    });
</script>
</body>
</html>
