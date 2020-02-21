$(".accredit").on("click", function () {
    $("#submit").unbind("click"); //防止重复绑定单击事件,粗暴的先解绑
    var roleId = $(this).val();
    $('#myModal').modal('show');
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
        },
        callback: {    //第一步
            onClick: zTreeOnClick
        }
    };

    function zTreeOnClick(event, treeId, treeNode) {       //第二步
        var treeObj = $.fn.zTree.getZTreeObj("tree"),
            nodes = treeObj.getCheckedNodes(true),
            id = [];
        for (var i = 0; i < nodes.length; i++) {
            id[i] = nodes[i].id; //第三部
        }
        return id;
    }

    $.getJSON("/admin/privilege/list", {"roleId": roleId}, function (result) {
        var zNodes = result;
        $.fn.zTree.init($("#tree"), setting, zNodes);
    })


//----------------保存
    console.log(roleId)
    $("#submit").on("click", function () {
        $.ajax({
            url: "/admin/role-privilege/inser",
            type: "post",
            traditional: true,
            data: {
                "privilege_id": zTreeOnClick(),
                "role_id": roleId
            },
            success: function (result) {
                if (result == true) {
                    alert("授权成功")
                }

            }
        })
    })
});













