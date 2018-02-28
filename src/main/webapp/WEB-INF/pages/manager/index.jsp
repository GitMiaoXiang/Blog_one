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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="首页">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <%
        //String path1="项目名："+request.getContextPath()+"url:"+request.getRequestURI()+"scheme:"+request.getScheme()+"servername"+request.getServerName()+"port"+request.getServerPort();
        String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    %>
    <link rel="icon" type="image/png" href="<%=path%>assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path%>assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="<%=path%>assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=path%>assets/css/admin.css">
    <link rel="stylesheet" href="<%=path%>assets/css/app.css">

</head>
<body data-type="generalComponents">
<%--头部--%>
<%@include file="top.jsp" %>
<div class="tpl-page-container tpl-page-header-fixed">
        <%@include file="left.jsp" %>
        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                Sir.鹿 博客后台首页
            </div>
            <ol class="am-breadcrumb">
                <li><a href="#" class="am-icon-home">首页</a></li>
                <li><a href="#">表单</a></li>
                <li class="am-active">Amaze UI 表单</li>
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
                                <input type="text" class="form-control form-control-solid" placeholder="搜索..."></div>
                        </div>
                    </div>


                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-success"><span
                                            class="am-icon-plus"></span> 新增
                                    </button>
                                    <button type="button" class="am-btn am-btn-default am-btn-secondary"><span
                                            class="am-icon-save"></span> 保存
                                    </button>
                                    <button type="button" class="am-btn am-btn-default am-btn-warning"><span
                                            class="am-icon-archive"></span> 审核
                                    </button>
                                    <button type="button" class="am-btn am-btn-default am-btn-danger"><span
                                            class="am-icon-trash-o"></span> 删除
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="am-u-sm-12 am-u-md-3">
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
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search"
                    type="button"></button>
          </span>
                            </div>
                        </div>
                    </div>

                    <ul class="tpl-task-list tpl-task-remind">
                        <li>
                            <div class="cosB">
                                12分钟前
                            </div>
                            <div class="cosA">
                                <span class="cosIco">
                        <i class="am-icon-bell-o"></i>
                      </span>

                                <span> 注意：Chrome 和 Firefox 下， display: inline-block; 或 display: block; 的元素才会应用旋转动画。<span
                                        class="tpl-label-info"> 提取文件
                                                            <i class="am-icon-share"></i>
                                                        </span></span>
                            </div>

                        </li>
                        <li>
                            <div class="cosB">
                                36分钟前
                            </div>
                            <div class="cosA">
                                <span class="cosIco label-danger">
                        <i class="am-icon-bolt"></i>
                      </span>

                                <span> FontAwesome 在绘制图标的时候不同图标宽度有差异， 添加 .am-icon-fw 将图标设置为固定的宽度，解决宽度不一致问题（v2.3 新增）。</span>
                            </div>

                        </li>

                        <li>
                            <div class="cosB">
                                2小时前
                            </div>
                            <div class="cosA">
                                <span class="cosIco label-info">
                        <i class="am-icon-bullhorn"></i>
                      </span>

                                <span> 使用 flexbox 实现，只兼容 IE 10+ 及其他现代浏览器。</span>
                            </div>

                        </li>
                        <li>
                            <div class="cosB">
                                1天前
                            </div>
                            <div class="cosA">
                                <span class="cosIco label-warning">
                        <i class="am-icon-plus"></i>
                      </span>

                                <span> 部分用户反应在过长的 Tabs 中滚动页面时会意外触发 Tab 切换事件，用户可以选择禁用触控操作。</span>
                            </div>

                        </li>
                        <li>
                            <div class="cosB">
                                12分钟前
                            </div>
                            <div class="cosA">
                                <span class="cosIco">
                        <i class="am-icon-bell-o"></i>
                      </span>

                                <span> 注意：Chrome 和 Firefox 下， display: inline-block; 或 display: block; 的元素才会应用旋转动画。<span
                                        class="tpl-label-info"> 提取文件
                                                            <i class="am-icon-share"></i>
                                                        </span></span>
                            </div>

                        </li>
                        <li>
                            <div class="cosB">
                                36分钟前
                            </div>
                            <div class="cosA">
                                <span class="cosIco label-danger">
                        <i class="am-icon-bolt"></i>
                      </span>
                                <span> FontAwesome 在绘制图标的时候不同图标宽度有差异， 添加 .am-icon-fw 将图标设置为固定的宽度，解决宽度不一致问题（v2.3 新增）。</span>
                            </div>
                        </li>

                        <li>
                            <div class="cosB">
                                2小时前
                            </div>
                            <div class="cosA">
                                <span class="cosIco label-info">
                        <i class="am-icon-bullhorn"></i>
                      </span>
                                <span> 使用 flexbox 实现，只兼容 IE 10+ 及其他现代浏览器。</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</div>
</body>
</html>
