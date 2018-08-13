<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="user.User" %>
<%@page import="goods.Goods" %>
<%@page import="goods.Fen" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="../css/hmstyle.css" rel="stylesheet" type="text/css"/>
		<link href="../css/skin.css" rel="stylesheet" type="text/css" />
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	</head>

	<body>
		<div class="hmtop">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
						<%User user = (User)session.getAttribute("curruser");%>
						<%if(user==null){ %>
						<a href="${pageContext.request.contextPath}/home/login.jsp" target="_top" class="h">亲,请<font style="color:orange;padding: 10px;font-weight: bold; ">登录</font></a>
						<a href="${pageContext.request.contextPath}/home/register.jsp" target="_top"><font style="color:orange;font-weight: bold; ">免费注册</font></a>
						<%}else{%>
						<%if(user.getId()!=null&&user.getNickName().equals("**")){ %>
						亲爱的,<%=user.getId()%>,欢迎光临！
						<%}%>
						<%if(!user.getNickName().equals("**")){ %>
						亲爱的,<%=user.getNickName()%>,欢迎光临！
						<%}}%>
						
					
						</div>
					</div>
				</ul>
				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/action/toMain" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/orderaction/queryorder" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/home/shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logo"><img src="../images/logo.png" /></div>
					<div class="logoBig">
						<li><img src="../images/logobig.png" /></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
			<div class="banner">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a><img src="../images/ad1.jpg" /></a></li>
								<li class="banner2"><a><img src="../images/ad2.jpg" /></a></li>
								<li class="banner3"><a><img src="../images/ad3.jpg" /></a></li>
								<li class="banner4"><a><img src="../images/ad4.jpg" /></a></li>

							</ul>
						</div>
						<div class="clear"></div>	
			</div>
			<div class="shopNav">
				<div class="slideall">
					
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>					
		        				
						<!--侧边导航 -->
						<div id="nav" class="navfull">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									
									<div class="category">
										<ul class="category-list" id="js_climit_li">
											
											<s:iterator value="fen" var="f">
											<li class="appliance js_toggle relative first">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/cake.png"></i><a class="ml-22" title="点心"><s:property value="fenName" /></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	
																<dl class="dl-sort">
																<dt><span title="蛋糕"><s:property value="fenName" /></span></dt>
																
																<s:iterator value="gdslist" var="gds">
																<s:if test="fgds==fenId">
																<dd><a title="<s:property value="name" />" href="#"><span><s:property value="name" /></span></a></dd>
																</s:if>
										
																</s:iterator>
																</dl>
																</div>
															
															</div>
														</div>
													</div>
												</div>
											<b class="arrow"></b>	
											</li>
											</s:iterator>
											
											
											</li>
										</ul>
									</div>
								</div>

							</div>
						</div>
						
						
						<!--轮播-->
						
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>



				

					<div class="clear"></div>
				</div>
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->

					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" ">
							<img src="../images/2016.png "></img>
							<p>今日<br>推荐</p>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>真的有鱼</h3>
								<h4>开年福利篇</h4>
							</div>
							<div class="recommendationMain one">
								<a href="introduction.html"><img src="../images/tj.png "></img></a>
							</div>
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>囤货过冬</h3>
								<h4>让爱早回家</h4>
							</div>
							<div class="recommendationMain two">
								<img src="../images/tj1.png "></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>浪漫情人节</h3>
								<h4>甜甜蜜蜜</h4>
							</div>
							<div class="recommendationMain three">
								<img src="../images/tj2.png "></img>
							</div>
						</div>

					</div>
					<div class="clear "></div>
					<!--热门活动 -->

					<div class="am-container activity ">
						<div class="shopTitle ">
							<h4>活动</h4>
							<h3>每期活动 优惠享不停 </h3>
							<span class="more ">
                              <a href="# ">全部活动<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					  <div class="am-g am-g-fixed ">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>	
								<h4>秒杀</h4>							
							<div class="activityMain ">
								<img src="../images/activity1.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>														
						</div>
						
						<div class="am-u-sm-3 ">
						  <div class="icon-sale two "></div>	
							<h4>特惠</h4>
							<div class="activityMain ">
								<img src="../images/activity2.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>								
							</div>							
						</div>						
						
						<div class="am-u-sm-3 ">
							<div class="icon-sale three "></div>
							<h4>团购</h4>
							<div class="activityMain ">
								<img src="../images/activity3.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>							
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="icon-sale "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="../images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>													
						</div>

					  </div>
                   </div>
					<div class="clear "></div>


  					
  					<s:iterator value="gdslist"  status="h"  >
                   	<s:if test="#h.index%6==0">
                    <s:if test="#h.index==0">
                    <div id="f1">
                    </s:if>
                    <s:elseif test="#h.index==6">
                    <div id="f2">
                    </s:elseif>
                    <s:elseif test="#h.index==12">
                    <div id="f3">
                    </s:elseif>
                    <s:elseif test="#h.index==18">
                    <div id="f4">
                    </s:elseif>
                    <s:elseif test="#h.index==24">
                    <div id="f5">
                    </s:elseif>
                    <s:elseif test="#h.index==30">
                    <div id="f6">
                    </s:elseif>
                    <s:elseif test="#h.index==36">
                    <div id="f7">
                    </s:elseif>
                    <s:else>
                    <div id="f8">
                    </s:else>
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>悦桔啦啦</h4>
							<h3>酸酸甜甜，就是生活</h3>
							<div class="today-brands ">
								<a href="# ">腰果</a>
								<a href="# ">松子</a>
								<a href="# ">夏威夷果 </a>
								<a href="# ">碧根果</a>
								<a href="# ">开心果</a>
								<a href="# ">核桃仁</a>
							</div>
							<span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
				
					<div class="am-g am-g-fixed floodThree ">
						
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<a class="outer" href="#"><span class="inner"><font color="blue" size="3"><b>爱</b></font></span></a>
								<a class="outer" href="#"><span class="inner"><font color="red" size="3">生</font></span></a>
								<a class="outer" href="#"><span class="inner"><font color="purple" size="3">活</font></span></a>	
								<a class="outer" href="#"><span class="inner"><font color="orange" size="3">上</font></span></a>
								<a class="outer" href="#"><span class="inner"><font color="grey" size="3">悦</font></span></a>
								<a class="outer" href="#"><span class="inner"><font color="black" size="3">桔</font></span></a>									
							</div>
							<a href="# ">
								<img src="../images/act1.png " />
								<div class="outer-con ">
									<div class="title ">
										雪之恋和风大福
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						
						<div class="am-u-sm-4 text-four">
							<a href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>">
								<img src="../new_images/<s:property value="id"/>.jpg" />
								<div class="outer-con ">
									<div class="title ">
										<s:property value="name"/>	
									</div>								
									<div class="sub-title ">
										￥<s:property value="price"/>
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						</s:if>
						<s:if test="#h.index%6==1">
						<div class="am-u-sm-4 text-four sug">
							<a href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>">
								<img src="../new_images/<s:property value="id"/>.jpg" />
								<div class="outer-con ">
									<div class="title ">
										<s:property value="name"/>
									</div>
									<div class="sub-title ">
										￥<s:property value="price"/>
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
							
						</div>
						</s:if>
					
						<s:if test="#h.index%6==2">
						<div class="am-u-sm-6 am-u-md-3 text-five big ">
							<a href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>">
								<img src="../new_images/<s:property value="id"/>.jpg" />
								<div class="outer-con ">
									<div class="title ">
										<s:property value="name"/>
									</div>		
									<div class="sub-title ">
										￥<s:property value="price"/>
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>	
						
						</s:if>
									
						<s:if test="#h.index%6==3">
					  <div class="am-u-sm-6 am-u-md-3 text-five ">
							<a href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>">
								<img src="../new_images/<s:property value="id"/>.jpg" />
								<div class="outer-con ">
									<div class="title ">
										<s:property value="name"/>
									</div>	
									<div class="sub-title ">
										￥<s:property value="price"/>
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						
						</s:if>	
						<s:if test="#h.index%6==4">
					  	<div class="am-u-sm-6 am-u-md-3 text-five sug">
							<a href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>">
								<img src="../new_images/<s:property value="id"/>.jpg" />
								<div class="outer-con ">
									<div class="title ">
										<s:property value="name"/>
									</div>
									<div class="sub-title ">
										￥<s:property value="price"/>
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						
						</div>
						</s:if>
						<s:if test="#h.index%6==5">
					  	<div class="am-u-sm-6 am-u-md-3 text-five big">
							<a href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>">
								<img src="../new_images/<s:property value="id"/>.jpg" />
								<div class="outer-con ">
									<div class="title ">
										<s:property value="name"/>
									</div>			
									<div class="sub-title ">
										￥<s:property value="price"/>
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
							</a>
						</div>
						</div>
						</div>
						</s:if>
				</s:iterator>
        		
                   
					<div class="clear "></div>
					</div>
   
   
   
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">腻歪科技</a>
								<b>|</b>
								<a href="# ">商城首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于腻歪</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>© 2015-2025 NiWai.com 版权所有 <a href="" target="_blank" title="">腻歪之家</a> - Collect from 腻歪</a></em>
							</p>
						</div>
					</div>

		</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>


		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="prof" class="item ">
						<a href="# ">
							<span class="setting "></span>
						</a>
						<div class="ibar_login_box status_login ">
							<div class="avatar_box ">
								<p class="avatar_imgbox "><img src="../images/no-img_mid_.jpg " /></p>
								<ul class="user_info ">
									<li>用户名sl1903</li>
									<li>级&nbsp;别普通会员</li>
								</ul>
							</div>
							<div class="login_btnbox ">
								<a href="# " class="login_order ">我的订单</a>
								<a href="# " class="login_favorite ">我的收藏</a>
							</div>
							<i class="icon_arrow_white "></i>
						</div>

					</div>
					<div id="shopCart " class="item ">
						<a href="${pageContext.request.contextPath}/home/shopcart.jsp">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num "></p>
						
					</div>
					<div id="asset " class="item ">
						<a href="# ">
							<span class="view "></span>
						</a>
						<div class="mp_tooltip ">
							我的资产
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="foot " class="item ">
						<a href="# ">
							<span class="zuji "></span>
						</a>
						<div class="mp_tooltip ">
							我的足迹
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="brand " class="item ">
						<a href="#">
							<span class="wdsc "><img src="../images/wdsc.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我的收藏
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div id="broadcast " class="item ">
						<a href="# ">
							<span class="chongzhi "><img src="../images/chongzhi.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我要充值
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div class="quick_toggle ">
						<li class="qtitem ">
							<a href="${pageContext.request.contextPath}/home/chat.jsp"><span class="kfzx "></span></a>
							<div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
						</li>
						<!--二维码 -->
						<li class="qtitem ">
							<a href="#none "><span class="mpbtn_qrcode "></span></a>
							<div class="mp_qrcode " style="display:none; "><img src="../images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
						</li>
						<li class="qtitem ">
							<a href="#top " class="return_top "><span class="top "></span></a>
						</li>
					</div>

					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>

			</div>
			<div id="prof-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				
				<div>
				购物车
				</div>
				
			</div>
			<div id="asset-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					资产
				</div>

				<div class="ia-head-list ">
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">优惠券</div>
					</a>
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">红包</div>
					</a>
					<a href="# " target="_blank " class="pl money ">
						<div class="num ">￥0</div>
						<div class="text ">余额</div>
					</a>
				</div>

			</div>
			<div id="foot-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					足迹
				</div>
			</div>
			<div id="brand-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					收藏
				</div>
			</div>
			<div id="broadcast-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					充值
				</div>
			</div>
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="../basic/js/quick_links.js "></script>
	</body>

</html>