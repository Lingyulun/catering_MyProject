<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/3/2
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>
</head>
<body>
<div class="x-body">
    <form class="layui-form" id="formManagerupdate">
        <div class="layui-form-item">
            <label for="mId" class="layui-form-label">
                <span class="x-red">*</span>id
            </label>
            <div class="layui-input-inline">
                <input type="text" readonly="readonly" id="mId" name="mId" value="${managerUpdateId.MId}" required=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="mName" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="mName" name="mName" value="${managerUpdateId.MName}" required=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="mPhone" class="layui-form-label">
                <span class="x-red">*</span>手机
            </label>
            <div class="layui-input-inline">
                <input type="text" id="mPhone" name="mPhone" value="${managerUpdateId.MPhone}" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为您唯一的登入名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="mUsername" class="layui-form-label">
                <span class="x-red">*</span>登录名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="mUsername" name="mUsername" value="${managerUpdateId.MUsername}" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为您唯一的登入名
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>角色</label>
            <div class="layui-input-block" id="mRoleId" name="${managerUpdateId.name}">
                <input type="radio" name="role" lay-skin="primary" id="superManager"  title="超级管理员" value="1"/>
                <input type="radio" name="role" lay-skin="primary" id="gradeManager" title="高级管理员" value="2"/>
                <input type="radio" name="role" lay-skin="primary" id="generalManager" title="普通管理员" value="3"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="mPassword" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="mPassword" name="mPassword" value="${managerUpdateId.MPassword}" required="" lay-verify="pass"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>
        </div>
        <div class="layui-form-item">
            <label for="BTN" class="layui-form-label">
            </label>
            <button  class="layui-btn" id="BTN" lay-filter="update" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
        });
        //监听提交
        form.on('submit(update)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/managers/update" ,//url
                data: $('#formManagerupdate').serialize(),
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
        var s=$("#mRoleId").attr("name");
        if (s== "超级管理员") {
            document.getElementById('superManager').checked = true;
        }else if(s=="高级管理员"){
            document.getElementById('gradeManager').checked=true;
        }else {
            document.getElementById('generalManager').checked = true;
        }
    });
</script>
</body>
</html>
