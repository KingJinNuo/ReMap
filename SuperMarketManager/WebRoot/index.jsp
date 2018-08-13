<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<%@page import="orderlist.User"%>
<%@page import="orderlist.ShopCart"%>
<%@page import="orderlist.OrderInfo"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="css/personal.css" rel="stylesheet" type="text/css">
<link href="css/orstyle.css" rel="stylesheet" type="text/css">

<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<%
	response.setHeader("refresh", "30");
%>
</head>

<body onload="init()">
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logoBig">
						<li><img src="images/logobig.png" /></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text"
								placeholder="搜索" autocomplete="off"> <input
								id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
								type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
			</div>
		</article>
	</header>

	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>

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
													<div class="dd-num">
														订单编号：<a href="javascript:;"><s:property
																value="ding_id" /></a>
													</div>
													<span>收货人：<s:property value="ding_Address.ad_name" />&nbsp;&nbsp;&nbsp;&nbsp;
													</span> <span>电话：<s:property value="ding_Address.ad_tel" />&nbsp;&nbsp;&nbsp;&nbsp;
													</span> <span>地址：<s:property value="ding_Address.ad_add" />&nbsp;&nbsp;&nbsp;&nbsp;
													</span> <span>交易时间：<s:property value="ding_date" /></span> <span>
														发起人：<s:property value="ding_userid" />
													</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">


														<s:iterator value="shopcart_list">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint"> <img
																			src="new_images/<s:property value="id"/>.jpg"
																			class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>
																					<s:property value="name" />
																				</p>
																				<p class="info-little">
																					<s:property value="discription" />
																					<br />类别：
																					<s:property value="type" />
																				</p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		￥
																		<s:property value="price" />
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>
																		<s:property value="count" />
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
																		<s:property value="ding_status" />
																	</div>
																</li>


															</ul>
														</s:iterator>


													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：￥
																<s:property value="ding_toatls" />
																<p>
																	含运费：<span>￥5.00</span>
																</p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="Mystatus">五&hearts;好评返现</p>
																</div>
															</li>
															<li class="td td-change"><s:if
																	test="ding_status=='已完成'">
																	<div class="am-btn am-btn-danger anniu">已完成</div>
																</s:if> <s:else>
																	<div class="am-btn am-btn-danger anniu"
																		onclick="ackorder(<s:property value="ding_id"/>)">
																		确认收货</div>
																</s:else></li>
														</div>
													</div>
												</div>
											</s:iterator>

										</div>

									</div>

								</div>

							</div>
							<script type="text/javascript">
								function init(){
									$.post("${pageContext.request.contextPath}/orderlistaction/queryallorders",
											{pp:1},function(status){
											});
									
								}
		
							function paging(pp){
								if(pp>0&&pp<=${an/6+1}){
								$.post("${pageContext.request.contextPath}/queryallorders",
										{pp:pp},function(status){
											location.reload();
											return true;	
										});
								}else return false;
								}
								</script>


						</div>

					</div>
				</div>

			</div>
			<div>
				<center>
					<input id="fenid" onclick="return paging(${pp-1})" style=""
						type="button" value="<<上一页" />
					<s:property value="#session.pp" />
					/
					<s:property value="#session.an/6+1" />
					<input id="fenid" onclick="return paging(${pp+1})" type="button"
						value="下一页>>" />
				</center>
			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">腻歪科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于腻歪</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a> <em>© 2015-2025 NiWai.com 版权所有. <a href=""
							target="_blank" title="">腻歪之家</a> - Collect from <a href=""
							title="" target="_blank">腻歪</a></em>
					</p>
				</div>

			</div>
		</div>


	</div>

</body>

</html>