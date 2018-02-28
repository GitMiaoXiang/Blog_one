<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/10/30
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>摄影展示</title>
</head>
<body>
<%@include file="index_top.jsp"%>
<div class="breadcrumbs">
    <div class="container">
        <a href="index.html">Home</a><span>/</span><a href="javascript:void(0);">Pages</a><span>/</span>Gallery
        <h1 class="title-page">Gallery</h1>
    </div>
</div>

<div class="wrapper">
    <div class="container">
        <div class="content_block row no-sidebar">
            <div class="fl-container">
                <div class="posts-block">
                    <div class="contentarea">
                        <div class="row">
                            <div class="col-sm-12 module_cont pb80 module_gallery photo_gallery">
                                <div class="featured_items">
                                    <div class="items4 featured_portfolio">
                                        <ul class="item_list">
                                            <c:forEach items="${ImagesGallery}" var="images">
                                            <li class="animate" data-anim-type="bounceIn" data-anim-delay="250">
                                                <div class="item">
                                                    <div class="gallery_item_padding">
                                                        <div class="gallery_item_wrapper">
                                                            <img src="${images.src}" alt="" />
                                                            <span class="block_fade"></span>
                                                            <div class="post_hover_info">
                                                                <a href="${images.src}" class="photozoom view_link"><i class="icon-expand"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="fw_block bg_start grey_bg pt46 mb0">
                            <div class="row">
                                <div class="col-sm-12 module_cont pb47 module_partners">
                                    <div class="module_content sponsors_works items6">
                                        <ul>
                                            <li class="animate" data-anim-type="bounceIn" data-anim-delay="250">
                                                <div class="item_wrapper">
                                                    <div class="item">
                                                        <a href="http://wordpress.com/" target="_blank"><img src="<img/imgs/wp.png" alt="" /></a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="animate" data-anim-type="bounceIn" data-anim-delay="300">
                                                <div class="item_wrapper">
                                                    <div class="item">
                                                        <a href="http://www.envato.com/" target="_blank"><img src="img/imgs/envato.png" alt="" /></a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="animate" data-anim-type="bounceIn" data-anim-delay="350">
                                                <div class="item_wrapper">
                                                    <div class="item">
                                                        <a href="http://mailchimp.com/" target="_blank"><img src="img/imgs/mailchimp.png" alt="" /></a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="animate" data-anim-type="bounceIn" data-anim-delay="400">
                                                <div class="item_wrapper">
                                                    <div class="item">
                                                        <a href="http://www.pixeden.com/" target="_blank"><img src="img/imgs/pixeden.png" alt="" /></a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="animate" data-anim-type="bounceIn" data-anim-delay="450">
                                                <div class="item_wrapper">
                                                    <div class="item">
                                                        <a href="http://themeforest.net/" target="_blank"><img src="img/imgs/themeforest.png" alt="" /></a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="animate" data-anim-type="bounceIn" data-anim-delay="500">
                                                <div class="item_wrapper">
                                                    <div class="item">
                                                        <a href="http://www.gt3themes.com/" target="_blank"><img src="img/imgs/gt3themes.png" alt="" /></a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="index_footer.jsp"%>
</body>
</html>
