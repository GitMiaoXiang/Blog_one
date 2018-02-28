<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>栏目添加</title>
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
            栏目添加
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
            <li><a href="#">栏目数据添加</a></li>
            <li class="am-active">栏目添加</li>
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
                        <form class="am-form am-form-horizontal" id="categoryform">
                            <div class="am-form-group">
                                <label for="name" class="am-u-sm-3 am-form-label">栏目名</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="name" name="name" value="${category.name}" placeholder="栏目名">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="descz" class="am-u-sm-3 am-form-label">描述</label>
                                <div class="am-u-sm-9">
                                    <textarea class="" rows="5" id="descz" name="descz" placeholder="描述">${category.descz}</textarea>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="indexz" class="am-u-sm-3 am-form-label" style="margin-left: 17px">菜单设置</label>
                                <div class="am-form-group">
                                    <select data-am-selected="{btnSize: 'sm'}" name="indexz" id="indexz">
                                        <c:choose>
                                            <c:when test="${category.indexz==3}">
                                                <option value="3" selected>栏目</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="3">栏目</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${category.indexz==0}">
                                                <option value="0"selected>导航栏</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="0">导航栏</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>


                            <div class="am-form-group">
                                <label for="sortz" class="am-u-sm-3 am-form-label">排序值</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="sortz" name="sortz" value="${category.sortz}" placeholder="排序值">
                                    <small>目前排序值:11</small>
                                </div>
                            </div>



                            <div class="am-form-group">
                                <label for="sortz" class="am-u-sm-3 am-form-label">链接</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="hrefz" name="hrefz" value="${category.hrefz}" placeholder="链接">
                                    <small>如：http://localhost:8081/managerblog/manager/index.html?caid=7</small>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <input type="hidden" value="${category.id}" name="id">
                                    <button type="button" id="savecategory" class="am-btn am-btn-primary">保存修改</button>
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
    $("#savecategory").click(function () {
        $.ajax({
            url:'http://localhost:8081/managerblog/manager/category/savecategory',
            type:'post',
            data:$("#categoryform").serialize(),
            success:function (data) {
                alert(data.code);
            }
        })
    })
</script>
</body>
</html>
