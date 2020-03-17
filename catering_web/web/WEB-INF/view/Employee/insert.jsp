<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/3
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加员工信息</title>
   <%-- <script src="/static/bootstrap/css/admin"></script>
    <link href="/static/bootstrap/css/pintuer.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/js/pintuer.js"></script>--%>

    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/backgroundStyle/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>

</head>
<body>
<%--<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>添加人员信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/catering/insert">
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="ename"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <select name="egender">
                    <option>男</option>
                    <option>女</option>
                </select>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>身份证号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="eidcard" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>手机号码：</label>
                </div>
                <div class="field">
                    <input type="number" class="input" name="ephone" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="eaddress" class="eaddress" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>部门：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="edeptid"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>职称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="ejodlevelid"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>入职时间：</label>
                </div>
                <div class="field">
                    <input type="date" class="input" name="edegindate"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 添加</button>
                    <button class="button bg-main " type="reset"> 重置</button>
                </div>
            </div>
        </form>
    </div>
</div>--%>

<div class="x-body">
    <form class="layui-form" id="formEmployee">
        <div class="layui-form-item">
            <label for="ename" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ename" name="ename" required=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>角色</label>
            <div class="layui-input-inline">
                <select name="egender">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="eidcard" class="layui-form-label">
                <span class="x-red">*</span>身份证号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="eidcard" name="eidcard" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="ephone" class="layui-form-label">
                <span class="x-red">*</span>手机
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ephone" name="ephone" required="" lay-verify="ephone"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="eaddress" class="layui-form-label">
                <span class="x-red">*</span>地址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="eaddress" name="eaddress" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>部门</label>
            <div class="layui-input-block">
               <%-- <select name="edeptid">
                    <option value="1">销售部</option>
                    <option value="2">管理部</option>
                    <option value="3">调研部</option>
                </select>--%>

                <select id="edeptid" name="edeptid">
                    <c:forEach items="${deptsInsert}" var="deptn" >
                        <option value="${deptn.deptId}">${deptn.deptName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>部门</label>
            <div class="layui-input-block">
                <select name="ejodlevelid">
                    <option value="经理">总经理</option>
                    <option value="副经理">副经理</option>
                    <option value="技术总监">技术总监</option>
                    <option value="普通员工">普通员工</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="edegindate" class="layui-form-label">
                <span class="x-red">*</span>入职时间
            </label>
            <div class="layui-input-inline">
                <input type="date" id="edegindate" name="edegindate" required=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">
            </label>
            <button  class="layui-btn" id="Employeeadd" lay-filter="addEmployee" lay-submit="">
                增加
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            ephone: [/^1\d{10}$/, "请输入正确的手机号"]
        });

        //监听提交
        form.on('submit(addEmployee)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/catering/insert" ,//url
                data: $('#formEmployee').serialize(),
            });
            layer.alert("增加成功,请刷新数据", {icon: 6},function () {
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
