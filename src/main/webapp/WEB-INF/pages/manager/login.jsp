<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/11/8
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>博客后台管理系统登录界面</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <%
        //String path1="项目名："+request.getContextPath()+"url:"+request.getRequestURI()+"scheme:"+request.getScheme()+"servername"+request.getServerName()+"port"+request.getServerPort();
        String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    %>
    <link rel="icon" type="image/png" href="<%=path%>assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path%>assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script type="text/javascript" src="<%=path%>jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="<%=path%>assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path%>assets/css/admin.css">
    <link rel="stylesheet" href="<%=path%>assets/css/app.css">
</head>
<body data-type="login">

<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                Sir.鹿 博客管理系统<span> 登录</span> <i class="am-icon-skyatlas"></i>

            </div>
        </div>

        <div class="login-font">
            <i>Log In </i> or <span> Sign Up</span>
        </div>
        <div class="am-u-sm-10 login-am-center">
            <form class="am-form" id="loginform">
                <fieldset>
                    <div class="am-form-group">
                        <input type="email" class="" name="name" placeholder="输入用户名">
                    </div>
                    <div class="am-form-group">
                        <input type="password" name="pwd" id="doc-ipt-pwd-1" placeholder="输入密码">
                    </div>
                    <p><button type="submit" id="login" class="am-btn am-btn-default">登录</button></p>
                </fieldset>
            </form>
        </div>
    </div>
</div>


<script src="<%=path%>assets/js/jquery.min.js"></script>
<script src="<%=path%>assets/js/amazeui.min.js"></script>
<script src="<%=path%>assets/js/app.js"></script>
<script type="text/javascript">
    $("#login").click(function () {
        $.ajax({
            url:'http://localhost:8081/managerblog/manager/mblog/login',
            type:'post',
            data:$("#loginform").serialize(),
            success:function (data) {
                if(data.code==100){
                    alert("登录成功");
                    window.location.href="http://localhost:8081/managerblog/manager/mblog/index.html";
                }
                else{
                    alert("用户名或密码错误");
                }
            }
        })
    })

</script>
</body>
</html>
