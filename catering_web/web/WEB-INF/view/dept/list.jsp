<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/2/16
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/pintuer.css" type="text/css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/admin.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 部门信息</strong></div>
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
                        <c:forEach items="${dept.list}" var="dept">
                            <tr>
                                <td>${dept.deptId}</td>
                                <td>${dept.deptName}</td>
                                <td>
                                    <a href='#' class='edit btn btn-info' onclick="editInfo(this)"  id="deptsId">编辑</a>
                                    <a href='#' class='delete btn btn-danger' onclick="confirmDel(${dept.deptId})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="3">
                                <button class="btn btn-info add" onclick="add()">新增</button>
                                <ul class="pagination">
                                    <li><a href="${pageContext.request.contextPath}/dept/listAll?pageNum=1"> 首页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/dept/listAll?pageNum=${dept.prePage}"> 上一页</a></li>
                                    <c:forEach items="${depts.navigatepageNums}" var="p">
                                        <li><a href="${pageContext.request.contextPath}/dept/listAll?pageNum=${p}"> ${p}</a></li>
                                    </c:forEach>
                                    <li><a href="${pageContext.request.contextPath}/dept/listAll?pageNum=${dept.nextPage}"> 下一页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/dept/listAll?pageNum=${dept.pages}"> 尾页</a></li>
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
                <label for="deptid" class="col-sm-2 control-label">部门ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="deptid" name="deptid" />
                </div>
            </div>
            <div class="modal-body">
                <label for="deptname" class="col-sm-2 control-label">部门</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="deptname" name="deptname" />
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
            document.location="/dept/delete?deptId="+param
        }
    }


    /*修改时获取当前的id*/
    function editInfo(obj) {
        /*得到当前行*/
        var id = $(obj.parentNode).parent().prevAll().length;
        //var lie = $(obj.parentNode).prevAll().length;
        //alert("第"+id+"行"+"	"+"第"+lie+"列");

        //获取表格中的一行数据
        var did=document.getElementById("table").rows[id].cells[0].innerText;
        var dName = document.getElementById("table").rows[id].cells[1].innerText;
        //向模态框中传值
        $('#deptid').val(did);
        //禁止操作
        $("#deptid").prop("disabled", "disabled");
        $('#deptname').val(dName);
        //模态框显示
        $('#update').modal('show');
    }
    $("#save").click(function () {

        //得到修改的值
        var deptName = $('#deptname').val();
        var deptid=$("#deptid").val();
        //模态框隐藏
        $("#update").modal('hide');
        //ajax做法
        $.ajax({
            type: "post",
            url: "/dept/update",
            data:{
                deptId:deptid,
                deptName:deptName
            },
            success:function (data) {
                location.href="/dept/listAll";
            }
        });
    });




    //添加操作
    function add() {
        //修改保存按钮的id值，因为添加和修改共用一个模态框
        var s=document.getElementById("save").value="insert"
        $("#deptid").val("");
        $("#deptid").prop("disabled", "disabled");
        $("#deptname").val("");
        $("#update").modal('show');

    }
    //添加操作
    $("#save").click(function () {
        //得到保存按钮修改的值
        var val=document.getElementById("save").value;
        if(val!="insert"){
            return;
        }
        //得到输入的值
        var deptname = $('#deptname').val();
        //模态框隐藏
        $("#update").modal('hide');
        //ajax做法
        $.ajax({
            type: "post",
            url: "/dept/insert",
            data:{
                deptName:deptname
            },
            success:function (data) {
                location.href="/dept/listAll";
            }
        });
    });
</script>

</body>
</html>
