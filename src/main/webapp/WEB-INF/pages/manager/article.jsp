<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/11/9
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博文全查页面</title>

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
            Amaze UI 文字列表
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
            <li><a href="#">Amaze UI CSS</a></li>
            <li class="am-active">文字列表</li>
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
                    <%--<div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
                                <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
                            </div>
                        </div>
                    </div>--%>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-form-group">
                            <select data-am-selected="{btnSize: 'sm'}" name="category" id="category" onchange="querybycaid()">
                                <c:if test="${canumber==0}">
                                    <option value="0" selected>全部</option>
                                </c:if>
                                <c:if test="${canumber!=0}">
                                    <option value="0">全部</option>
                                </c:if>
                                <c:forEach items="${category}" var="category">
                                    <c:if test="${canumber==category.id}">
                                        <option value="${category.id}" selected>${category.name}</option>
                                    </c:if>
                                    <c:if test="${canumber!=category.id}">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:if>
                                   </c:forEach>
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
                    </div>
                </div>
                <div class="am-g">
                    <div class="tpl-table-images">
                        <c:forEach items="${article.list}" var="article">
                        <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">

                            <div class="tpl-table-images-content">
                                <div class="tpl-table-images-content-i-time">发布时间：<fmt:formatDate value="${article.updatedate}" type="both"></fmt:formatDate></div>
                                <div class="tpl-i-title">
                                    ${article.title}
                                </div>
                                <a href="javascript:;" class="tpl-table-images-content-i">
                                    <div class="tpl-table-images-content-i-info">
                                            <span class="ico">
                                    <img src="<%=path%>assets/img/user02.png" alt="">追逐
                                 </span>

                                    </div>
                                    <span class="tpl-table-images-content-i-shadow"></span>
                                    <img src="${article.src}" style="width: 435px;height: 313px" alt="">
                                </a>
                                <div class="tpl-table-images-content-block">
                                    <div class="tpl-i-font">
                                        ${article.descz}
                                    </div>
                                    <div class="tpl-i-more">
                                        <ul>
                                            <li><span class="am-icon-qq am-text-warning"> 评论：${article.count}</span></li>
                                            <li><span class="am-icon-weixin am-text-success">评论回复数：${article.count+cmtcount}</span></li>
                                            <li><span class="am-icon-github font-green"> 阅读数：600</span></li>
                                        </ul>
                                    </div>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs tpl-edit-content-btn">
                                            <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span><a href="http://localhost:8081/managerblog/manager/article/article_add.html?articleid=0" style="color: white"> 新增</a></button>
                                            <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-edit"></span><a href="http://localhost:8081/managerblog/manager/article/article_add.html?articleid=${article.id}" style="color: white"> 编辑</a></button>
                                            <c:if test="${article.isrecommend==0}">
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span><a onclick="zhiding(${article.id},1)" style="color: white"> 置顶</a></button>
                                            </c:if>
                                            <c:if test="${article.isrecommend==1}">
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span><a onclick="zhiding(${article.id},0)" style="color: white"> 取消置顶</a></button>
                                            </c:if>
                                            <c:if test="${article.updownframe==0||article.updownframe==null}">
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span><a onclick="updown(${article.id},1)" style="color: white"> 上架</a></button>
                                            </c:if>
                                            <c:if test="${article.updownframe==1}">
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span><a onclick="updown(${article.id},0)" style="color: white"> 下架</a></button>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        </c:forEach>
                        <div class="am-u-lg-12">
                            <div class="am-cf">

                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                       <c:if test="${article.hasPreviousPage}">
                                        <li<%--class="am-disabled"--%>><a href="http://localhost:8081/managerblog/manager/article/${canumber}/article_findall.html?page=${article.pageNum-1}">«</a></li>
                                       </c:if>
                                        <c:forEach items="${article.navigatepageNums}" var="pageNum">
                                            <c:if test="${pageNum==article.pageNum}">
                                                <li class="am-active"><a href="http://localhost:8081/managerblog/manager/article/${canumber}/article_findall.html?page=${pageNum}">${pageNum}</a></li>
                                            </c:if>
                                            <c:if test="${pageNum!=article.pageNum}">
                                                <li><a href="http://localhost:8081/managerblog/manager/article/${canumber}/article_findall.html?page=${pageNum}">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${article.hasNextPage}">
                                        <li><a href="http://localhost:8081/managerblog/manager/article/${canumber}/article_findall.html?page=${article.pageNum+1}">»</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            <hr>
                        </div>

                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    /**
     * 分类查询
     */
    function querybycaid() {
        var category=$("#category").val();
        window.location.href="http://localhost:8081/managerblog/manager/article/"+category+"/article_findall.html?page=${num}"
    }

    /**
     * 置顶，上架
     */
    function zhiding(arid,isrecommend) {
        var url="http://localhost:8081/managerblog/manager/article/"+isrecommend+"/"+arid+"/zhiding/";
        $.ajax({
            url:url,
            type:'put',
            success:function (data) {
                alert(data.code);
            }
        })
    }
    /**
     * 上架或下架
     */
    function updown(arid,updown) {
        var url="http://localhost:8081/managerblog/manager/article/"+updown+"/"+arid+"/updowm/";
        $.ajax({
            url:url,
            type:'put',
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
