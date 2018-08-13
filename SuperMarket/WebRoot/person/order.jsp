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

		<title>订单管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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
								<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/orderaction/queryorder" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/home/shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
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

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab4">待收货</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status3">
											<s:iterator value="#session.orderlist">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><s:property value="ding_id"/></a></div>
													<span>成交时间：<s:property value="ding_date"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														
															
															<s:iterator value="shopcart_list">
															<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="../new_images/<s:property value="id"/>.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p><s:property value="name"/></p>
																			<p class="info-little"><s:property value="discription"/>
																				<br/>类别：<s:property value="type"/> </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	￥<s:property value="price"/>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="count"/>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<s:property value="ding_status"/>
																</div>
															</li>
															
															
														</ul>
													</s:iterator>
														

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：￥<s:property value="ding_toatls"/>
																<p>含运费：<span>￥5.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="Mystatus">五&hearts;好评返现</p>
																		</div>
															</li>
															<li class="td td-change">
																<s:if test="ding_status=='已完成'">
																<div class="am-btn am-btn-danger anniu">
																	已完成
																</div>
																</s:if>
																<s:else>
																<div class="am-btn am-btn-danger anniu" onclick="ackorder(<s:property value="ding_id"/>)">
																	确认收货
																</div>
																</s:else>
															</li>
														</div>
													</div>
												</div>
												</s:iterator>

											</div>

										</div>

									</div>

								</div>
								<script type="text/javascript">
							function ackorder(id){
								
								$.post("${pageContext.request.contextPath}/orderaction/ackorder",{orderid:id},
										function(status){
										alert("好评返现哟~");
										location.reload();
								});
								
							}
								</script>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
										<div class="order-main">
										<div class="order-list">
											<div class="order-status3">
											<s:iterator value="#session.orderlist">
												<s:if test="ding_status!='已完成'">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><s:property value="ding_id"/></a></div>
													<span>成交时间：<s:property value="ding_date"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														
															
															<s:iterator value="shopcart_list">
															<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="../new_images/<s:property value="id"/>.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p><s:property value="name"/></p>
																			<p class="info-little"><s:property value="discription"/>
																				<br/>类别：<s:property value="type"/> </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	￥<s:property value="price"/>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="count"/>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html"><s:property value="ding_status"/></a>
																</div>
															</li>
															
															
														</ul>
													</s:iterator>
														

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：￥<s:property value="ding_toatls"/>
																<p>含运费：<span>￥5.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="Mystatus">五&hearts;好评返现</p>
																		</div>
															</li>
															<li class="td td-change">
																<s:if test="ding_status=='已完成'">
																<div class="am-btn am-btn-danger anniu">
																	已完成
																</div>
																</s:if>
																<s:else>
																<div class="am-btn am-btn-danger anniu" onclick="ackorder(<s:property value="ding_id"/>)">
																	确认收货
																</div>
																</s:else>
															</li>
														</div>
													</div>
												</div>
												</s:if>
												</s:iterator>

											</div>

										</div>

									</div>
								</div>

							
							</div>

						</div>
					</div>
				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">腻歪科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
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
							<em>© 2015-2025 NiWai.com 版权所有. <a href="" target="_blank" title="">腻歪之家</a> - Collect from <a href="" title="" target="_blank">腻歪</a></em>
						</p>
					</div>

				</div>
			</div>
			
		<aside class="menu">
				<ul>
					<li >
						<a href="${pageContext.request.contextPath}/orderaction/queryorder">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人信息</a>
						<ul>
							<li > <a href="${pageContext.request.contextPath}/person/information.jsp">个人资料</a></li>
							
							<li > <a href="${pageContext.request.contextPath}/person/address.jsp">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li class="person active"><a href="${pageContext.request.contextPath}/person/order.jsp">订单管理</a></li>
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