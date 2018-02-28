<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/11/3
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        //String path1="项目名："+request.getContextPath()+"url:"+request.getRequestURI()+"scheme:"+request.getScheme()+"servername"+request.getServerName()+"port"+request.getServerPort();
        String path1=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    %>
</head>
<body>
<div id="flashdiv">
<h3 class="animate" id="h3" data-anim-type="fadeInUp" data-anim-delay="350">${count} 条留言</h3>
<ol class="commentlist animate" data-anim-type="fadeInUp" data-anim-delay="350" id="divadrress">
    <C:forEach items="${message}" var="message">
        <li class="comment">
            <div class="stand_comment" id="commentdiv">
                <div class="thiscommentbody">
                    <div class="commentava wrapped_img">
                        <img class="avatar" src="<%=path1%>img/imgs/testimonial6.jpg" alt="" />
                    </div>
                    <div class="comment_info">
                        <div class="comment_author_name"><a href="javascript:void(0);">${message.name}</a></div>
                        <p>${message.content}</p>
                        <div class="comment_meta">
                            <span class="date"><fmt:formatDate value="${message.time}" type="both"/></span>
                            <span class="comments">
                               <%-- <a href="javascript:void(0);" onclick="openrepaly(this)" value="${message.id}" type="commentid" class="comment-reply-link"><i class="icon-reply"></i>回复</a></span>--%>
                        </div>
                    </div>
                </div>
            </div>
            <ul id="repalydiv">
                <C:forEach items="${msgreply}" var="msgreply" varStatus="status">
                    <C:if test="${msgreply.messageid==message.id}">
                        <li class="comment">
                            <div class="stand_comment">
                                <div class="thiscommentbody">
                                    <div class="commentava wrapped_img">
                                        <img class="avatar" src="<%=path1%>img/imgs/testimonial3.jpg" alt="" />
                                    </div>
                                    <div class="comment_info">
                                        <div class="comment_author_name"><a href="javascript:void(0);">${msgreply.fromname} 回复 ${msgreply.toname}</a></div>
                                        <p>${msgreply.content}</p>
                                        <div class="comment_meta">
                                            <span class="date"><fmt:formatDate value="${msgreply.time}" type="both"/></span>
                                            <%--<c:if test="${blogcmtrepaly.repalyid==null}">
                                                <span class="comments"><a href="javascript:void(0);" onclick="openrepaly(this)" class="comment-reply-link" value="${blogcmtrepaly.id}" type="commentid"><i class="icon-reply"></i>回复</a></span>
                                            </c:if>
                                            <c:if test="${blogcmtrepaly.repalyid!=null}">--%>
                                                <%--<span class="comments"><a href="javascript:void(0);" onclick="openrepaly(this)" class="comment-reply-link" value="${blogcmtrepaly.id}" type="repalyid"><i class="icon-reply"></i>回复</a></span>--%>
                                            <%--</c:if>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </C:if>
                </C:forEach>
            </ul>
        </li>
    </C:forEach>
</ol>
</div>
</body>
</html>
