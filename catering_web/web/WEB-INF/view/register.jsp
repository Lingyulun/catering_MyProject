<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="<%=basePath%>/static/css/phoneCode/register.css" rel="stylesheet" >
    <script src="<%=basePath%>/static/js/phoneCode/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/static/js/phoneCode/register.js" type="text/javascript"></script>
    <script>
        function getBasePath(){
            return '<%=basePath%>';
        }
    </script>
</head>
<body>
<form>
    <div class="row">
         <label>账号: </label><input name="userId">
    </div>
    <div class="row">
        <label>密码:</label><input name="password">
    </div>
    <div class="row">
        <label>手机号:</label><input name="mobile">
    </div>
    <div class="row">
        <label>验证码:</label>
        <input name="verifyCode">
        <button type="button" class="sendVerifyCode">获取短信验证码</button>
    </div>
    <div><button type="button" class="sub-btn">提交</button></div>
</form>
</body>
</html>