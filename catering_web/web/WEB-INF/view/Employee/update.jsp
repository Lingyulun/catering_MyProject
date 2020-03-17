<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/4
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <%--  <script src="/static/bootstrap/css/admin"></script>
    <link href="/static/bootstrap/css/pintuer.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/js/pintuer.js"></script>--%>

    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>
</head>
<body>
<%--<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>修改人员信息</strong></div>
    <div class="body-content">
        <form  class="form-x" action="/catering/update" method="post">
            <input type="hidden" class="input"  name="eid" value="${employee.eid}"/>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input"  name="ename" value="${employee.ename}"/>
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
                    <input type="text" class="input"  name="eidcard" value="${employee.eidcard}"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>手机号码：</label>
                </div>
                <div class="field">
                    <input type="number" class="input"  name="ephone" value="${employee.ephone}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input"  name="eaddress" value="${employee.eaddress}" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>部门：</label>
                </div>
                <div class="field">
                    <input type="text" class="input"  name="edeptid" value="${employee.edeptid}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>职称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input"  name="ejodlevelid" value="${employee.ejodlevelid}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>入职时间：</label>
                </div>
                <div class="field">
                    <input type="text" class="input"  name="edegindate" value="${employee.edegindate}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o"  type="submit"> 修改</button>
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
</script>--%>



<div class="x-body">
    <form class="layui-form" id="updateEmployee">
        <div class="layui-form-item">
            <label for="eid" class="layui-form-label">
                <span class="x-red">*</span>id
            </label>
            <div class="layui-input-inline">
                <input type="text" id="eid" name="eid" readonly="readonly" value="${employee.eid}" required=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="ename" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ename" name="ename" value="${employee.ename}" required=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>性别</label>
            <div class="layui-input-block" id="egender" name="${employee.egender}">
                <input type="radio" name="egender" lay-skin="primary" id="man"  title="男" value="女"/>
                <input type="radio" name="egender" lay-skin="primary" id="women" title="女" value="男"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="eidcard" class="layui-form-label">
                <span class="x-red">*</span>身份证号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="eidcard" name="eidcard" value="${employee.eidcard}" required="" lay-verify="required"
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
                <input type="text" id="ephone" name="ephone" value="${employee.ephone}" required="" lay-verify="ephone"
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
                <input type="text" id="eaddress" name="eaddress" value="${employee.eaddress}" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>部门</label>
            <div class="layui-input-inline">
                <select class="form-control" id="edeptid" name="edeptid">
                    <c:forEach items="${depts}" var="depts" >
                        <c:choose>
                            <c:when test="${depts.deptId == employee.edeptid}">
                                <option selected  value="${depts.deptId}">${depts.deptName}</option>
                            </c:when>
                            <c:otherwise>
                                <option  value="${depts.deptId}">${depts.deptName}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>职位</label>
            <div class="layui-input-inline">
                <select name="ejodlevelid" id="ejolevelidChoose">
                    <option value="经理">经理</option>
                    <option value="副经理">副经理</option>
                    <option value="技术总监">技术总监</option>
                    <option value="普通员工">普通员工</option>
                </select>
            </div>
        </div>
       <%-- <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>职位</label>
            <div class="layui-input-block">
                <input type="text"  value="${employee.ejodlevelid}" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>--%>
        <div class="layui-form-item">
            <label for="edegindate" class="layui-form-label">
                <span class="x-red">*</span>入职时间
            </label>
            <div class="layui-input-inline">
                <input type="date" id="edegindate" name="edegindate" value="${employee.edegindate}" required=""
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">
            </label>
            <button  class="layui-btn" id="Employeeadd" lay-filter="update" lay-submit="">
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
                url: "/catering/update" ,//url
                data: $('#updateEmployee').serialize(),
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
        var s=$("#egender").attr("name");
        if (s== "男") {
            document.getElementById('man').checked = true;
        }else {
            document.getElementById('women').checked = true;
        }
        //选中对应的职位
        var x = "${employee.ejodlevelid}";//这个是上次选中的值,你应该放到request中返回的时候可以取到
        var sel = document.getElementById("ejolevelidChoose");
        for(var i=0;i<sel.options.length;i++){
            if(sel.options[i].value==x){
                sel.options[i].selected=true;
                break;
            }
        }
        $("#edegindate").val("${employee.edegindate}");
    });
</script>
</body>
</html>
