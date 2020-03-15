<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/3/9
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>产品修改</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/js/up.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/css/uploadimage/base.css">
    <link rel="stylesheet" type="text/css" href="/static/css/uploadimage/home.css">

    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-10 column">
            <form  class="form-horizontal"  roleEntity="form" id="formUpdateProduct" name="formUpdateProduct" method="post" action="${pageContext.request.contextPath}/ProductOperation/updateProduct"  enctype="multipart/form-data">
                <div class="form-group">
                    <label for="pid" class="col-sm-2 control-label">编号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" readonly="readonly" id="pid" name="pid" value="${updateProductPId.pid}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pname" class="col-sm-2 control-label">名字</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="pname" name="pname" value="${updateProductPId.pname}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="psalary" class="col-sm-2 control-label">单价</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="psalary" name="psalary" value="${updateProductPId.psalary}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="ptype" class="col-sm-2 control-label">分类</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="ptype" name="ptype" value="${updateProductPId.ptype}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="pdesc" class="col-sm-2 control-label">描述</label>
                    <div class="col-sm-6">
                        <textarea name="pdesc" id="pdesc" cols="30" rows="10" class="form-control">${updateProductPId.pdesc}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="image" class="col-sm-2 control-label">图片</label>
                    <div class="col-sm-6">
                       <%-- <input type="file" name="pimage"  id="image" onchange="preImg(this.id,'imgPre');" class="form-control">--%>
                        <input type="file" name="pimage"  id="image" value="${updateProductPId.pimage}" onchange="preImg(this.id,'imgPre');" class="form-control">

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
                        <input type="number" class="form-control" id="pcount" name="pcount" value="${updateProductPId.pcount}"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                    </label>
                    <button  class="layui-btn" lay-filter="update" lay-submit="">
                        增加
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">

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

    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form;
        form.on('submit(update)', function(data){
            //发异步，把数据提交给php
            layer.alert("修改成功,刷新数据", {icon: 6},function () {
                //为了美化把提交，放入显示添加成功后
                $("#formUpdateProduct").submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });
    });
</script>
</body>
</html>
