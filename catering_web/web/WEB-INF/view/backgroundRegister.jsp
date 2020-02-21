<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/16
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>注册</title>
    <link href="/static/css/registerCss/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/registerCss/a3common.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/registerCss/font_43459_lbtux0zjkr6yldi.css">
    <link rel="stylesheet" href="/static/css/registerCss/register.css">
</head>
<body>
<div id="main" class="main-warp" style="background:url('/static/images/bg.jpg');height:1000px;">
    <div class="main-content">
        <div class="formDiv">
            <h2 class="title text-center">注册</h2>
            <form id="registerForm" roleEntity="form" class="form-horizontal " action="/background/register-Manager" method="post">
                <div class="form-item">
                    <div class="input-warp">
                        <span class="input-icon iconfont icon-yonghu1"></span><input type="text" id="mName" name="mName" placeholder="姓名" autofocus="autofocus"  onBlur="checkna()" class="inputs" />
                        <span class="tips" id="divname">长度1~6个字符</span>
                    </div>
                    <p></p>
                </div>

                <div class="form-item">
                    <div class="input-warp">
                        <span class="input-icon iconfont icon-yonghu1"></span>
                        <input type="text" id="mPhone" name="mPhone" placeholder="手机号码"  onBlur="checkpsd1()" class="inputs" />
                        <span class="tips" id="phone">必须是11位的数字</span>
                    </div>
                    <p></p>
                </div>

                <div class="form-item">
                    <div class="input-warp">
                        <span class="input-icon iconfont icon-yonghu1"></span><input id="mUsername" name="mUsername" placeholder="用户名" type="text" class="inputs" />
                    </div>
                    <p></p>
                </div>
                <div class="form-item">
                    <div class="input-warp">
                        <span class="input-icon iconfont icon-baomi"></span>
                        <input id="pwd" type="password" placeholder="至少6位字母或数字" maxlength="20" name="mPassword"
                               class="inputs"/>
                    </div>
                    <p></p>
                </div>
                <div class="form-item">
                    <div class="input-warp">
                        <span class="input-icon iconfont icon-youxiangbangding"></span><input id="repassword" name="repassword" placeholder="重新输入密码" type="text" class="inputs" data-validate="required:请再次输入新密码,repeat#mPassword:两次输入的密码不一致" />
                    </div>
                    <p></p>
                </div>
                <div class="btn-warp">
                    <div class="text-center">
                        <button type="submit" id="btnSubmit"  class="btn lgbtn blue btn-block">注册</button>
                        <input id="appName" name="appName" type="hidden" value="jsform"/>
                    </div>
                </div>
                <div class="agreement gap">
                    <div class="text-right">
                        <div class="pull-left">已有账号，<a href="/background/login" class="link">登录</a></div><p>注册即代表您已阅读并同意《<a href="javascript:;" target="_blank" class="link">使用协议</a>》</p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    //验证姓名
    function checkna(){
        var na=$("#mName").val();
        if( na.length <1 || na.length >6){
            divname.innerHTML='<font class="tips_false">长度是1~6个字符</font>';
        }else{
            divname.innerHTML='<font class="tips_true">输入正确</font>';
        }
    }
    //验证手机号码
    function checkpsd1(){
        var na=$("#mPhone").val();
        if( na.length <11 || na.length >11){
            phone.innerHTML='<p style="color: red">必须是11位的数字</p>';
        }else{
            phone.innerHTML='<p style="color: green">输入正确</font>';
        }
    }
</script>
</body>
</html>
