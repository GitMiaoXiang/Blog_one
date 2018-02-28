<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/10/30
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章详情</title>
</head>
<body>
<%@include file="index_top.jsp" %>

<%--弹出框--%>
<div class="modal fade" id="repalyk" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">输入您的回复信息...</h4>
            </div>
            <div class="modal-body">
                <form class="comment-form" id="repalyform" method="post" action="javascript:void(0);">
                    <div class="row row20">
                        <div class="col-sm-12"><input type="text" name="author" id="name" value="" placeholder="名字*">
                        </div>
                        <div class="col-sm-12"><input type="text" name="email" value="" placeholder="电子邮件*"></div>
                        <input type="hidden" name="articleid" value="${article.id}">
                        <input type="hidden" name="fromuserid" value="2">
                    </div>
                    <textarea rows="5" cols="45" name="content" placeholder="在这里写下你的信息…"></textarea>
                    <%--<input type="submit" value="Send Message" id="submit" name="submit" onclick="sendcomment()">--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="closerebtn" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" onclick="sendrepaly()" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="wrapper">
    <div class="container">
        <div class="content_block row right-sidebar single_post">
            <div class="fl-container hasRS">
                <div class="posts-block">
                    <div class="contentarea">
                        <div class="blog_post_preview animate" data-anim-type="fadeInUp" data-anim-delay="300">
                            <h1>${article.title}</h1>
                            <div class="listing_meta">
                                <span>${article.updatedate}</span>
                                <span>by <a href="javascript:void(0);">博主</a></span>
                                <span><a href="javascript:void(0);">${article.count} 条评论</a></span>
                                <span>Tags: <a href="javascript:void(0);">${article.tags}</a></span>
                            </div>
                            <%--<c:if test="${article.src!=null}">
                                <div class="blog_post_image">
                                    <img src="${article.src}" alt=""/>
                                </div>
                            </c:if>--%>
                            <div class="blog_content module_content">
                                ${article.content}
                                <%--&lt;%&ndash;<p>Ultrices posuere cubilia curae curabitur sit amet tortor ut massa commodo. Vestibulum consectetur euismod malesuada tincidunt cum. Sed ullamcorper dignissim consectetur ut tincidunt eros sed sapien consectetur dictum. Pellentesques sed volutpat ante, cursus port. Praesent mi magna, penatibus et magniseget dis parturient montes sed quia consequuntur magni dolores eos qui ratione.</p>
                                <blockquote>
                                    <p>Provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga einem like temporalis eos qui ratione.
                                        Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis. At vero eos et samus et iusto odio qui blanditiis praesentium voluptatum deleniti atque corrupti quos jfont dolores et autem quibusdam et aut officis perferendis doloribus eos qui ratione voluptatem.</p>
                                    <div class="author">Robin Hardy, Developer</div>
                                </blockquote>
                                <p>Donec et eleifend velit. Sed eget urna odio. <a href="javascript:void(0);">Quisque pulvinar</a> dolor purus, sed dignissim ante imperdiet ac. Sed vulputate lectus at enim aliquet suscipit. Proin metus nibh, tempor ut porta ultricies, sollicitudin id mauris. Aliquam neque lectus, condimentum quis fringilla. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.</p>
                                <ol class="mb6">
                                    <li>Donec et eleifend velit. Sed eget urna odio. </li>
                                    <li>Quisque pulvinar dolor purus, sed dignissim ante imperdiet ac. </li>
                                    <li>Sed vulputate lectus at enim aliquet suscipit. </li>
                                    <li>Proin metus nibh, tempor ut porta ultricies, sollicitudin id mauris.</li>
                                </ol>&ndash;%&gt;--%>
                            </div>
                        </div>
                        <div class="row control_post_links">
                            <div class="col-sm-6 animate" data-anim-type="fadeInLeft" data-anim-delay="300">
                                <div class="shortcode_icons_wrapper">
                                    <a title="Facebook" href="javascript:void(0);"><span><i
                                            class="icon-facebook"></i></span></a>
                                    <a title="Twitter" href="javascript:void(0);"><span><i
                                            class="icon-twitter"></i></span></a>
                                    <a title="Google+" href="javascript:void(0);"><span><i class="icon-google-plus"></i></span></a>
                                    <a title="Pinterest" href="javascript:void(0);"><span><i class="icon-pinterest"></i></span></a>
                                </div>
                            </div>
                            <div class="col-sm-6 text-right animate" data-anim-type="fadeInRight" data-anim-delay="300">
                                <div class="prev_next_links">
                                    <a href="#"><i class="icon-angle-left"></i>上一篇</a>
                                    <span>/</span>
                                    <a href="#">下一篇<i class="icon-angle-right"></i></a>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-sm-12 module_cont pb33 module_feature_posts">
                                <h3 class="mb27">相关文章</h3>
                                <div class="featured_items">
                                    <div class="items3 featured_posts">
                                        <ul class="item_list">
                                            <%--<c:forEach items="${article}" var="article">
                                             <li class="animate" data-anim-type="fadeInUp" data-anim-delay="300">
                                                 <div class="item">
                                                     <div class="item_wrapper">
                                                         <div class="img_block wrapped_img">
                                                             <img alt="" src="${imagesrc}" />
                                                             <span class="block_fade"></span>
                                                             <div class="post_hover_info">
                                                                 <a class="featured_ico_link view_link" href="javascript:void(0);"><i class="icon-link"></i></a>
                                                             </div>
                                                         </div>
                                                         <div class="featured_items_body">
                                                             <div class="featured_items_title">
                                                                 <h5><a href="post_fullwidth.html">${article.blogArticle.title}</a></h5>
                                                             </div>
                                                             <div class="featured_item_content">${article.blogArticle.descz}</div>
                                                             <div class="featured_meta">
                                                                 <div class="date">
                                                                     <i class="icon-calendar"></i>${article.blogArticle.updatedate}
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
                                             </c:forEach>--%>
                                            <%--<li class="animate" data-anim-type="fadeInUp" data-anim-delay="400">
                                             <div class="item">
                                                 <div class="item_wrapper">
                                                     <div class="img_block wrapped_img">
                                                         <img alt="" src="img/blog/feature/2.jpg" />
                                                         <span class="block_fade"></span>
                                                         <div class="post_hover_info">
                                                             <a class="featured_ico_link view_link" href="javascript:void(0);"><i class="icon-link"></i></a>
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
                                         </li>--%>
                                            <C:forEach items="${articlebaid}" var="articlebaid">
                                                <li class="animate" data-anim-type="fadeInUp" data-anim-delay="500">
                                                    <div class="item">
                                                        <div class="item_wrapper">
                                                            <c:if test="${articlebaid.src!=null}">
                                                                <div class="img_block wrapped_img">
                                                                    <img alt="" style="width: 273px;height: 176px;" src="${articlebaid.src}"/>
                                                                    <span class="block_fade"></span>
                                                                    <div class="post_hover_info">
                                                                        <a class="featured_ico_link view_link"
                                                                           href="javascript:void(0);"><i
                                                                                class="icon-link"></i></a>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                            <div class="featured_items_body">
                                                                <div class="featured_items_title">
                                                                    <h5>
                                                                        <a href="http://localhost:8081/managerblog/web/${articlebaid.id}/${articlebaid.category}/detaliAr.html">${articlebaid.title}</a>
                                                                    </h5>
                                                                </div>
                                                                <div class="featured_item_content">${articlebaid.descz}</div>
                                                                <div class="featured_meta">
                                                                    <div class="date">
                                                                        <i class="icon-calendar"></i>${articlebaid.updatedate}
                                                                    </div>
                                                                    <div class="comments">
                                                                        <a href="javascript:void(0);">
                                                                            <i class="icon-comments"></i>${articlebaid.count}
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </C:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--评论页面--%>
                        <div id="comments" id="comments">
                            <%@include file="comment.jsp" %>
                            <div id="respond" class="animate" data-anim-type="fadeInUp" data-anim-delay="400">
                                <h3 class="mb22">留下您的回复！</h3>
                                <p class="mb23">您的电子邮件地址将不会被公布。需要的字段被标记 *</p>
                                <form class="comment-form" id="commentform" method="post" action="javascript:void(0);">
                                    <div class="row row20">
                                        <div class="col-sm-12"><input type="text" name="name"
                                                                      placeholder="名字*"></div>
                                        <div class="col-sm-12"><input type="text" id="mail" name="mailbox"
                                                                      placeholder="电子邮件*"></div>
                                        <input type="hidden" name="articleid" value="${article.id}">
                                    </div>
                                    <textarea rows="5" cols="45" name="content" placeholder="在这里写下你的信息…"></textarea>
                                    <input type="submit" value="Send Message" name="submit" style="margin-top: 20px"
                                           onclick="sendcomment()">
                                </form>
                            </div><!-- #respond -->
                        </div>
                    </div>
                </div>
            </div>

                <%@include file="index_right.jsp"%>
            <div class="clear"></div>
        </div>
    </div>
</div>
<%@include file="index_footer.jsp" %>
</body>
<script>

    /**
     * 时间戳转日期
     */
    function getMyDate(str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    };

    //补0操作
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }

    function insertAfter(newElement, targetElement){
        var parent = targetElement.parentNode;
        if (parent.lastChild == targetElement) {
            // 如果最后的节点是目标元素，则直接添加。因为默认是最后
            parent.appendChild(newElement);
        } else {
            parent.insertBefore(newElement, targetElement.nextSibling);
            //如果不是，则插入在目标元素的下一个兄弟节点 的前面。也就是目标元素的后面
        }
    }


    /**
     * 刷新评论div
     */
    function sendcomment() {
        $.ajax({
            url: 'http://localhost:8081/managerblog/web/comment/sendcomment',
            type: 'post',
            //dataType:'json',
            //contentType:'application/json;charset=utf-8',
            data: $("#commentform").serialize(),
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
                        "                        <div class=\"comment_author_name\"><a href=\"javascript:void(0);\">" + data.userid + "</a></div>\n" +
                        "                        <p>" + data.contentz + "</p>\n" +
                        "                        <div class=\"comment_meta\">\n" +
                        "                            <span class=\"date\">" + getMyDate(data.time) + "</span>\n" +
                        "                            <span class=\"comments\">\n" +
                        "                                <a href=\"javascript:void(0);\" onclick=\"openrepaly(this)\" value=\"" + data.id + "\" type=\"commentid\" class=\"comment-reply-link\"><i class=\"icon-reply\"></i>回复</a></span>\n" +
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
                        "                        <div class=\"comment_author_name\"><a href=\"javascript:void(0);\">" + data.userid + "</a></div>\n" +
                        "                        <p>" + data.contentz + "</p>\n" +
                        "                        <div class=\"comment_meta\">\n" +
                        "                            <span class=\"date\">" + getMyDate(data.time) + "</span>\n" +
                        "                            <span class=\"comments\">\n" +
                        "                                <a href=\"javascript:void(0);\" onclick=\"openrepaly(this)\" value=\"" + data.id + "\" type=\"commentid\" class=\"comment-reply-link\"><i class=\"icon-reply\"></i>回复</a></span>\n" +
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

    /**
     * 弹出回复对话框
     */
    function centerModals() {
        $('#repalyk').each(function (i) {
            var $clone = $(this).clone().css('display', 'block').appendTo('body');
            var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
            top = top > 0 ? top : 0;
            $clone.remove();
            $(this).find('.modal-content').css("margin-top", top);
        });
    };

    var value = "";
    var type = "";
    var $ele = "";

    function openrepaly(ele) {
        $ele = ele;
        value = $(ele).attr("value");
        type = $(ele).attr("type");
        $('#repalyk').on('show.bs.modal', centerModals);
        $('#repalyk').modal({
            backdrop: 'static',
            keyboard: 'true',
        });
        $(window).on('resize', centerModals);
    }


    /* function repaly() {

     }
 */
    /**
     * 清空表单内容
     */
    //清空表单样式及内容
    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    };

    /**
     * 判断是否为空
     * */

    function isEmptyObject(obj) {
        for (var n in obj) {
            return false
        }
        return true;
    }

    /**
     * 提交回复信息
     */
    function sendrepaly() {
        var address = "http://localhost:8081/managerblog/web/${article.id}/" + value + "/" + type + "/sendrepaly";
        $.ajax({
            url: address,
            type: 'post',
            data: $("#repalyform").serialize(),
            success: function (data) {
                /*alert(data.content);*/
                /* $("#flashdiv").html(data);*/
                var repalydiv = "<li class=\"comment\">\n" +
                    "                            <div class=\"stand_comment\">\n" +
                    "                                <div class=\"thiscommentbody\">\n" +
                    "                                    <div class=\"commentava wrapped_img\">\n" +
                    "                                        <img class=\"avatar\" src=\"<%=path1%>img/imgs/testimonial3.jpg\" alt=\"\" />\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"comment_info\">\n" +
                    "                                        <div class=\"comment_author_name\"><a href=\"javascript:void(0);\">" + data.fromuserid + "回复 " + data.touserid + "</a></div>\n" +
                    "                                        <p>" + data.content + "</p>\n" +
                    "                                        <div class=\"comment_meta\">\n" +
                    "                                            <span class=\"date\">" + getMyDate(data.time) + "</span>\n" +
                    "                                            <%--<c:if test=\"${blogcmtrepaly.repalyid==null}\">\n"+
"                                                <span class=\"comments\"><a href=\"javascript:void(0);\" onclick=\"openrepaly(this)\" class=\"comment-reply-link\" value=\"${blogcmtrepaly.id}\" type=\"commentid\"><i class=\"icon-reply\"></i>回复</a></span>\n"+
"                                            </c:if>\n"+
"                                            <c:if test=\"${blogcmtrepaly.repalyid!=null}\">--%>\n" +
                    "                                                <span class=\"comments\"><a href=\"javascript:void(0);\" onclick=\"openrepaly(this)\" class=\"comment-reply-link\" value=\"" + data.id + "\" type=\"repalyid\"><i class=\"icon-reply\"></i>回复</a></span>\n" +
                    "                                            <%--</c:if>--%>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                        </li>";
                //alert(isEmptyObject($ele));
                if (isEmptyObject($ele)) {
                    $("#repalydiv").prepend(repalydiv);
                } else {
                    //alert("传过来的对象不是空的！");
                    if(isEmptyObject($ele.closest("#repalydiv"))){
                        if($($ele.closest("#commentdiv")).siblings("#repalydiv").length>0){
                            //alert("点击的是评论的回复,并这个父元素储存在");
                            $($($ele.closest("#commentdiv")).siblings("#repalydiv")).prepend(repalydiv);
                            /*$('#repalyk').modal('hide');
                            reset_form("#repalyform");*/
                        }else{
                            //alert("点击的是评论的回复");
                            var ul="<ul id=\"repalydiv\">"+repalydiv+"</ul>"
                            $($ele.closest("#divadrress li")).append(ul);
                           $($($ele.closest("#commentdiv")).siblings("#repalydiv")).prepend(repalydiv);

                           //$($ele.closest("#repalydiv")).prepend(repalydiv);
                          //  $("#repalydiv").prepend(repalydiv);
                        }
                       // $($($ele.closest("#commentdiv")).siblings("#repalydiv")).prepend(repalydiv);
                        // $("#repalydiv").prepend(repalydiv);
                    } else {
                        //alert("点击是回复的回复！")
                        $($ele.closest("#repalydiv")).prepend(repalydiv);
                    }
                }
                $('#repalyk').modal('hide');
                reset_form("#repalyform");
            }
        })

    }

</script>
</html>
