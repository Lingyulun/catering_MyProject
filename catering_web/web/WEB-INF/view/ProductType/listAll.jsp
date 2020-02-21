<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/5
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>产品类型</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/pintuer.css" type="text/css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/admin.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 产品类型</strong></div>
    <div class="body-content">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-10 column" id="content">
                    <table id="table" class="table table-bordered table-hover">
                        <tr>
                            <th>编号</th>
                            <th>类型</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pageType.list}" var="pType">
                            <tr>
                                <td>${pType.tid}</td>
                                <td>${pType.typeName}</td>
                                <%-- <td id="pType" name="${pType.tid}">--%>
                                <td>
                                    <a href='#' class='edit btn btn-info' onclick="editInfo(this)"  id="typeId">编辑</a>
                                    <a href='#' class='delete btn btn-danger' onclick="confirmDel(${pType.tid})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="3">
                                <button class="btn btn-info add" onclick="add()">新增</button>
                                <ul class="pagination">
                                    <li><a href="/ProductTypeLocation/list?pageNum=1"> 首页</a></li>
                                    <li><a href="/ProductTypeLocation/list?pageNum=${pageType.prePage}"> 上一页</a></li>
                                    <c:forEach items="${pageType.navigatepageNums}" var="p">
                                        <li><a href="/ProductTypeLocation/list?pageNum=${p}"> ${p}</a></li>
                                    </c:forEach>
                                    <li><a href="/ProductTypeLocation/list?pageNum=${pageType.nextPage}"> 下一页</a></li>
                                    <li><a href="/ProductTypeLocation/list?pageNum=${pageType.pages}"> 尾页</a></li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<%--弹出修改模块框--%>
<div class="modal fade" id="update" tabindex="-1" roleEntity="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">修改信息</h4>
            </div>

            <div class="modal-body">
                <label for="tid" class="col-sm-2 control-label">类型ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="tid" name="tid" />
                </div>
            </div>
            <div class="modal-body">
                <label for="typeName" class="col-sm-2 control-label">类型名字</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="typeName" name="typeName" />
                </div>
            </div>

            <div class="modal-footer">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="save" class="btn btn-default">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>





<script>
    function confirmDel(param){
        if(window.confirm("您确定要删除吗？")){
            document.location="/ProductTypeLocation/deleteProductTypeId?tid="+param
        }
    }

    /*修改时获取当前的id*/
    function editInfo(obj) {
        /*得到当前行*/
        var id = $(obj.parentNode).parent().prevAll().length;
        //var lie = $(obj.parentNode).prevAll().length;
        //alert("第"+id+"行"+"	"+"第"+lie+"列");

        //获取表格中的一行数据
        var tid=document.getElementById("table").rows[id].cells[0].innerText;
        var typeName = document.getElementById("table").rows[id].cells[1].innerText;
        //向模态框中传值
        $('#tid').val(tid);
        //禁止操作
        $("#tid").prop("disabled", "disabled");
        $('#typeName').val(typeName);
        //模态框显示
        $('#update').modal('show');
    }
    $("#save").click(function () {

        //得到修改的值
        var typeName = $('#typeName').val();
        var tid=$("#tid").val();
        //模态框隐藏
        $("#update").modal('hide');
        //ajax做法
         $.ajax({
             type: "post",
             url: "/ProductTypeLocation/update",
             data:{
                 tid:tid,
                 typeName:typeName
             },
             success:function (data) {
                 location.href="/ProductTypeLocation/list";
             }
         });
        /*post做法*/
       /* var obj = {tid:$("#tid").val(),typeName:$("#typeName").val()};
        $.post("/ProductTypeLocation/update",obj,function () {
            //location.href="/ProductTypeLocation/list";
        });*/
    });

    //添加操作
    function add() {
        //修改保存按钮的id值，因为添加和修改共用一个模态框
        var s=document.getElementById("save").value="insert"
        $("#tid").val("");
        $("#tid").prop("disabled", "disabled");
        $("#typeName").val("");
        $("#update").modal('show');

    }
    //添加操作
    $("#save").click(function () {
        //得到保存按钮修改的值
        var val=document.getElementById("save").value;
        if(val!="insert"){
            return;
        }
        //得到修改的值
        var typeName = $('#typeName').val();
        //模态框隐藏
        $("#update").modal('hide');
        //ajax做法
        $.ajax({
            type: "post",
            url: "/ProductTypeLocation/insert",
            data:{
                typeName:typeName
            },
            success:function (data) {
                location.href="/ProductTypeLocation/list";
            }
        });
    });
</script>
</body>
</html>
