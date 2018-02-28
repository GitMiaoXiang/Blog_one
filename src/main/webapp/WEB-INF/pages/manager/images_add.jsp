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
    <title>图片上传</title>
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
<%@include file="top.jsp" %>
<div class="tpl-page-container tpl-page-header-fixed">
    <%@include file="left.jsp" %>
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            图片上传
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
            <li><a href="#">图片上传</a></li>
            <li class="am-active">图片上传</li>
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
            <div class="tpl-block ">

                <div class="am-g tpl-amazeui-form">


                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal" id="imagesform">
                            <div class="am-form-group">
                                <label for="title" class="am-u-sm-3 am-form-label">标题</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="title" name="title" placeholder="标题">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="descz" class="am-u-sm-3 am-form-label">描述</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="descz" name="descz" placeholder="描述">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="gallery" class="am-u-sm-3 am-form-label" style="margin-left: 17px">是否为摄影图片</label>
                                <div class="am-form-group">
                                    <select data-am-selected="{btnSize: 'sm'}" name="gallery" id="gallery">
                                        <option value="1" selected>是</option>
                                        <option value="0" >否</option>
                                    </select>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="images" class="am-u-sm-3 am-form-label">缩略图</label>
                                <ul class="am-avg-sm-3 am-thumbnails am-u-sm-9">
                                    <li>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                <div class="tpl-form-file-img">
                                                    <img id="show1" alt="">
                                                </div>
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                    <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                                <input id="doc-form-file1" type="file" name="images" onchange="upload1()"; multiple>
                                            </div>
                                            <div id="file-list1"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                <div class="tpl-form-file-img">
                                                    <img id="show2" alt="">
                                                </div>
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                    <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                                <input id="doc-form-file2" type="file" name="images" onchange="upload2()"; multiple>
                                            </div>
                                            <div id="file-list2"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                <div class="tpl-form-file-img">
                                                    <img id="show3" alt="">
                                                </div>
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                    <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                                <input id="doc-form-file3" type="file" name="images" onchange="upload3()"; multiple>
                                            </div>
                                            <div id="file-list3"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                <div class="tpl-form-file-img">
                                                    <img id="show4" alt="">
                                                </div>
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                    <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                                <input id="doc-form-file4" type="file" name="images" onchange="upload4()"; multiple>
                                            </div>
                                            <div id="file-list4"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                <div class="tpl-form-file-img">
                                                    <img id="show5" alt="">
                                                </div>
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                    <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                                <input id="doc-form-file5" type="file" name="images" onchange="upload5()"; multiple>
                                            </div>
                                            <div id="file-list5"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                <div class="tpl-form-file-img">
                                                    <img id="show6" alt="">
                                                </div>
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                    <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                                <input id="doc-form-file6" type="file" name="images" onchange="upload6()"; multiple>
                                            </div>
                                            <div id="file-list6"></div>
                                        </div>
                                    </li>
                                </ul>

                                <%--<ul class="am-avg-sm-4 am-thumbnails">
                                    <div class="am-u-sm-9">
                                        <div class="am-form-group am-form-file">
                                            <div class="tpl-form-file-img">
                                                <img id="show" alt="">
                                            </div>
                                            <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                            <input id="doc-form-file" type="file" name="images" onchange="c()"; multiple>
                                        </div>
                                        <div id="file-list"></div>
                                    </div>
                                </ul>--%>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="button" id="saveimages" class="am-btn am-btn-primary">保存修改</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    /**
     * 显示缩略图
     */
    function upload1 () {
        var r1= new FileReader();
        f1=document.getElementById('doc-form-file1').files[0];
        r1.readAsDataURL(f1);
        r1.onload=function  (e) {
            document.getElementById('show1').src=this.result;
        };
    }
    function upload2 () {
        var r2= new FileReader();
        f2=document.getElementById('doc-form-file2').files[0];
        r2.readAsDataURL(f2);
        r2.onload=function  (e) {
            document.getElementById('show2').src=this.result;
        };
    }
    function upload3 () {
        var r3= new FileReader();
        f3=document.getElementById('doc-form-file3').files[0];
        r3.readAsDataURL(f3);
        r3.onload=function  (e) {
            document.getElementById('show3').src=this.result;
        };
    }
    function upload4 () {
        var r4= new FileReader();
        f4=document.getElementById('doc-form-file4').files[0];
        r4.readAsDataURL(f4);
        r4.onload=function  (e) {
            document.getElementById('show4').src=this.result;
        };
    }

    function upload6 () {
        var r6= new FileReader();
        f6=document.getElementById('doc-form-file6').files[0];
        r6.readAsDataURL(f6);
        r6.onload=function  (e) {
            document.getElementById('show6').src=this.result;
        };
    }

    function upload5 () {
        var r6= new FileReader();
        f6=document.getElementById('doc-form-file5').files[0];
        r6.readAsDataURL(f6);
        r6.onload=function  (e) {
            document.getElementById('show5').src=this.result;
        };
    }
    /*function c () {
        var r= new FileReader();
        f=document.getElementById('doc-form-file').files[0];
        r.readAsDataURL(f);
        r.onload=function  (e) {
            document.getElementById('show').src=this.result;
        };
    }*/

    /**
     * 上传图片
     */
    $("#saveimages").click(function () {
        var imagesform=new FormData(document.getElementById("imagesform"));
        $.ajax({
            url:'http://localhost:8081/managerblog/manager/images/uploadimg',
            type:'post',
            data:imagesform,
            processData:false,
            contentType:false,
            success:function (data) {
                alert(data.code);
            }
        })
    })
</script>
</body>
</html>
