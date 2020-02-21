<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/11
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        function getFileUrl(sourceId) {
            var url;
            if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
                url = document.getElementById(sourceId).value;
            }
            else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            }
            else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            }
            return url;
        }
        function preImg(sourceId, targetId) {
            var url = getFileUrl(sourceId);
            var imgPre = document.getElementById(targetId);
            imgPre.src = url;
        }
    </script>
</head>
<body>
<%--
<form method="post" action="${pageContext.request.contextPath}/ProductOperation/productAddManager" enctype="multipart/form-data">
    选择一个文件:
    <input type="file" name="myFile2" />
    <br/><br/>
    <input type="submit" value="上传" />
</form>
--%>

<input type="file" name="imgOne" id="imgOne1" οnchange="preImg(this.id,'imgPre');" />
<img id="imgPre" src="" width="300px" height="400px" style="display: block;" />

</body>
</html>
