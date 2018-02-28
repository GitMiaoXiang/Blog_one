<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/10/30
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言</title>
</head>
<body>
<%@include file="index_top.jsp"%>
<div class="wrapper">
    <div class="container">
        <div class="page_title_block">
            <div class="bg_title">
                <h2>嘿！您好！</h2>
            </div>
            <div class="page_descr">
                <p>想说什么就说什么。</p>
            </div>
        </div>
        <div class="content_block row right-sidebar">
            <div class="fl-container hasRS">
                <div class="posts-block">
                    <div class="contentarea">
                        <div class="row">
                            <div class="col-sm-8 module_cont pb20 animate" data-anim-type="fadeInUp" data-anim-delay="300">
                                <h3 class="mb27 mt_5">Feel Free to Mail</h3>
                                <div class="module_content contact_form">
                                    <div id="note"></div>
                                    <div id="fields">
                                        <form id="ajax-contact-form" >
                                            <div class="row row20">
                                                <div class="col-sm-12"><input type="text" name="name" value="" placeholder="Name *" /></div>
                                                <div class="col-sm-12"><input type="text" name="mailbox" value="" placeholder="Email *" /></div>
                                            </div>
                                            <textarea name="content" id="message" placeholder="Write Your Message Here..."></textarea>
                                            <input type="submit" onclick="sendmsg()" style="margin-top: 20px" value="发送">

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 module_cont contact_info pb40 animate" data-anim-type="fadeInUp" data-anim-delay="300">
                            <h3 class="mb20 mt_5">博主信息</h3>
                            <p><span>Phone:</span> +147 9663 5306</p>
                            <p><span>Office:</span>江西 九江</p>
                            <p class="mb29"><span>Email:</span> <a href="mailto:#">1368309276@qq.com</a></p>

                            <h3 class="mb26">关注我</h3>
                            <div class="shortcode_icons_wrapper">
                                <a href="javascript:void(0);" title="Facebook"><span><i class="icon-facebook"></i></span></a>
                                <a href="javascript:void(0);" title="Twitter"><span><i class="icon-twitter"></i></span></a>
                                <a href="javascript:void(0);" title="Google+"><span><i class="icon-google-plus"></i></span></a>
                                <a href="javascript:void(0);" title="Dribbble"><span><i class="icon-dribbble"></i></span></a>
                                <a href="javascript:void(0);" title="Pinterest"><span><i class="icon-pinterest"></i></span></a>
                            </div>
                        </div>

                        </div>

                        <div class="row">
                            <%@include file="message_content.jsp"%>
                            <%--<div class="col-sm-12 module_cont pb33 module_google_map animate" data-anim-type="fadeInUp" data-anim-delay="300">
                                <div class="module_content">
                                    <iframe src="http://maps.google.ca/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=New+York&amp;sll=49.891235,-97.15369&amp;sspn=47.259509,86.923828&amp;ie=UTF8&amp;hq=&amp;hnear=New+York,+United+States&amp;ll=40.714867,-74.005537&amp;spn=0.019517,0.018797&amp;z=14&amp;iwloc=near&amp;output=embed"></iframe>
                                </div>
                            </div>--%>
                        </div>
                        <%--<div class="row">
                            <div class="col-sm-12 module_cont pb60 module_feature_posts">
                                <h3 class="mb27">Latest News</h3>
                                <div class="featured_items">
                                    <div class="items3 featured_posts">
                                        <ul class="item_list">
                                            <li class="animate" data-anim-type="fadeInUp" data-anim-delay="250">
                                                <div class="item">
                                                    <div class="item_wrapper">
                                                        <div class="img_block wrapped_img">
                                                            <img src="img/blog/feature/1.jpg" alt="">
                                                            <span class="block_fade"></span>
                                                            <div class="post_hover_info">
                                                                <a href="post_right_sidebar.html" class="featured_ico_link view_link"><i class="icon-link"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="featured_items_body">
                                                            <div class="featured_items_title">
                                                                <h5><a href="post_fullwidth.html">Ullamcorper Parturien</a></h5>
                                                            </div>
                                                            <div class="featured_item_content">Morbi leo risus, porta ac consectur at eros. Maecenas sed diam eget risus varius blandit sit amet non.</div>
                                                            <div class="featured_meta">
                                                                <div class="date">
                                                                    <i class="icon-calendar"></i>28 October, 2020
                                                                </div>
                                                                <div class="comments">
                                                                    <a href="javascript:void(0);">
                                                                        <i class="icon-comments"></i>15
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="animate" data-anim-type="fadeInUp" data-anim-delay="350">
                                                <div class="item">
                                                    <div class="item_wrapper">
                                                        <div class="img_block wrapped_img">
                                                            <img src="img/blog/feature/2.jpg" alt="">
                                                            <span class="block_fade"></span>
                                                            <div class="post_hover_info">
                                                                <a href="post_right_sidebar.html" class="featured_ico_link view_link"><i class="icon-link"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="featured_items_body">
                                                            <div class="featured_items_title">
                                                                <h5><a href="post_fullwidth.html">Excepteur Sint Occaecat</a></h5>
                                                            </div>
                                                            <div class="featured_item_content">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut lab.</div>
                                                            <div class="featured_meta">
                                                                <div class="date">
                                                                    <i class="icon-calendar"></i>27 October, 2020
                                                                </div>
                                                                <div class="comments">
                                                                    <a href="javascript:void(0);">
                                                                        <i class="icon-comments"></i>11
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="animate" data-anim-type="fadeInUp" data-anim-delay="450">
                                                <div class="item">
                                                    <div class="item_wrapper">
                                                        <div class="img_block wrapped_img">
                                                            <img src="img/blog/feature/3.jpg" alt="">
                                                            <span class="block_fade"></span>
                                                            <div class="post_hover_info">
                                                                <a href="post_right_sidebar.html" class="featured_ico_link view_link"><i class="icon-link"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="featured_items_body">
                                                            <div class="featured_items_title">
                                                                <h5><a href="post_fullwidth.html">Neque Porro Quisquam</a></h5>
                                                            </div>
                                                            <div class="featured_item_content">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudanti.</div>
                                                            <div class="featured_meta">
                                                                <div class="date">
                                                                    <i class="icon-calendar"></i>26 October, 2020
                                                                </div>
                                                                <div class="comments">
                                                                    <a href="javascript:void(0);">
                                                                        <i class="icon-comments"></i>10
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
           <%@include file="index_right.jsp"%>
            <div class="clear"></div>
        </div>
    </div>
</div>
<%@include file="index_footer.jsp"%>
<script>
    /**
     * 刷新留言div
     */
    function sendmsg() {
        $.ajax({
            url: 'http://localhost:8081/managerblog/web/message/sendmsg',
            type: 'post',
            //dataType:'json',
            //contentType:'application/json;charset=utf-8',
            data: $("#ajax-contact-form").serialize(),
            success: function (data) {
                // $("#flashdiv").remove();
                //alert(data);
                if(data.map!=null){
                    $.each(data.map,function (key,value) {
                        alert(value);
                    })
                }else {
                    var commentdiv = "<li class=\"comment\">\n" +
                        "            <div class=\"stand_comment\">\n" +
                        "                <div class=\"thiscommentbody\">\n" +
                        "                    <div class=\"commentava wrapped_img\">\n" +
                        "                        <img class=\"avatar\" src=\"<%=path1%>img/imgs/testimonial6.jpg\" alt=\"\" />\n" +
                        "                    </div>\n" +
                        "                    <div class=\"comment_info\">\n" +
                        "                        <div class=\"comment_author_name\"><a href=\"javascript:void(0);\">" + data.name + "</a></div>\n" +
                        "                        <p>" + data.content + "</p>\n" +
                        "                        <div class=\"comment_meta\">\n" +
                        "                            <span class=\"date\">" + new Date(data.time).toLocaleString() + "</span>\n" +
                        "                            <span class=\"comments\">\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "         </li>\n" +
                        "       ";

                    var commentdiv1 = "<ol class=\"commentlist animate\" data-anim-type=\"fadeInUp\" data-anim-delay=\"350\" id=\"divadrress\">" +
                        "<li class=\"comment\">\n" +
                        "            <div class=\"stand_comment\">\n" +
                        "                <div class=\"thiscommentbody\">\n" +
                        "                    <div class=\"commentava wrapped_img\">\n" +
                        "                        <img class=\"avatar\" src=\"<%=path1%>img/imgs/testimonial6.jpg\" alt=\"\" />\n" +
                        "                    </div>\n" +
                        "                    <div class=\"comment_info\">\n" +
                        "                        <div class=\"comment_author_name\"><a href=\"javascript:void(0);\">" + data.name + "</a></div>\n" +
                        "                        <p>" + data.content + "</p>\n" +
                        "                        <div class=\"comment_meta\">\n" +
                        "                            <span class=\"date\">" + new Date(data.time).toLocaleString() + "</span>\n" +
                        "                            <span class=\"comments\">\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "         </li>" +
                        "</ol>\n" +
                        "       ";
                    if ($("#divadrress").length > 0) {
                        $("#divadrress").prepend(commentdiv);
                    } else {
                        /* var div = "";
                         $("#flashdiv").append(div);*/
                        $("#flashdiv").prepend(commentdiv1);
                    }
                }
            }
        })
    }
</script>
</body>
</html>
