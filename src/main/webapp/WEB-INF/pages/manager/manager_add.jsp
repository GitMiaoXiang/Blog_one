<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/11/8
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博文添加</title>
    <%
        //String path1="项目名："+request.getContextPath()+"url:"+request.getRequestURI()+"scheme:"+request.getScheme()+"servername"+request.getServerName()+"port"+request.getServerPort();
        String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    %>
    <link rel="icon" type="image/png" href="<%=path%>assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path%>assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=path%>assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path%>assets/css/admin.css">
    <link rel="stylesheet" href="<%=path%>assets/css/app.css">
</head>
<body data-type="generalComponents">
<%@include file="top.jsp"%>
<div class="tpl-page-container tpl-page-header-fixed">
    <%@include file="left.jsp"%>
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            博文添加
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
            <li><a href="#">博客数据添加</a></li>
            <li class="am-active">博文添加</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 表单
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">
                            <i class="am-icon-search"></i>
                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                    </div>
                </div>


            </div>
            <div class="tpl-block ">

                <div class="am-g tpl-amazeui-form">


                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal" id="managerform">
                            <div class="am-form-group">
                                <label for="name" class="am-u-sm-3 am-form-label">姓名</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="name" name="name" placeholder="姓名">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="name" class="am-u-sm-3 am-form-label">密码</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="pwd" name="pwd" placeholder="密码">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="status" class="am-u-sm-3 am-form-label" style="margin-left: 17px">是否激活</label>
                                <div class="am-form-group">
                                    <select data-am-selected="{btnSize: 'sm'}" name="status" id="status">
                                        <option value="1" selected>是</option>
                                        <option value="0">否</option>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="button" id="savamanager" class="am-btn am-btn-primary">保存修改</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#savamanager").click(function () {
        var manager=new FormData(document.getElementById("managerform"));
        $.ajax({
            url:'http://localhost:8081/managerblog/manager/manager/savemanager',
            type:'post',
            data:manager,
            processData:false,
            contentType:false,
            success:function (data) {
                alert(data.code);
            }
        })
    })
</script>
</body>
</html>
