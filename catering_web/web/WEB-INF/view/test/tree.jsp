<%--
  User: cj
  Date: 2019/12/3
  Time: 20:37
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQuery Tree Demo</title>
    <link rel="stylesheet" href="/static/css/bootstrapStyle/bootstrapStyle.css" type="text/css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/static/js/ztree/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="/static/js/ztree/jquery.ztree.excheck.js"></script>
</head>
<body>
<h1>jQuery Tree Demo</h1>

<ul id="tree" class="ztree"></ul>

<input type="button" id="btnSave" value="save"/>
<script>
    var setting = {
        check: {
            //使用复选框
            enable: true
        },
        data: {
            //使用外部数据
            simpleData: {
                enable: true
            }
        }
    };

    function getIdsFromCheckNodes(event, treeId, treeNode) {       //第二步
        var treeObj = $.fn.zTree.getZTreeObj("tree"),
            nodes = treeObj.getCheckedNodes(true),
            id = [];
        for (var i = 0; i < nodes.length; i++) {
            id[i] = nodes[i].id; //第三部
        }
        return id;
    }

    $.getJSON("/admin/privilege/list", {"roleId": 2}, function (result) {
        $.fn.zTree.init($("#tree"), setting, result);
    })

</script>

<script>
    $("#btnSave").click(function () {
        var ids = getIdsFromCheckNodes();
        console.log(ids);
    });
</script>
</body>
</html>
