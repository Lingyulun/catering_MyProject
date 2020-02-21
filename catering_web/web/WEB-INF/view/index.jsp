<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/1/14
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/favicon.ico">
    <title>管理后台</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header custom-header">

        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item slide-sidebar" lay-unselect>
                <a href="javascript:;" class="icon-font"><i class="ai ai-menufold"></i></a>
            </li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">BieJun</a>
                <dl class="layui-nav-child">
                    <dd><a href="">帮助中心</a></dd>
                    <dd><a href="/background/login">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side custom-admin">
        <div class="layui-side-scroll">

            <div class="custom-logo">
                <img src="/static/assets/images/logo.png" alt=""/>
                <h1>后台餐饮管理</h1>
            </div>
            <ul id="Nav" class="layui-nav layui-nav-tree">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe609;</i>
                        <em>主页</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="views/console.html">控制台</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe857;</i>
                        <em>基本设置</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/catering/list">员工信息</a></dd>
                        <dd><a href="/catering/addView">添加人员信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe612;</i>
                        <em>用户信息</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/user/list">用户</a></dd>
                        <dd><a href="/role/list">权限配置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe857;</i>
                        <em>部门管理</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/dept/listAll">部门信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe857;</i>
                        <em>产品管理</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/ProductOperation/productListAll">产品信息</a></dd>
                        <dd><a href="/ProductTypeLocation/list">产品类型</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">
            <ul id="appTabs" class="layui-tab-title custom-tab"></ul>
            <div id="appTabPage" class="layui-tab-content"></div>
        </div>
    </div>

    <div class="layui-footer">
        <p>© 2018 DEMO</p>
    </div>

    <div class="mobile-mask"></div>
</div>
<script src="${pageContext.request.contextPath}/static/assets/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/home.js"></script>
</body>
</html>
