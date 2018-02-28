<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 上官名鹏
  Date: 2017/10/30
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        //String path1="项目名："+request.getContextPath()+"url:"+request.getRequestURI()+"scheme:"+request.getScheme()+"servername"+request.getServerName()+"port"+request.getServerPort();
        String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="<%=path%>jquery/jquery-3.2.1.min.js"></script>
    <link rel="shortcut icon" href="<%=path%>img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="<%=path%>img/apple_icons_57x57.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<%=path%>img/apple_icons_72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<%=path%>img/apple_icons_114x114.png">
    <title>Groutek | Premium Html Template</title>
    <link href="<%=path%>css/googledown.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=path%>css/bootstrap.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/theme.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/custom.css" type="text/css" media="all" />
    <%--导入bootstrap样式--%>
    <link rel="stylesheet" href="<%=path%>bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="<%=path%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="main_header type1">
    <div class="tagline">
        <div class="container">
            <div class="fright">
                <div class="tagline_items">
                    <%--<div class="language_select">
                        <div class="selectBox">
                            <span class="selected"></span>
                            <span class="selectArrow"></span>
                            <!--<div class="selectOptions" >
                                <span class="selectOption" data-value="english"><img src="img/imgs/uk_flag.png" alt="" />English</span>
                                <span class="selectOption" data-value="germany"><img src="img/imgs/germany_flag.png" alt="" />Germany</span>
                            </div>-->
                        </div>
                    </div>
                    <div class="log_in_out"><a href="javascript:void(0);" data-toggle="modal" data-target=".login_popup"><i class="icon-sign-in"></i> Login</a></div>
                    <div class="modal fade login_popup" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <h3>请, 登录</h3>
                                <form action="javascript:void(0);" method="post">
                                    <input type="text" placeholder="用户名*" value="" name="name">
                                    <input type="password" placeholder="密码*" value="" name="password">
                                    <input type="submit" value="Log In">
                                    <div class="remember_me"><label><input name="remember" type="checkbox" value="remember">记住密码</label></div>
                                </form>
                                <div class="forgot_password"><a href="javascript:void(0);">密码忘记了？</a></div>
                                <button type="button" class="close_popup" data-dismiss="modal"><i class="icon-times"></i></button>
                            </div>
                        </div>
                    </div>--%>
                    <!--<div class="cart_btn">
                        <a href="shop_cart.html" class="view_cart_btn"><i class="icon-shopping-cart"></i> Cart</a>
                        <!-- Cart submenu
                        <div class="cart_submenu">
                            <div class="cart_wrap">
                                <a href="javascript:void(0);" class="remove_products"><i class="icon-times-circle"></i></a>
                                <ul class="product_posts">
                                    <li>
                                        <img src="img/shop/1.jpg" alt="" />
                                        <a href="shop_product.html" class="title">Nemo Enim Ipsam</a>
                                        <div class="price">1<span>x</span>$500.00</div>
                                    </li>
                                </ul>
                                <div class="subtotal">Subtotal: <span>$500.00</span></div>
                                <a href="shop_cart.html" class=" shortcode_button btn_small btn_type5 mr15">View cart</a>
                                <a href="javascript:void(0);" class=" shortcode_button btn_small btn_type1 mr0">Checkout</a>
                            </div>
                        </div>
                        <!-- //Cart submenu
                    </div>-->
                </div>
                <div class="top_search" id="top_search">
                    <form action="#" method="get" name="search_form">
                        <input type="text" class="ct-search-input" value="" name="s" placeholder="Search...">
                        <input type="submit" value="Search" class="s_submit">
                        <span class="top-icon-search">
                            	<i class="icon-search"></i>
                            </span>
                    </form>
                </div>
            </div>
            <div class="fleft">
                <div class="phone"><i class="icon-phone"></i> +14796635306</div>
                <div class="email"><a href="mailto:#"><i class="icon-envelope"></i> 1368309276@qq.com</a></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="header_parent_wrap">
        <header>
            <div class="container">
                <a class="top_menu_toggler" href="javascript:void(0)"></a>
                <div class="logo_sect">
                    <a href="index.html" class="logo"><%--<img src="img/logo.png" class="logo_def" alt="" /><img src="img/retina/logo.png" class="logo_retina" alt="" />--%></a>                    </div>
                <nav>
                    <ul class="menu">
                        <c:forEach items="${category}" var="catelog">
                            <c:if test="${catelog.name!=null}">
                                <li class="menu-item-has-children"><a href="${catelog.hrefz}" onmouseover="querydaohang(${catelog.id})" onmouseleave="clear()">${catelog.name}</a>
                                        <%--<c:if test="${catelog.indexz!=null}">
                                            <div class="sub-nav">
                                                <ul class="sub-menu">
                                                    <li><a href="typography.html"></a></li>
                                                    <li><a href="shortcodes.html">HTML5</a></li>
                                                </ul>
                                            </div>
                                        </c:if>--%>
                                </li>
                            </c:if>
                        </c:forEach>
                        <%--<li class="menu-item-has-children"><a href="gallery.html">摄影</a>
                            <!--<div class="sub-nav">
                                <ul class="sub-menu">

                                    <li><a href="gallery.html">照片集</a></li>
                                    <li><a href="showreel.html">Showreel</a></li>
                                    <li><a href="404.html">404 Error</a></li>
                                    <li><a href="faq.html">FAQ</a></li>
                                    <li><a href="sitemap.html">Sitemap</a></li>
                                    <li><a href="coming_soon.html">Coming Soon</a></li>
                                </ul>
                            </div>-->
                        </li>--%>
                        <%--<li class="menu-item-has-children"><a href="#">分类</a>
                            <div class="sub-nav">
                                <ul class="sub-menu">
                                    <li><a href="typography.html">Java</a></li>
                                    <li><a href="shortcodes.html">HTML5</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="current-menu-parent menu-item-has-children"><a href="#">Works</a>
                            <div class="sub-nav">
                                <ul class="sub-menu">
                                    <li><a href="portfolio_1col.html">1 Column</a></li>
                                    <li><a href="portfolio_2col.html">2 Columns</a></li>
                                    <li><a href="portfolio_3col.html">3 Columns</a></li>
                                    <li><a href="portfolio_3col_masonry.html">3 Columns Masonry</a></li>
                                    <li><a href="portfolio_wide.html">Wide</a></li>
                                    <li class="current-menu-parent menu-item-has-children"><a href="#">Single Post</a>
                                        <div class="sub-nav">
                                            <ul class="sub-menu">
                                                <li><a href="portfolio_post_fullwidth.html">Fullwidth Image</a></li>
                                                <li><a href="portfolio_post_fullwidth.html">Fullwidth Image</a></li>
                                                <li class="current-menu-item"><a href="portfolio_post_right_sidebar.html">With Right Sidebar</a></li>
                                                <li><a href="portfolio_post_left_sidebar.html">With Left Sidebar</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="menu-item-has-children"><a href="#">页面转换</a>
                            <div class="sub-nav">
                                <ul class="sub-menu">
                                    <li><a href="blog_fullwidth.html">Fullwidth Blog</a></li>
                                    <li><a href="blog_right_sidebar.html">With Right Sidebar</a></li>
                                    <li><a href="blog_left_sidebar.html">With Left Sidebar</a></li>
                                    <li class="menu-item-has-children"><a href="#">Single Post</a>
                                        <div class="sub-nav">
                                            <ul class="sub-menu">
                                                <li><a href="post_fullwidth.html">Fullwidth Image</a></li>
                                                <li><a href="post_right_sidebar.html">With Right Sidebar</a></li>
                                                <li><a href="post_left_sidebar.html">With Left Sidebar</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="menu-item-has-children"><a href="#">Shop</a>
                            <div class="sub-nav">
                                <ul class="sub-menu">
                                    <li><a href="shop.html">All Products</a></li>
                                    <li><a href="shop_product.html">Single Product</a></li>
                                    <li><a href="shop_cart.html">Cart</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="menu-item-has-children"><a href="http://localhost:8081/managerblog/web/message.html">留言</a>
                            <div class="sub-nav">
                                <ul class="sub-menu">
                                    <li><a href="contact_fullwidth.html">Fullwidth</a></li>
                                    <li><a href="contact_sidebar.html">With Sidebar</a></li>
                                </ul>
                            </div>
                        </li>--%>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
        </header>
    </div>
</div>
</body>
<script type="text/javascript">
    /**
     * 获取导航栏的子类目信息,鼠标移入
     */
    function querydaohang(indexz) {
        $(".sub-nav").remove();
        $.ajax({
            url:'http://localhost:8081/managerblog/web/category/querysun/'+indexz,
            type:'GET',
            contentType:"application/json;charset=utf-8",
            dataType:'json',
            success:function (data) {
                var li=new Array();
               $.each(data,function (index,content) {
                    //alert(content.name);
                    var divnav="<div class='sub-nav'><ul class='sub-menu'></ul></div>";
                    li.push("<li><a href='"+content.hrefz+"'>"+content.name+"</a></li>");
                    //alert("index"+index+"content:"+content.name);
                   $(".menu-item-has-children").append(divnav);

                })
                $(".sub-menu").append(li);
            }
        });
        /**
         *获取导航栏的子类目信息,鼠标离开
         */
        /*function clear() {
            $(".sub-nav").remove();
        }*/
    }


</script>
</html>
