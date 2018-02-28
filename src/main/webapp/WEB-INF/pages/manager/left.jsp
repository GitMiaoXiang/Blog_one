<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/11/8
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="tpl-left-nav tpl-left-nav-hover">
    <div class="tpl-left-nav-title">
        管理列表
    </div>
    <div class="tpl-left-nav-list">
        <ul class="tpl-left-nav-menu">
            <li class="tpl-left-nav-item">
                <a href="http://localhost:8081/managerblog/manager/mblog/index.html" class="nav-link active">
                    <i class="am-icon-home"></i>
                    <span>首页</span>
                </a>
            </li>
            <li class="tpl-left-nav-item">
                <a href="http://localhost:8081/managerblog/manager/comment/comment_findall.html" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-wpforms"></i>
                    <span>新评论</span>
                    <i class="tpl-left-nav-content tpl-badge-danger">
                        ${cmtcount}
                    </i>
                </a>
            </li>
            <li class="tpl-left-nav-item">
                <a href="http://localhost:8081/managerblog/manager/message/message_findall.html" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-wpforms"></i>
                    <span>未读留言</span>
                    <i class="tpl-left-nav-content tpl-badge-danger">
                        ${msgcount}
                    </i>
                </a>
            </li>

            <li class="tpl-left-nav-item">
                <!-- 打开状态 a 标签添加 active 即可   -->
                <a href="javascript:;" class="nav-link tpl-left-nav-link-list active">
                    <i class="am-icon-table"></i>
                    <span>博客数据管理</span>
                    <!-- 列表打开状态的i标签添加 tpl-left-nav-more-ico-rotate 图表即90°旋转  -->
                    <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                </a>
                <ul class="tpl-left-nav-sub-menu" style="display:block">
                    <li>

                        <a href="http://localhost:8081/managerblog/manager/manager/2/manager_findall.html">
                            <i class="am-icon-angle-right"></i>
                            <span>管理员</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/article/0/article_findall.html">
                            <i class="am-icon-angle-right"></i>
                            <span>文章</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/category/category_findall.html?caid">
                            <i class="am-icon-angle-right"></i>
                            <span>栏目</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/user/user_findall.html?page">
                            <i class="am-icon-angle-right"></i>
                            <span>用户</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/images/images_findall.html?page">
                            <i class="am-icon-angle-right"></i>
                            <span>摄影</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/tag/tag_findall.html">
                            <i class="am-icon-angle-right"></i>
                            <span>Tags</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>

                        <%--    <!-- 打开状态 a 标签添加 active 即可   -->
                        <a href="form-news.html" class="active">
                                <i class="am-icon-angle-right"></i>
                                <span>摄影</span>
                                <i class="tpl-left-nav-content tpl-badge-primary">
                                    5
                                </i>
                        </a>
                        <a href="table-font-list.html">
                            <i class="am-icon-angle-right"></i>
                            <span>Tag</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="form-news-list.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>用户</span>

                        </a>--%>
                    </li>
                </ul>
            </li>

            <li class="tpl-left-nav-item">
                <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-wpforms"></i>
                    <span>博客数据添加</span>
                    <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                </a>
                <ul class="tpl-left-nav-sub-menu">
                    <li>
                        <a href="http://localhost:8081/managerblog/manager/article/article_add.html?articleid=0">
                            <i class="am-icon-angle-right"></i>
                            <span>博文添加</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/category/category_add.html">
                            <i class="am-icon-angle-right"></i>
                            <span>栏目添加</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/images/images_add.html">
                            <i class="am-icon-angle-right"></i>
                            <span>图片添加</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <a href="http://localhost:8081/managerblog/manager/manager/manager_add.html">
                            <i class="am-icon-angle-right"></i>
                            <span>管理员添加</span>
                            <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                        </a>
                        <%--<a href="form-line.html">
                            <i class="am-icon-angle-right"></i>
                            <span>线条表单</span>
                        </a>--%>
                    </li>
                </ul>
            </li>

            <li class="tpl-left-nav-item">
                <a href="http://localhost:8081/managerblog/manager/mblog/loginout" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-key"></i>
                    <span>登录</span>

                </a>
            </li>
        </ul>
    </div>
</div>
<script src="<%=path%>assets/js/jquery.min.js"></script>
<script src="<%=path%>assets/js/amazeui.min.js"></script>
<script src="<%=path%>assets/js/app.js"></script>
</body>
</html>
