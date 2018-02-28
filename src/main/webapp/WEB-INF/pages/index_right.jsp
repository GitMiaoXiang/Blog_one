<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/11/7
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="right-sidebar-block">

    <div class="sidepanel widget_search">
        <form name="search_form" method="get" action="javascript:void(0);" class="search_form">
            <input type="text" name="s" value="" placeholder="Search">
            <input type="submit" value="Go">
        </form>
    </div>

    <div class="sidepanel widget_categories animate" data-anim-type="fadeInUp" data-anim-delay="300">
        <h4 class="title">文章归档</h4>
        <ul>
            <c:forEach items="${categorycount}" var="catelog">
                <li class="cat-item"><a href="http://localhost:8081/managerblog/web/index.html?caid=${catelog.id}">${catelog.name} (${catelog.count})</a></li>
            </c:forEach>
        </ul>
    </div>

    <div class="sidepanel widget_posts animate" data-anim-type="fadeInUp" data-anim-delay="300">
        <h4 class="title">最近文章</h4>
        <ul class="recent_posts">
            <c:forEach items="${articletime}" var="articletime">
            <li class="with_img">
                <div class="recent_posts_content">
                    <c:if test="${articletime.src!=null}">
                        <img src="${articletime.src}" alt="" />
                    </c:if>
                    <c:if test="${articletime.src==null}">
                        <img src="<%=path%>img/imgs/widget_post1.jpg" value="">
                    </c:if>
                    <a href="http://localhost:8081/managerblog/web/${articletime.id}/${articletime.category}/detaliAr.html" class="title">${articletime.title}</a>
                    <div class="recent_posts_info"><fmt:formatDate value="${articletime.updatedate}" type="both"/><a href="javascript:void(0);">  /  ${articletime.count} 条评论</a></div>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>

    <div class="sidepanel widget_tag_cloud animate" data-anim-type="fadeInUp" data-anim-delay="300">
        <h4 class="title">标签云</h4>
        <div class="tagcloud">
            <c:forEach items="${tag}" var="tag">
            <a href="http://localhost:8081/managerblog/web/${tag.name}/${tag.id}/tag.html">${tag.name} (${tag.number})</a>
            </c:forEach>
        </div>
    </div>
</body>
</html>
