<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/10/30
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>鹿先生博客首页</title>
</head>
<body>
<%@include file="index_top.jsp" %>

<div class="wrapper">
    <div class="container">
        <div class="page_title_block">
            <div class="bg_title">
                <h1>Welcome to Blog</h1>
            </div>
            <div class="page_descr">
                <p>这个世界很小，我们就这样遇见。这个世界很大，分开就很难再见。</p>
            </div>
        </div>
        <div class="content_block row right-sidebar">
            <div class="fl-container hasRS">
                <div class="posts-block">
                    <div class="contentarea">

                        <div class="row">
                            <div class="col-sm-12 module_cont pb60 module_blog">

                                <%--帖子有一张图片走这里--%>
                                <c:forEach items="${article.list}" var="article">
                                <c:choose>
                                    <c:when test="${article.src!=null}">
                                        <div class="blog_post_preview animate" data-anim-type="fadeInLeft" data-anim-delay="300">
                                            <div class="blog_post_image">
                                                <a href="${article.src}"><img src="${article.src}" style="width: 827px;height: 553px" alt="" /></a>
                                            </div>
                                            <div class="blog_content">
                                                <h2 class="blogpost_title"><a href="post_fullwidth.html">${article.title}</a></h2>
                                                <div class="listing_meta">
                                                    <span><fmt:formatDate value="${article.updatedate}" type="both"/></span>
                                                    <span>by <a href="javascript:void(0);">博主</a></span>
                                                    <span><a href="javascript:void(0);">${article.count} 条评论</a></span>
                                                    <span>Tags: <a href="javascript:void(0);">${article.tags}</a><%--, <a href="javascript:void(0);">people</a>--%></span>
                                                </div>
                                                <p>${article.descz}</p>
                                                <div class="sidepanel widget_tag_cloud animate" data-anim-type="fadeInUp" data-anim-delay="300">
                                                    <div class="tagcloud"><a href="http://localhost:8081/managerblog/web/${article.id}/${article.category}/detaliAr.html">查看更多</a></div>
                                                </div>
                                                <%--<a href="http://localhost:8081/managerblog/web/${article.id}/${article.category}/detaliAr.html" class="read_more">查看更多</a>--%>
                                            </div>
                                        </div>
                                    </c:when>

                                    <%--<C:when test="">
                                        &lt;%&ndash;有多张图片&ndash;%&gt;
                                        <div class="blog_post_preview animate" data-anim-type="fadeInLeft" data-anim-delay="300">
                                            <div class="pf_output_container blog_post_image">
                                                <div class="slider-wrapper theme-default">
                                                    <div class="nivoSlider">
                                                        <img src="img/blog/post/2.jpg" alt="" />
                                                        <img src="img/blog/post/3.jpg" alt="" />
                                                        <img src="img/blog/post/4.jpg" alt="" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="blog_content">
                                                <h2 class="blogpost_title"><a href="post_fullwidth.html">Standard Post with Slider</a></h2>
                                                <div class="listing_meta">
                                                    <span>Dec 11, 2020</span>
                                                    <span>by <a href="javascript:void(0);">Admin</a></span>
                                                    <span><a href="javascript:void(0);">3 comments</a></span>
                                                    <span>Tags: <a href="javascript:void(0);">business</a>, <a href="javascript:void(0);">people</a></span>
                                                </div>
                                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est. <a href="post_fullwidth.html" class="read_more">Details</a></p>
                                            </div>
                                        </div>
                                    </C:when>--%>

                                    <c:when test="${article.src==null}">
                                        <%--无图片--%>
                                        <div class="blog_post_preview animate" data-anim-type="fadeInLeft" data-anim-delay="300">
                                            <div class="blog_content">
                                                <h2 class="blogpost_title"><a href="post_fullwidth.html">${article.title}</a></h2>
                                                <div class="listing_meta">
                                                    <span><fmt:formatDate value="${article.updatedate}" type="both"/></span>
                                                    <span>by <a href="javascript:void(0);">博主</a></span>
                                                    <span><a href="javascript:void(0);">${article.count} 条评论</a></span>
                                                    <span>Tags: <a href="javascript:void(0);">${article.tags}</a><%--, <a href="javascript:void(0);">people</a>--%></span>
                                                </div>
                                                <p>${article.descz}</p>
                                                <div class="sidepanel widget_tag_cloud animate" data-anim-type="fadeInUp" data-anim-delay="300">
                                                    <div class="tagcloud"><a href="http://localhost:8081/managerblog/web/${article.id}/${article.category}/detaliAr.html">查看更多</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                                </c:forEach>

                                <%--有视频的帖子--%>
                               <%-- <div class="blog_post_preview animate" data-anim-type="fadeInLeft" data-anim-delay="300">
                                    <div class="pf_output_container blog_post_image">
                                        <iframe src="https://player.vimeo.com/video/15801179" height="400" allowfullscreen></iframe>
                                    </div>
                                    <div class="blog_content">
                                        <h2 class="blogpost_title"><a href="post_fullwidth.html">Standard Post with Video</a></h2>
                                        <div class="listing_meta">
                                            <span>Dec 11, 2020</span>
                                            <span>by <a href="javascript:void(0);">Admin</a></span>
                                            <span><a href="javascript:void(0);">3 comments</a></span>
                                            <span>Tags: <a href="javascript:void(0);">business</a>, <a href="javascript:void(0);">people</a></span>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia.   <a href="post_fullwidth.html" class="read_more">Details</a></p>
                                    </div>
                                </div>--%>

                                <%--<div class="blog_post_preview animate" data-anim-type="fadeInLeft" data-anim-delay="300">
                                    <div class="blog_content">
                                        <div class="listing_meta">
                                            <span>Dec 11, 2020</span>
                                            <span>by <a href="javascript:void(0);">Admin</a></span>
                                            <span><a href="javascript:void(0);">3 comments</a></span>
                                            <span>Tags: <a href="javascript:void(0);">business</a>, <a href="javascript:void(0);">people</a></span>
                                        </div>
                                        <blockquote>
                                            <p>Provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga einem like temporalis eos qui ratione.
                                                Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis. At vero eos et samus et iusto odio qui blanditiis praesentium voluptatum deleniti atque corrupti quos jfont dolores et autem quibusdam et aut officis perferendis doloribus eos qui ratione voluptatem.</p>
                                            <div class="author">Robin Hardy, Developer</div>
                                        </blockquote>
                                    </div>
                                </div>--%>

                                    <ul class="pagerblock animate" data-anim-type="fadeInUp" data-anim-delay="300">
                                        <c:if test="${article.hasPreviousPage}">
                                            <li><a class="prev-page" href="http://localhost:8081/managerblog/web/index.html?page=${article.pageNum-1}"><i class="icon-angle-left"></i></a></li>
                                        </c:if>
                                        <c:forEach items="${article.navigatepageNums}" var="pageNum">
                                            <li><a class="current" href="http://localhost:8081/managerblog/web/index.html?page=${pageNum}">${pageNum}</a></li>
                                        </c:forEach>
                                        <c:if test="${article.hasNextPage}">
                                            <li><a class="next-page" href="http://localhost:8081/managerblog/web/index.html?page=${article.pageNum+1}"><i class="icon-angle-right"></i></a></li>
                                        </c:if>

                                    </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%@include file="index_right.jsp"%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<%@include file="index_footer.jsp" %>
</body>
</html>
