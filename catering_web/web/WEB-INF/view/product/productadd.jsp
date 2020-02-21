<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/9
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/js/up.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="/static/css/uploadimage/base.css">
    <link rel="stylesheet" type="text/css" href="/static/css/uploadimage/home.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
            <h1>添加产品信息</h1>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-10 column">
                                                                    <%--${pageContext.request.contextPath}不加找不到404 加了之后他会到Tomcat服务器的根目录中查找---%>
                                                                       <%--参考网址 https://blog.csdn.net/qq_38403590/article/details/80765945--%>
            <form class="form-horizontal" roleEntity="form" name="form1" method="post" action="${pageContext.request.contextPath}/ProductOperation/productAddManager" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="pname" class="col-sm-2 control-label">名字</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="pname" name="pname" onBlur="checkna()">
                        <span class="tips" id="divname">长度1~6个字符</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="psalary" class="col-sm-2 control-label">单价</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="psalary" name="psalary" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="ptype" class="col-sm-2 control-label">分类</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="ptype" name="ptype">
                            <c:forEach items="${productType}" var="productType" >
                                <c:choose>
                                    <c:when test="${productType.tid == product.ptype}">
                                        <option selected  value="${productType.tid}">${productType.typeName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  value="${productType.tid}">${productType.typeName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>

                    </div>
                </div>

                <div class="form-group">
                    <label for="pdesc" class="col-sm-2 control-label">描述</label>
                    <div class="col-sm-6">
                        <textarea name="pdesc" id="pdesc" cols="30" rows="10" class="form-control">${product.pdesc}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="image" class="col-sm-2 control-label">图片</label>
                    <div class="col-sm-6">
                        <input type="file" name="pimage" id="image" onchange="preImg(this.id,'imgPre');" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="image" class="col-sm-2 control-label"></label>
                    <div class="col-sm-6">
                        <img id="imgPre" src="" width="100px" height="100px" style="display: block;" class="imageSize">
                    </div>
                </div>



                <div class="form-group">
                    <label for="pcount" class="col-sm-2 control-label">数量</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="pcount" name="pcount"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button type="submit" id="baocun" class="btn btn-default">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
    //验证姓名
    function checkna(){
        na=form1.pname.value;
        if( na.length <1 || na.length >8)
        {
            divname.innerHTML='<p style="color: red">长度是1~6个字符</p>';

        }else{
            divname.innerHTML='<p style="color: green">输入正确</p>';
        }
    }

    /**
         * 从 file 域获取 本地图片 url
         */
        function getFileUrl(sourceId) {
            var url;
            if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
                url = document.getElementById(sourceId).value;
            } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            }
            return url;
        }

    /**
     * 将本地图片 显示到浏览器上
     */
    function preImg(sourceId, targetId) {
        var url = getFileUrl(sourceId);
        var imgPre = document.getElementById(targetId);
        imgPre.src = url;
    }
</script>
</body>
</html>
