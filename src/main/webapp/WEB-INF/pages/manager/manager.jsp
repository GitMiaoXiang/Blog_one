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
    <title>管理员全查页面</title>

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
            管理员添加
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
            <li><a href="#">数据库管理</a></li>
            <li class="am-active">管理员列表 </li>
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
                                <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span><a href="http://localhost:8081/managerblog/manager/manager/manager_add.html"  style="color: white"> 新增</a></button>
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
                    </div>--%>
                    <%--<div class="am-u-sm-12 am-u-md-3">
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
                                    <th class="table-title">账号</th>
                                    <th class="table-type">密码</th>
                                    <th class="table-author am-hide-sm-only">
                                    <select data-am-selected="{btnSize: 'sm'}" onchange="changestatus()" id="managerstatus">
                                            <option value="2">全部</option>
                                            <option value="1">已激活</option>
                                            <option value="0">未激活</option>
                                    </select>
                                    </th>
                                    <th class="table-date am-hide-sm-only">最后登录日期</th>
                                    <%--<th class="table-set">操作</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${manager.list}" var="manager">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>1</td>
                                    <td><a href="#">${manager.name}</a></td>
                                    <td>${manager.pwd}</td>
                                    <td class="am-hide-sm-only">${manager.status}</td>
                                    <td class="am-hide-sm-only"><fmt:formatDate value="${manager.lastlogin}" type="both"/></td>
                                    <%--<td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>
                                            </div>
                                        </div>
                                    </td>--%>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="am-cf">

                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <c:if test="${manager.hasPreviousPage}">
                                            <li<%--class="am-disabled"--%>><a href="http://localhost:8081/managerblog/manager/manager/${status}/manager_findall.html?page=${manager.pageNum-1}">«</a></li>
                                        </c:if>
                                        <c:forEach items="${manager.navigatepageNums}" var="pageNum">
                                            <c:if test="${pageNum==manager.pageNum}">
                                                <li class="am-active"><a href="http://localhost:8081/managerblog/manager/manager/${status}/manager_findall.html?page=${pageNum}">${pageNum}</a></li>
                                            </c:if>
                                            <c:if test="${pageNum!=manager.pageNum}">
                                                <li><a href="http://localhost:8081/managerblog/manager/manager/${status}/manager_findall.html?page=${pageNum}">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${manager.hasNextPage}">
                                            <li><a href="http://localhost:8081/managerblog/manager/manager/${status}/manager_findall.html?page=${manager.pageNum+1}">»</a></li>
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
    function changestatus() {
       var status=$("#managerstatus").val();
       window.location.href="http://localhost:8081/managerblog/manager/manager/"+status+"/manager_findall.html";
    }
</script>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
