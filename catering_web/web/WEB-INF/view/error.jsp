<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/3
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    error!<h1>${msg}</h1>
    <input type="button" value="返回上级别" width="30" onclick="backSuper()"/>
<script type="text/javascript">
    function backSuper(){
        window.history.go(-1);
    }
</script>
</body>
</html>
