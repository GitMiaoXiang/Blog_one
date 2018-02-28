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
    <script type="text/javascript" src="<%=path%>jquery/jquery-3.2.1.min.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="<%=path%>ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=path%>ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
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
                        <form class="am-form am-form-horizontal" id="formarticle">
                            <div class="am-form-group">
                                <label for="title" class="am-u-sm-3 am-form-label">标题</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="title" name="title" value="${article.title}" placeholder="标题">
<%--                                    <small>输入你的名字，让我们记住你。</small>--%>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="descz" class="am-u-sm-3 am-form-label">描述</label>
                                <div class="am-u-sm-9">
                                    <textarea id="descz" name="descz" placeholder="描述">${article.descz}</textarea>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="container" class="am-u-sm-3 am-form-label">内容</label>
                                <div class="am-u-sm-9">
                                    <script id="container" name="content" type="text/plain">${article.content}</script>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="images" class="am-u-sm-3 am-form-label">缩略图</label>
                                <div class="am-u-sm-9">
                                    <div class="am-form-group am-form-file">
                                        <div class="tpl-form-file-img">
                                            <c:if test="${article.src!=null}">
                                                <img id="show" alt="" src="${article.src}">
                                            </c:if>
                                            <c:if test="${article.src==null}">
                                                <img id="show" alt="">
                                            </c:if>
                                        </div>
                                        <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                            <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                        <input id="doc-form-file" type="file" name="images" onchange="c()"; multiple>
                                    </div>
                                    <div id="file-list"></div>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="isrecommend" class="am-u-sm-3 am-form-label" style="margin-left: 17px">分类</label>
                                <div class="am-form-group">
                                    <select data-am-selected="{btnSize: 'sm'}" name="category" id="category">
                                        <c:forEach items="${category}" var="category">
                                            <c:if test="${category.id==article.category}">
                                                <option value="${article.category}" selected>${category.name}</option>
                                            </c:if>
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="am-form-group">
                            <label for="isrecommend" class="am-u-sm-3 am-form-label" style="margin-left: 17px">置顶文章</label>
                            <div class="am-form-group">
                                <select data-am-selected="{btnSize: 'sm'}" name="isrecommend" id="isrecommend">
                                    <c:if test="${article.isrecommend==0||article.isrecommend==null}">
                                        <option value="1">是</option>
                                        <option value="0" selected>否</option>
                                    </c:if>
                                    <c:if test="${article.isrecommend==1}">
                                        <option value="1" selected>是</option>
                                        <option value="0">否</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>

                            <div class="am-form-group">
                                <label for="tags" class="am-u-sm-3 am-form-label">标签</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="tags" name="tags" value="${article.tags}" placeholder="标签">
                                    <small>如果有多个标签，请逗号分隔，。</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <input type="hidden" value="${article.id}" name="id">
                                    <button type="button" id="savearticle" class="am-btn am-btn-primary">保存修改</button>
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
    /**
     * 实例化文本编辑器
     */
    var editor = UE.getEditor('container');
    /**
     * 显示缩略图
     */
        function c () {
            var r= new FileReader();
            f=document.getElementById('doc-form-file').files[0];
            r.readAsDataURL(f);
            r.onload=function  (e) {
                document.getElementById('show').src=this.result;
            };
        }

    /**
     * 添加博文，上传图片
     */
    $("#savearticle").click(function () {
        var article=$("#formarticle").serialize()+UE.getEditor('container').getContent();
        var form=new FormData(document.getElementById("formarticle"));
        $.ajax({
            url:'http://localhost:8081/managerblog/manager/article/save',
            type:'post',
            data:form,
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
