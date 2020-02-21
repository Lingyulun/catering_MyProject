<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/4
  Time: 19:43
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
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>修改人员信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/catering/update">
            <input type="hidden" class="input" name="eid" value="${employee.eid}"/>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="ename" value="${employee.ename}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field" id="egenderId" name="${employee.egender}">
                    <input type="radio" name="egender" class="egender" id="man" value="男" /> 男
                    <input type="radio" name="egender" class="egender" id="women" value="女"/> 女
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>身份证号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="eidcard" value="${employee.eidcard}"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>手机号码：</label>
                </div>
                <div class="field">
                    <input type="number" class="input" name="ephone" value="${employee.ephone}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="eaddress" value="${employee.eaddress}" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>部门：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="edeptid" value="${employee.edeptid}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>职称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="ejodlevelid" value="${employee.ejodlevelid}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>入职时间：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="edegindate" value="${employee.edegindate}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 修改</button>
                    <button class="button bg-main " type="reset"> 重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var s=$("#egenderId").attr("name");
        if (s== "女") {
            document.getElementById('women').checked = true;
        } else {
            document.getElementById('man').checked = true;
        }
    });
</script>
</body>
</html>
