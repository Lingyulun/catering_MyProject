<%--
  User: cj
  Date: 2019/12/4
  Time: 10:46
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
</head>
<body>


<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
            <div id="menu">
                <div id="menuTemplate" >
                    <span class="header">模板菜单</span>
                    <ul class="child">
                        <li><a href="/home1">模板菜单项</a></li>
                        <li><a href="/home2">模板菜单项</a></li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="col-md-8 column">
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
        </div>
    </div>
</div>


</body>
</html>


<script>

    $(function () {

        var buildTree = function (data, parentId) {
            var tree = [];
            for (var i = 0; i < data.length; i++) {
                var node = data[i];
                if (node.pid == parentId) {
                    var newNode = {};
                    newNode.id = node.id;
                    newNode.name = node.name;
                    newNode.uri = node.uri;
                    newNode.children = buildTree(data, node.id);
                    tree.push(newNode);
                }
            }
            return tree;
        };


        var generateMenu = function (data) {

            for (var i = 0; i < data.length; i++) {
                var menuItemData = data[i];
                if(menuItemData.children.length==0){
                    continue;
                }
                var $menuItem = $("#menuTemplate").clone();
                $menuItem.find(".header").text(menuItemData.name);
                $menuItem.find(".child").empty();
                for (var j = 0; j < menuItemData.children.length; j++) {
                    var $menuChildItem = $("<li><a></a></li>");
                    $menuChildItem.find("a").attr("href",menuItemData.children[j].uri);
                    $menuChildItem.find("a").text(menuItemData.children[j].name);
                    $menuItem.find(".child").append($menuChildItem);
                }
                $("#menu").append($menuItem);

            }

        };
        //返回的是id,name,uri,parent,pid对象数组
        $.getJSON("/privileges/query", {"id": 2}, function (result) {
            generateMenu(buildTree(result,0));
        });

    });// ready end


</script>
