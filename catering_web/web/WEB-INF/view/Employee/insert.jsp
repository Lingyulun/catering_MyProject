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
    <link rel="stylesheet" href="/static/backgroundStyle/css/font.css">
    <link rel="stylesheet" href="/static/backgroundStyle/css/xadmin.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/static/backgroundStyle/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/backgroundStyle/js/xadmin.js"></script>
    <script type="text/javascript" src="/static/js/three/city.js"></script>

</head>
<body>
<div class="x-body">
<form action="" method="">
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
        <label class="layui-form-label"><span class="x-red">*</span>性别</label>
        <div class="layui-input-inline">
            <select name="egender">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
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
        <label class="layui-form-label">
            <span class="x-red">*</span>地址
        </label>
        <div class="layui-input-inline">
            <select id="province" name="province" onchange="getCity()">
                <option value="0">所在省</option>
                <option value="安徽省">安徽省</option>
                <option value="澳门">澳门</option>
                <option value="北京">北京</option>
                <option value="福建省">福建省</option>
                <option value="甘肃省">甘肃省</option>
                <option value="广东省">广东省</option>
                <option value="广西省">广西省</option>
                <option value="贵州省">贵州省</option>
                <option value="海南省">海南省</option>
                <option value="河北省">河北省</option>
                <option value="河南省">河南省</option>
                <option value="黑龙江">黑龙江</option>
                <option value="湖北省">湖北省</option>
                <option value="湖南省">湖南省</option>
                <option value="吉林省">吉林省</option>
                <option value="江苏省">江苏省</option>
                <option value="江西省">江西省</option>
                <option value="辽宁省">辽宁省</option>
                <option value="内蒙古">内蒙古</option>
                <option value="宁夏">宁夏</option>
                <option value="青海">青海</option>
                <option value="山东省">山东省</option>
                <option value="山西省">山西省</option>
                <option value="陕西">陕西</option>
                <option value="上海">上海</option>
                <option value="四川">四川省</option>
                <option value="台湾">台湾</option>
                <option value="西藏">西藏</option>
                <option value="香港">香港</option>
                <option value="新疆">新疆</option>
                <option value="云南">云南省</option>
                <option value="浙江">浙江</option>
                <option value="重庆">重庆</option>
                <option value="海外">海外</option>
            </select>
            <select id="city" name="city" onchange="getDistrict()">
                <option value="0">所在市</option>
            </select>
            <select id="district" name="district" onclick="getTown()">
                <option value="0">所在区</option>
            </select>
            <input type="button" id="testAddress" value="点击查看被选项目">
            <input type="text" id="eaddress" name="eaddress"/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><span class="x-red">*</span>部门</label>
        <div class="layui-input-inline">
            <%--查询所有部门填充到下拉框--%>
            <select id="edeptid" name="edeptid">
                <c:forEach items="${deptsInsert}" var="deptn" >
                    <option value="${deptn.deptId}">${deptn.deptName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><span class="x-red">*</span>部门</label>
        <div class="layui-input-inline">
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
<script type="text/javascript">
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

    $(function () {
        var province= $("#province option:checked").text();
        var city = $("#city option:checked").text();
        var strict=$("#district option:checked").text();
        var address=province+city+strict;
        $("#eaddress").val(address);
        alert("被选项目的显示值："+address);
    })

    function getCity(){//城市
        //获得省份下拉框的对象
        var sltProvince=document.forms[0].province;
        //获得城市下拉框的对象
        var sltCity=document.forms[0].city;
        //获得市区下拉框的对象
        var sltDistrict=document.forms[0].district;
        //得到对应省份的城市数组
        var provinceCity=city[sltProvince.selectedIndex - 1];
        //清空城市下拉框，仅留提示选项
        sltCity.length=1;
        for(var i=0;i<provinceCity.length;i++){
            sltCity[i+1]=new Option(provinceCity[i],provinceCity[i]);
        }
    }
    function getDistrict() {//镇
        var sltProvince=document.forms[0].province;
        //获得省下拉框的对象
        var sltCity=document.forms[0].city;
        //获得市区下拉框的对象
        var sltDistrict=document.forms[0].district;
        //得到对应城市的市区数组
        var cityDistrict=district[sltProvince.selectedIndex - 1][sltCity.selectedIndex - 1];
        //清空城市下拉框，仅留提示选项
        sltDistrict.length=1;
        //将市区数组中的值填充到市区下拉框中
        for(var i=0;i<cityDistrict.length;i++){
            sltDistrict[i+1]=new Option(cityDistrict[i],cityDistrict[i]);
        }
    }

</script>


</body>
</html>
