<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="am-modal am-modal-prompt" tabindex="-1" id="your-modal">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">回复框</div>
            <div class="am-modal-bd">
                <input type="text" class="am-modal-prompt-input">
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>回复</span>
            </div>
        </div>
    </div>
<%@include file="top.jsp"%>
<div class="tpl-page-container tpl-page-header-fixed">
<%@include file="left.jsp"%>
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            最新留言
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
            <li><a href="#">未读留言</a></li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 未读留言
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
                                <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
                                <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
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
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" class="am-form-field">
                            <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
                        </div>
                    </div>
                </div>

                    <div class="am-panel-group" id="accordion">
                       <c:forEach items="${message}" var="message">
                        <div class="am-panel am-panel-default" style="margin-top: 15px;">
                            <div class="am-panel-hd" style="font-size: 13px;">
                                <p class="am-panel-title" data-am-collapse="{parent: '#accordion', target: '#do-not-say-1'}">
                                    <c:if test="${message.status=='0'}">
                                        <img src="<%=path%>img/yidu.png" style="padding-right: 30px;">
                                    </c:if>
                                    <c:if test="${message.status=='1'}">
                                        <img src="<%=path%>img/weidu.png" style="padding-right: 30px;">
                                    </c:if>
                                        ${message.content}
                                    <span class="am-fr" style="padding-left: 50px; margin-top: 1px">${message.formtdate}</span>
                                    <span class="tpl-label-info am-fr js-modal-open am-btn am-btn-primary" style="margin-top: 1px" onclick="openmodel(${message.userid},${message.id})"> 回复
                                        <i class=" am-icon-share"></i>
                                    </span>
                                </p>
                            </div>
                            <c:if test="${message.msgreplie==null}">
                                <div id="do-not-say-1" class="am-panel-collapse am-collapse am-in" style="font-size: 13px;">
                                    <div class="am-panel-bd">
                                            还没有回复哦！
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${message.msgreplie!=null}">
                            <div id="do-not-say-1" class="am-panel-collapse am-collapse am-in" style="font-size: 13px;">
                                <c:forEach items="${message.msgreplie}" var="msgrepaly">
                                <div class="am-panel-bd">
                                    ${msgrepaly.content}
                                    <span class="am-fr" style="padding-left: 50px; margin-top: 1px">${msgrepaly.fonttime}</span>
                                </div>
                                </c:forEach>
                            </div>
                            </c:if>
                        </div>
                       </c:forEach>
                    </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    /**
     * 弹出回复对话框
     */

    function openmodel(userid,id){
        $('#your-modal').modal({
            relatedTarget: this,
            onConfirm: function(e) {
                var msgrepalycontent="userid="+userid+"&messageid="+id+"&content="+e.data+"";
                $.ajax({
                    url:'http://localhost:8081/managerblog/manager/message/sendmsgmanager',
                    type:'post',
                    data:msgrepalycontent,
                    success:function (data) {
                        if(data.code==100){
                            alert("回复成功！");
                        }
                    }
                })
               // alert('你输入的是：' + e.data +userid+'sdf'+id++|| '');
            },
            onCancel: function(e) {
                alert('不想说!');
            }
        });
    };
</script>
</body>
</html>
