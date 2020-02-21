<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/18
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <title>海底捞餐饮</title>
    <!-- load stylesheets -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <!-- Google web font "Open Sans" -->
    <link rel="stylesheet" href="/static/style/font-awesome-4.5.0/css/font-awesome.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/style/css/bootstrap.min.css">
    <!-- Bootstrap style -->
    <link rel="stylesheet" href="/static/style/css/hero-slider-style.css">
    <!-- Hero slider style (https://codyhouse.co/gem/hero-slider/) -->
    <link rel="stylesheet" href="/static/style/css/magnific-popup.css">
    <!-- Magnific popup style (http://dimsemenov.com/plugins/magnific-popup/) -->
    <link rel="stylesheet" href="/static/style/css/tooplate-style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- Content -->
<div class="cd-hero">

    <!-- Navigation -->
    <div class="cd-slider-nav">
        <nav class="navbar">
            <div class="tm-navbar-bg">

                <a class="navbar-brand text-uppercase" href="#"><i class="fa fa-gears tm-brand-icon"></i>海底捞</a>

                <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#tmNavbar">
                    &#9776;
                </button>
               <%-- <div class="collapse navbar-toggleable-md text-xs-center text-uppercase tm-navbar" id="tmNavbar">
                   <ul class="nav navbar-nav">
                       <li class="nav-item active selected">
                           <a class="nav-link" href="#0" data-no="1">Multi One <span class="sr-only">(current)</span></a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="#0" data-no="2">TWO</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="#0" data-no="3">Multi Three</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="/beforeIndexView" data-no="4">Our Team</a>
                       </li>
                   </ul>
               </div>--%>
                <div class="collapse navbar-toggleable-md text-xs-center text-uppercase tm-navbar" id="tmNavbar">
                    <ul class="nav navbar-nav">
                        <li class="nav-item active selected">
                            <a class="nav-link" href="#0" data-no="1">Multi One <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#0" data-no="2">TWO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#0" data-no="3">Multi Three</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/beforeIndexView" data-no="4">Our Team</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <ul class="cd-hero-slider">
        <!-- Page 1 Gallery One -->
        <li class="selected">
            <div class="cd-full-width">
                <div class="container-fluid js-tm-page-content" data-page-no="1" data-page-type="gallery">
                    <div class="tm-img-gallery-container">
                        <div class="tm-img-gallery gallery-one">
                        </div>
                        <c:forEach items="${pvo.products}" var="products">
                            <div class="grid-item">
                                <figure class="effect-bubba">
                                    <form method="post" action="/viewCart/addToCart">
                                        <img src="${products.pimage}" alt="Image" class="img-fluid tm-img"/>
                                        <input type="hidden" name="pid" value="${products.pid}" />
                                        <input type="hidden" id="ptype" value="${products.ptype}">
                                        <h3>
                                                ${products.pname}
                                        </h3>
                                        <p>单价：${products.psalary}</p>
                                        <p>
                                            <input type="submit" value="添加到购物车" class="btn btn-primary" />
                                        </p>
                                    </form>
                                        <%-- 放大图片--%>
                                        <%-- <figcaption>
                                                 <a href="${products.pimage}">View more</a>
                                          </figcaption>--%>
                                </figure>
                                <a href="${pageContext.request.contextPath}/beforeInfo?ptype=${products.ptype}&pageNum=1"> 首页</a>
                                <a href="${pageContext.request.contextPath}/beforeInfo?ptype=${products.ptype}&pageNum=${pco.prePage}">上一页</a>
                                <c:forEach items="${pco.navigatepageNums}" var="p">
                                    <a href="/beforeInfo?ptype=${products.ptype}&pageNum=${p}"> ${p}</a>
                                </c:forEach>
                                <a href="${pageContext.request.contextPath}/beforeInfo?ptype=${products.ptype}&pageNum=${pco.nextPage}">下一页</a>
                                <a href="${pageContext.request.contextPath}/beforeInfo?ptype=${products.ptype}&pageNum=${pco.pages}">尾页</a>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </li>
    </ul> <!-- .cd-hero-slider -->


    <!-- Page 2 Gallery Two -->
    <li>
        <div class="cd-full-width">
            <div class="container-fluid js-tm-page-content" data-page-no="2" data-page-type="gallery">
                <div class="tm-img-gallery-container">
                    <div class="tm-img-gallery gallery-two">
                        <!-- Gallery Two pop up connected with JS code below -->

                        <div class="tm-img-gallery-info-container">
                            <h2 class="tm-text-title tm-gallery-title"><span class="tm-white">Multi Two Gallery</span></h2>
                            <p class="tm-text"><span class="tm-white">Etiam gravida et elit vitae maximus. Pellentesque fringilla felis id feugiat consectetur. Sed quis commodo leo. Nunc aliquet auctor nunc, sit amet pharetra metus commodo ut.</span>
                            </p>
                        </div>
                        <div class="grid-item">
                            <figure class="effect-bubba">
                                <img src="img/tm-img-12-tn.jpg" alt="Image" class="img-fluid tm-img">
                                <figcaption>
                                    <h2 class="tm-figure-title">Picture <span>One</span></h2>
                                    <p class="tm-figure-description">Suspendisse id placerat risus. Mauris quis luctus risus.</p>
                                    <a href="img/tm-img-12.jpg">View more</a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </li>



</div> <!-- .cd-hero -->

<!-- Preloader, https://ihatetomatoes.net/create-custom-preloading-screen/ -->

<!-- load JS files -->
<script src="/static/style/js/jquery-1.11.3.min.js"></script>         <!-- jQuery (https://jquery.com/download/) -->
<script src="/static/style/js/tether.min.js"></script> <!-- Tether for Bootstrap (http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h) -->
<script src="/static/style/js/bootstrap.min.js"></script>             <!-- Bootstrap js (v4-alpha.getbootstrap.com/) -->
<script src="/static/style/js/hero-slider-main.js"></script>          <!-- Hero slider (https://codyhouse.co/gem/hero-slider/) -->
<script src="/static/style/js/jquery.magnific-popup.min.js"></script> <!-- Magnific popup (http://dimsemenov.com/plugins/magnific-popup/) -->


<script>
    $(function () {
        $("#btnFirst").click(function () {
            var firstdzi='http://localhost:8070/beforeInfo?ptype='+$("#ptype").val()+'pageNum='+1
            $("#first").attr('href',firstdzi);
            $("#first").click();
        })
    })
</script>

<%--<script>

    function adjustHeightOfPage(pageNo) {

        var offset = 80;
        var pageContentHeight = 0;

        var pageType = $('div[data-page-no="' + pageNo + '"]').data("page-type");

        if( pageType != undefined && pageType == "gallery") {
            pageContentHeight = $(".cd-hero-slider li:nth-of-type(" + pageNo + ") .tm-img-gallery-container").height();
        }
        else {
            pageContentHeight = $(".cd-hero-slider li:nth-of-type(" + pageNo + ") .js-tm-page-content").height() + 20;
        }

        if($(window).width() >= 992) { offset = 120; }
        else if($(window).width() < 480) { offset = 40; }

        // Get the page height
        var totalPageHeight = $('.cd-slider-nav').height()
            + pageContentHeight + offset
            + $('.tm-footer').height();

        // Adjust layout based on page height and window height
        if(totalPageHeight > $(window).height())
        {
            $('.cd-hero-slider').addClass('small-screen');
            $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", totalPageHeight + "px");
        }
        else
        {
            $('.cd-hero-slider').removeClass('small-screen');
            $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", "100%");
        }
    }

    /*
        Everything is loaded including images.
    */
    $(window).load(function(){

        adjustHeightOfPage(1); // Adjust page height

        /* Gallery One pop up
        -----------------------------------------*/
        $('.gallery-one').magnificPopup({
            delegate: 'a', // child items selector, by clicking on it popup will open
            type: 'image',
            gallery:{enabled:true}
        });

        /* Gallery Two pop up
        -----------------------------------------*/
        $('.gallery-two').magnificPopup({
            delegate: 'a',
            type: 'image',
            gallery:{enabled:true}
        });

        /* Gallery Three pop up
        -----------------------------------------*/
        $('.gallery-three').magnificPopup({
            delegate: 'a',
            type: 'image',
            gallery:{enabled:true}
        });

        /* Collapse menu after click
        -----------------------------------------*/
        $('#tmNavbar a').click(function(){
            $('#tmNavbar').collapse('hide');

            adjustHeightOfPage($(this).data("no")); // Adjust page height
        });

        /* Browser resized
        -----------------------------------------*/
        $( window ).resize(function() {
            var currentPageNo = $(".cd-hero-slider li.selected .js-tm-page-content").data("page-no");

            // wait 3 seconds
            setTimeout(function() {
                adjustHeightOfPage( currentPageNo );
            }, 1000);

        });

        // Remove preloader (https://ihatetomatoes.net/create-custom-preloading-screen/)
        $('body').addClass('loaded');

    });
</script>--%>
</body>
</html>
