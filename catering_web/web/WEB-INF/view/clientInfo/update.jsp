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
    <title>客户信息修改</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>
</head>
<body>
<div class="x-body">
    <form class="layui-form" id="form2">
        <div class="layui-form-item">
            <label for="uid" class="layui-form-label">
                <span class="x-red">*</span>编号
            </label>
            <div class="layui-input-inline">
                <input type="text"  id="uid" name="uid" readonly="readonly" required="" lay-verify="required"
                       autocomplete="off" value="${userInfoById.uid}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" value="${userInfoById.username}" id="username" name="username" required="" lay-verify=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="ubirthday" class="layui-form-label">
                <span class="x-red">*</span>出生日期
            </label>
            <div class="layui-input-inline">
                <input type="date" value="${userInfoById.ubirthday}" id="ubirthday" name="ubirthday" required="" lay-verify=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="uage" class="layui-form-label">
                <span class="x-red">*</span>年龄
            </label>
            <div class="layui-input-inline">
                <input type="number" value="${userInfoById.uage}" id="uage" name="uage" required="" lay-verify=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="uphone" class="layui-form-label">
                <span class="x-red">*</span>电话号码
            </label>
            <div class="layui-input-inline">
                <input type="text" value="${userInfoById.uphone}" id="uphone" name="uphone" required="" lay-verify="uphone"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="uaddress" class="layui-form-label">
                <span class="x-red">*</span>地址
            </label>
            <div class="layui-input-inline">
                <input type="text" value="${userInfoById.uaddress}" id="uaddress" name="uaddress" required="" lay-verify=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>性别</label>
            <div class="layui-input-block" id="usernameId" name="${userInfoById.usex}">
                <input type="radio" name="usex" lay-skin="primary" id="man"  title="男" value="男"/>
                <input type="radio" name="usex" lay-skin="primary" id="women" title="女" value="女"/>
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        form.verify({
            uphone: [/^1\d{10}$/, "请输入正确的手机号"]
        });
        //监听提交
        form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/client/update" ,//url
                data: $('#form2').serialize(),
                success:function () {
                    window.location.href='/client/clientInfoAll'
                }
            });
            layer.alert("修改成功,请刷新数据", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });
    });
    $(function(){
        var s=$("#usernameId").attr("name");
        if (s== "女") {
            document.getElementById('women').checked = true;
        } else {
            document.getElementById('man').checked = true;
        }
    });
</script>
</body>
</html>
