<%--
  Created by IntelliJ IDEA.
  User: 挥霍的人生
  Date: 2019/12/21
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/before/css/reset.css" />

    <link rel="stylesheet" href="/static/before/css/gbstyle.css" />
</head>
<body style="background:#f4f4f4;">
<!-- header begin -->
<div class="gbhead1">
    <div class="gbhedcontain">
        <p><img src="/static/before/picture/xgbicon.png">当日创业留言 1234678 条</p>
        <ul class="gbhdconul1">
            <li class="gbfl gbhdzs"><a href="#" title="" target="_blank">招商网页</a></li>
            <li class="gbfl">　｜　</li>
            <li class="gbfl"><a href="#" onClick="AddFavorite('餐饮加盟网','http://www.17sucai.com')">收藏网站</a></li>
            <li class="gbfl">　｜　</li>
            <li class="gbfl"><a href="#" title="" target="_blank">手机查商网</a></li>
            <li class="gbfl">　｜　</li>
            <li class="gbfl wxewmli"><a href="#" title="" target="_blank">微信</a>
                <div class="wxewm"><img src="/static/before/picture/xdd.jpg" alt=""></div>
            </li>
            <li class="gbfl">　｜　</li>
            <li class="gbfl"><a href="#" title="" target="_self">联系我们</a></li>
        </ul>
    </div>
</div>
<div class="gbhead2">
    <div class="gbhdcon">
        <div class="gblogo gbfl"><a href="#" title="K18餐饮加盟网"><img src="http://www.17sucai.com/static/i/logo.png" alt=""></a></div>
        <div class="gbsecdivaa">
            <div class="gbsearch">
                <form id="form1" name="form1" method="get" action="" target="_blank" onSubmit="addSearchSid(this)">
                    <input type="text" placeholder="搜索什么项目？" class="inp_text" name="keyword" id="input_text">
                    <input type="hidden" name="sid" value="">
                    <input type="submit" value="搜索" class="inp_sub log100_listen" data-log100-event="$searchsubmit" id="sub">
                </form>
            </div>
            <p class="gbssp"> 热门搜索：

                <a title="菜立方芽苗菜" href="#" data_1="#" target="_blank">芽 苗 菜</a>
                <a title="五谷联盟煎饼果子" href="#" data_1="#" target="_blank">五谷煎饼</a>
                <a title="疯迷便当" href="#" data_1="#" target="_blank">精品便当</a>
                <a title="摊小二煎饼果子" href="#" data_1="#" target="_blank">煎饼煎饼</a>
                <a title="辛麻到瓦香鸡" href="#" data_1="#" target="_blank">瓦 香 鸡</a>

            </p>
        </div>
        <div class="gbhykh gbfr">
            <div class="out outl5">
                <ul class="img imgl5">
                    <li style="display: list-item;"><a href="#" title="" target="_blank"><img src="/static/before/picture/201902131628142713058.jpg" alt=""></a></li>
                    <li style="display: none;"><a href="#" title="" target="_blank"><img src="/static/before/picture/201902131628542718111.jpg" alt=""></a></li>
                    <li style="display: none;"><a href="#" title="" target="_blank"><img src="/static/before/picture/201902281659422718293.jpg" alt=""></a></li>
                </ul>
                <ul class="num numl5">
                </ul>
                <div class="left btn"></div>
                <div class="right btn"></div>
            </div>
        </div>
    </div>
    <div class="gbnav">
        <div class="gbsjfl"><span><i></i>商机项目分类</span>
            <ul>
                <!-- 选中给a添加check类名-->
                <li>
                    <p class="sxf1">行业直达</p>

                    <a href="" title="" target="_blank">小吃</a>
                    <a href="" title="" target="_blank">快餐</a>
                    <a href="#" title="" target="_blank">面馆</a>
                    <a href="#" title="" target="_blank">饮品</a>
                    <a href="#" title="" target="_blank">火锅</a>
                    <a href="#" title="" target="_blank">麻辣烫<i></i></a>
                    <a href="#" title="" target="_blank">美食街</a>

                </li>
                <li>
                    <p class="sxf2">投资金额</p>

                    <a href="#" title="" target="_blank" class="check">1-3万</a>
                    <a href="#" title="" target="_blank">3-5万</a>
                    <a href="#" title="" target="_blank">5-10万</a>
                    <a href="#" title="" target="_blank">10-20万</a>
                    <a href="#" title="" target="_blank">20万以上</a>

                </li>
                <li>
                    <p class="sxf4">创业店型</p>

                    <a href="#" title="" target="_blank">小吃车</a>
                    <a href="#" title="" target="_blank">临街店<i></i></a>
                    <a href="#" title="" target="_blank">档口门店</a>
                    <a href="#" title="" target="_blank">商场店</a>
                    <a href="#" title="" target="_blank">复合店</a>
                    <a href="#" title="" target="_blank">旗舰店</a>


                </li>
            </ul>
        </div>
        <ul class="nav_ul">
            <!-- 选中给li添加check类名-->
            <li><a href="/productShowInfo?ptype=6" title="中西美食" target="_blank">中西美食</a></li>
            <li><a href="/productShowInfo?ptype=5" title="速食快餐" target="_blank">速食快餐</a></li>
            <li><a href="/productShowInfo?ptype=3" title="酒水饮料" target="_blank">酒水饮料</a></li>
            <li><a href="/productShowInfo?ptype=2" title="地方小吃" target="_blank">地方小吃<i></i></a></li>
            <li><a href="#" title="甜点茶myproject@localhost饮" target="_blank">甜点茶饮</a></li>
            <li><a href="/productShowInfo?ptype=4" title="自助餐厅" target="_blank">自助餐厅</a></li>
            <li><a href="/productShowInfo?ptype=6" title="经典美味" target="_blank">经典美味</a></li>
            <li><a href="/productShowInfo?ptype=1" title="特色美食" target="_blank">特色美食</a></li>
            <li><a href="/productShowInfo?ptype=6" title="先行赔付" target="_blank">先行赔付<i></i></a></li>
        </ul>
    </div>
</div>
<!-- header end -->

<div class="gbcont1">
    <ul class="gbco11">
        <li> <a href="/productShowInfo?ptype=1"  title="８元汉堡 全天爆单" target="_blank" class="gbco1ig"><img src="${pageContext.request.contextPath}/static/before/picture/201901281531223754335.jpg" alt=""></a>
            <div class="gbco1dv gbco1dv1">
                <label class="gbco1lb">汉堡</label>
                <a href="/productShowInfo?ptype=1"  title="" target="_blank">麦塔基汉堡</a>
                <p>８元汉堡 全天爆单</p>
                <a href="/productShowInfo?ptype=1"  title="８元汉堡 全天爆单" target="_blank" class="gbco1ck">立即查看</a> </div>
        </li>
        <li> <a href="/productShowInfo?ptype=2"  title="海鲜零食 万元开店" target="_blank" class="gbco1ig"><img src="${pageContext.request.contextPath}/static/before/picture/201901311435002714771.jpg" alt=""></a>
            <div class="gbco1dv gbco1dv2">
                <label class="gbco1lb">小吃</label>
                <a href="/productShowInfo?ptype=2"  title="" target="_blank">漫鲸捞汁小海鲜</a>
                <a href="/productShowInfo?ptype=2"  title="海鲜零食 万元开店" target="_blank" class="gbco1ck">立即查看</a> </div>
        </li>
        <li> <a href="/productShowInfo?ptype=7"  title="粗粮煎饼 酥脆好吃" target="_blank" class="gbco1ig"><img src="${pageContext.request.contextPath}/static/before/picture/201901111451162717397.png" alt=""></a>
            <div class="gbco1dv gbco1dv3">
                <label class="gbco1lb">煎饼</label>
                <a href="#"  title="" target="_blank">石小沫煎饼果儿</a>
                <p>粗粮煎饼 酥脆好吃</p>
                <a href="/productShowInfo?ptype=7"  title="粗粮煎饼 酥脆好吃" target="_blank" class="gbco1ck">立即查看</a> </div>
        </li>
        <li> <a href="/productShowInfo?ptype=4"  title="麻辣海鲜 人手一杯" target="_blank" class="gbco1ig"><img src="${pageContext.request.contextPath}/static/before/picture/201902101827112717806.jpg" alt=""></a>
            <div class="gbco1dv gbco1dv4">
                <label class="gbco1lb">小吃</label>
                <a href="/productShowInfo?ptype=4"  title="" target="_blank">赶海鲜生即食小海鲜</a>
                <p>麻辣海鲜 人手一杯</p>
                <a href="/productShowInfo?ptype=4"  title="麻辣海鲜 人手一杯" target="_blank" class="gbco1ck">立即查看</a> </div>
        </li>
    </ul>
</div>
</body>
</html>
