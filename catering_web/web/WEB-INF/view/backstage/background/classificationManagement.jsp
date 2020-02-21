<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2020/1/1
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="/static/backstage/css/reset.css" rel="stylesheet" />
    <link href="/static/backstage/css/iconfont.css" rel="stylesheet" />
    <link href="/static/backstage/css/index.css" rel="stylesheet" />
    <script src="/static/js/jquery-3.3.1.js"></script>
    <script src="/static/backstage/js/f.js"></script>
    <title>分类管理</title>
</head>
<body>
<div class="PublicHead clearfix">
    <div class="leftBox clearfix">
        <div class="companyLogo">
            <img src="/static/backstage/images/logo.jpg" />
        </div>
        <!--<i class="iconfont icon-caidan Js_MenuList"></i>-->

        <div class="companyText">
            海底捞后台管理
        </div>
    </div>
    <div class="RightBox clearfix">
        <div class="UserPhotoBox">
            <div class="UserPic">
                <img src="/static/backstage/images/user.jpg" />
            </div>
            <div class="UserName">
                管理员
            </div>
        </div>
        <a href="index.html">
            <div class="dropOutBox">
                <i class="iconfont icon-app_icons--">
                </i>
                <span>退出</span>
            </div>
        </a>
    </div>
</div>

<div class="PublicDownWhole clearfix">
    <!--左侧-->
    <div class="leftBox Js_leftBox">
        <ul>
            <a href="UserManagement.html"> <li><i class="iconfont icon-yonghuguanli"></i><span>用户管理</span></li></a>
            <a href="OrderManagement.html">
                <li><i class="iconfont icon-tubiao_dingdan"></i><span>订单管理</span></li>
            </a>
            <a href="ClassificationManagement.html">
                <li class="Select"><i class="iconfont icon-fenlei"></i><span>分类管理</span></li>
            </a>
            <a href="ProductManagement.html">      <li><i class="iconfont icon-weibiaoti1"></i><span>产品管理</span></li></a>
        </ul>
    </div>
    <!--右侧-->
    <div class="RightBox Js_RightBox">
        <div class="PublicContentBox">
            <!--公用指向页面名字-->
            <div class="PublicPointToAgeText">
                <span class="span1">分类管理 </span> <span class="span2">后台分类管理列表</span>
            </div>
            <!--查询-->
            <!--<div class="InquireBox clearfix">
                <div class="InquireleftBox">
                    <div class="Text">手机号：</div>
                    <div class="InputDiv">   <input class="phoneInput" placeholder="请输入你需要查询的手机号" /></div>
                </div>
                <div class="PublicBtnIcon Color1Btn fr">
                    <i class="iconfont icon-icon-chaxun"></i>
                    <span>查询</span>
                </div>
            </div>-->
            <!--表修改-->
            <div class="InquireTableBox">
                <div class="headbox">
                    <div class="headboxtext">
                        <span class="span1">后台分类管理列表</span>
                    </div>
                    <!--批量删除-->
                    <div class="PublicBtnIcon Color5Btn">
                        <i class="iconfont  icon-shanchu"></i>
                        <span>批量删除</span>
                    </div>

                    <div class="PublicBtnIcon Color2Btn fr Js_edit">
                        <i class="iconfont icon-changyongtubiao-mianxing-"></i>
                        <span>添加</span>
                    </div>
                </div>

                <!--查询到的表格-->

                <div class="InquireSelectTable">
                    <table class="PublicTableCss">
                        <thead>
                        <tr>
                            <td>
                                <input id="inputcheck" class="inputcheck" type="checkbox" name="inputcheck" />
                                <label for="inputcheck"></label>
                                <span>全选</span>
                            </td>
                            <td>ID</td>
                            <td>分类名称</td>
                            <td>操作</td>
                        </tr>

                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <input id="aa" class="inputcheck" type="checkbox" name="inputcheck" />
                                <label for="aa"></label>
                            </td>
                            <td>1</td>
                            <td>电视机</td>
                            <td>

                                <div class="PublicTableBtnIcon Color3Btn Js_edit">
                                    <i class="iconfont icon-tubiaozhizuomobanyihuifu-"></i>
                                    <span>编辑</span>
                                </div>

                                <div class="PublicTableBtnIcon Color4Btn Js_delete">
                                    <i class="iconfont icon-shanchu"></i>
                                    <span>删除</span>
                                </div>
                            </td>
                        </tr>



                        </tbody>
                    </table>

                </div>
                <!--分页-->
                <div class="PageNumber">
                    <div class="NumbersBox">
                        <div class="LeftArrow">
                            上一页
                        </div>
                        <ul>
                            <li class="Select">1</li>
                            <li class="">2</li>
                            <li class="">...</li>
                            <li class="">4</li>
                            <li class="">5</li>
                        </ul>
                        <div class="RightArrow ">
                            下一页
                        </div>
                    </div>
                </div>


            </div>
        </div>

    </div>
</div>


<!-- alert通用 提示是否删除-->
<div class="PublicFloatBox f_delete">
    <div class="f_MiddleBox wid260">
        <div class="f_Head">
            <span>提示消息</span>
            <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
        </div>
        <div class="f_content clearfix">
            <!--提示消息内容-->
            <div class="f_someText">
                <i class="iconfont icon-tishi"></i>
                <span>确定删除此信息？</span>
            </div>
            <!--按钮-->
            <div class="f_pormatBtn  clearfix">
                <div class="f_pormatBtn1">
                    确定
                </div>
                <div class="f_pormatBtn2">
                    删除
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加用户浮层-->
<div class="PublicFloatBox adduser">
    <div class="f_MiddleBox wid400">
        <div class="f_Head">
            <span>添加分类</span>
            <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
        </div>
        <div class="f_content">
            <div class="f_alonediv">
                <div class="f_alone_name">
                    ID:
                </div>
                <div class="f_alone_input">
                    <input class="f_p_input" />
                </div>
                <!--提示消息-->
                <div class="f_pormat">
                    请输入正确的ID
                </div>
            </div>
            <div class="f_alonediv">
                <div class="f_alone_name">
                    添加分类:
                </div>
                <div class="f_alone_input">
                    <input class="f_p_input" />
                </div>
                <!--提示消息-->
                <div class="f_pormat">
                    请输入正确的分类
                </div>
            </div>
            <div class="f_alonediv1">
                <div class="f_alone_name">
                </div>
                <div class="f_alone_input1">
                    <!--publicbtn-->
                    <div class="publicf_btn">
                        <div class="publicf_btn1">
                            确定
                        </div>
                        <div class="publicf_btn2 fr Js_closeBtn">
                            取消
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!--返回顶部-->
<a href="javaScript:void();" class="back-to-top"><i class="iconfont icon-fanhuidingbu"></i> </a>
</body>
</html>
