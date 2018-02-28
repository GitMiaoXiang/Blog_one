<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>栏目全查页面</title>

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
<%--顶部页面--%>
<%@include file="top.jsp"%>
<div class="tpl-page-container tpl-page-header-fixed">
    <%@include file="left.jsp"%>
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            栏目添加
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
            <li><a href="#">数据库管理</a></li>
            <li class="am-active">栏目列表 </li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 列表
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">
                            <i class="am-icon-search"></i>
                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                    </div>
                </div>


            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span><a href="http://localhost:8081/managerblog/manager/category/category_findall.html?caid
" style="color: white"> 新增</a></button>
                                <%--<button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>--%>
                            </div>
                        </div>
                    </div>
                    <%--<div class="am-u-sm-12 am-u-md-3">
                        <div class="am-form-group">
                            <select data-am-selected="{btnSize: 'sm'}">
                                <option value="option1">所有类别</option>
                                <option value="option2">IT业界</option>
                                <option value="option3">数码产品</option>
                                <option value="option3">笔记本电脑</option>
                                <option value="option3">平板电脑</option>
                                <option value="option3">只能手机</option>
                                <option value="option3">超极本</option>
                            </select>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" class="am-form-field">
                            <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
                        </div>
                    </div>--%>
                </div>
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-check"><input type="checkbox" class="tpl-table-fz-check"></th>
                                    <th class="table-id">ID</th>
                                    <th class="table-title">栏目名称</th>
                                    <th>描述</th>
                                    <th class="table-author am-hide-sm-only">排序号</th>
                                    <th class="table-date am-hide-sm-only">链接地址</th>
                                    <th class="table-set">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${category.list}" var="category">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>${category.id}</td>
                                    <td><a href="#">${category.name}</a></td>
                                    <td class="am-hide-sm-only">${category.descz}</td>
                                    <td class="am-hide-sm-only">${category.sortz}</td>
                                    <td class="am-hide-sm-only">${category.hrefz}</td>
                                    <td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span><a href="http://localhost:8081/managerblog/manager/category/category_add.html?caid=${category.id}" style="color: blue">编辑</a></button>
                                                <%--<button class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 复制</button>--%>
                                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span><a onclick="deletecaid(${category.id})" style="color: red">删除</a></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="am-cf">

                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <c:if test="${category.hasPreviousPage}">
                                            <li<%--class="am-disabled"--%>><a href="http://localhost:8081/managerblog/manager/category/category_findall.html?page=${category.pageNum-1}">«</a></li>
                                        </c:if>
                                        <c:forEach items="${category.navigatepageNums}" var="pageNum">
                                            <c:if test="${pageNum==category.pageNum}">
                                                <li class="am-active"><a href="http://localhost:8081/managerblog/manager/category/category_findall.html?page=${pageNum}">${pageNum}</a></li>
                                            </c:if>
                                            <c:if test="${pageNum!=category.pageNum}">
                                                <li><a href="http://localhost:8081/managerblog/manager/category/category_findall.html?page=${pageNum}">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${category.hasNextPage}">
                                            <li><a href="http://localhost:8081/managerblog/manager/category/category_findall.html?page=${category.pageNum+1}">»</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            <hr>

                        </form>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function deletecaid(caid) {
        var url="http://localhost:8081/managerblog/manager/category/"+caid+"/delete";
        $.ajax({
            url:url,
            type:'delete',
            success:function (data) {
                alert(data.code);
            }
        })
    }
</script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
