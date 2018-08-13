<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*"%> 
<%@page import="user.User" %>
<%@page import="orders.ShopCart" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人中心</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/systyle.css" rel="stylesheet" type="text/css">
		
		<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>
		

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
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
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
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
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="${pageContext.request.contextPath}/action/toMain">首页</a></li>
                                <li class="qc"><a href="${pageContext.request.contextPath}/action/toMain">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="wrap-left">
						<div class="wrap-list">
							<div class="m-user">
								<!--个人信息 -->
								<div class="m-bg"></div>
								<div class="m-userinfo">
									<div class="m-baseinfo">
										<a href="information.jsp">
											<img src="../images/getAvatar.do.jpg">
										</a>
										<em class="s-name">(小叮当)<span class="vip1"></em>
										<div class="s-prestige am-btn am-round">
											</span>会员福利</div>
									</div>
									<div class="m-right">
										<div class="m-new">
											<a href="news.jsp"><i class="am-icon-bell-o"></i>消息</a>
										</div>
										<div class="m-address">
											<a href="address.jsp" class="i-trigger">我的收货地址</a>
										</div>
									</div>
								</div>

								<!--个人资产-->
								<div class="m-userproperty">
									<div class="s-bar">
										<i class="s-icon"></i>个人资产
									</div>
									<p class="m-bonus">
										<a href="${pageContext.request.contextPath}/person/bonus.jsp">
											<i><img src="../images/bonus.png"/></i>
											<span class="m-title">红包</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-coupon">
										<a href="${pageContext.request.contextPath}/person/coupon.jsp">
											<i><img src="../images/coupon.png"/></i>
											<span class="m-title">优惠券</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-bill">
										<a href="${pageContext.request.contextPath}/person/bill.jsp">
											<i><img src="../images/wallet.png"/></i>
											<span class="m-title">钱包</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-big">
										<a href="#">
											<i><img src="../images/day-to.png"/></i>
											<span class="m-title">签到有礼</span>
										</a>
									</p>
									<p class="m-big">
										<a href="#">
											<i><img src="../images/72h.png"/></i>
											<span class="m-title">72小时发货</span>
										</a>
									</p>
								</div>
							</div>
							<div class="box-container-bottom"></div>

							
						
							
							<div class="m-logistics">

								<div class="s-bar">
									<i class="s-icon"></i>我的订单
								</div>
								<div class="s-content">
									<ul class="lg-list">
										<s:iterator value="#session.orderlist">
										<p><s:property value="ding_date"/></p>
										<div class="lg-confirm">
												<s:if test="ding_status=='已完成'">
									<a class="i-btn-typical"  href="javascript:void(0)" style="background-color:orange ">已完成</a>
												</s:if>
												<s:else>
												<a class="i-btn-typical" onclick="ackorder(<s:property value='ding_id'/>)" href="javascript:void(0)">确认收货</a>
												</s:else>
											</div>
										<s:iterator value="shopcart_list">
										<li class="lg-item">
											<div class="item-info">
												<a href="#">
													<img src="../new_images/<s:property value="id"/>.jpg" alt="<s:property value="id"/>.jpg">
												</a>

											</div>
											<div class="lg-info">

												<p><s:property value="name"/></p>
												<time></time>

												<div class="lg-detail-wrap">
													<a class="lg-detail i-tip-trigger" href="logistics.html"><s:property value="discription"/></a>
													
												</div>

											</div>
											
										</li>
										</s:iterator>
										
										</s:iterator>
										<div class="clear"></div>

										

									</ul>

								</div>

							</div>

							
						</div>
					</div>
					<div class="wrap-right">
						<script type="text/javascript">
							function ackorder(id){
								
								$.post("${pageContext.request.contextPath}/orderaction/ackorder",{orderid:id},
										function(status){
										alert("666");
										location.reload();
								});
								
							}
						</script>
						<!-- 日历-->
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
								<%Date ud=new Date();%>
									<em><%=ud.getHours()%>:<%=ud.getMinutes()%></em>
									<span>星期<%=ud.getDay() %></span>
									<span><%=ud.getYear()+1900%>.<%=ud.getMonth()+1 %>.<%=ud.getDate() %></span>
								</div>
							</div>
						</div>
						<div>
						
						
						</div>
					
					</div>
				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">腻歪科技</a>
							<b>|</b>
							<a href="${pageContext.request.contextPath}/action/toMain">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于腻歪</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 NiWai.com 版权所有.  <a href="" target="_blank" title="">腻歪之家</a> - Collect from <a href="" title="" target="_blank">腻歪</a></em>
						</p>
					</div>
				</div>

			</div>

	<aside class="menu">
				<ul>
					<li class="person active">
						<a href="#">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人信息</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/person/information.jsp">个人资料</a></li>
							
							<li> <a href="${pageContext.request.contextPath}/person/address.jsp">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/person/order.jsp">订单管理</a></li>
							<li> <a href="#">退款售后</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的资产</a>
						<ul>
							<li> <a href="#">优惠券 </a></li>
							<li> <a href="#">红包</a></li>
							
						</ul>
					</li>

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="#">收藏</a></li>
							<li> <a href="#">足迹</a></li>
							<li> <a href="#">评价</a></li>
							<li> <a href="#">消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>
		
	


		
	</body>

</html>