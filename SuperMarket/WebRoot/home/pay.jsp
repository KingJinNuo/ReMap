<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<%@page import="user.User"%>
<%@page import="orders.ShopCart"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>结算页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

	<link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/address.js"></script>
</meta>
</head>
	
<body >

	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<%
						User user = (User) session.getAttribute("curruser");
					%>
					<%
					
						if (user == null || user.getId() == null) {
					%>
					<a href="${pageContext.request.contextPath}/home/login.jsp"
						target="_top" class="h">亲,请<font
						style="color:orange;padding: 10px;font-weight: bold; ">登录</font></a> <a
						href="${pageContext.request.contextPath}/home/register.jsp"
						target="_top"><font style="color:orange;font-weight: bold; ">免费注册</font></a>
					<%
						} else {
					%>
					<%
						if (user.getId() != null && user.getNickName().equals("**")) {
					%>
					亲爱的,<%=user.getId()%>,欢迎光临！
					<%
						}
							if (user.getId() != null && !user.getNickName().equals("**")) {
					%>
					亲爱的,<%=user.getNickName()%>,欢迎光临！
					<%
						}
						}
					%>

				</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="${pageContext.request.contextPath}/action/cancel"
						target="_top" class="h"><h5>没想好离开<h5></a>
				</div>
			</div>
			
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="../images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="../images/logobig.png" /></li>
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
	<script type="text/javascript">
		function checklogin() {
			check_login
			$.post("${pageContext.request.contextPath}/orderaction/forceLogin",
				function(status) {
					if (status == "false") {
						alert("请点左上角登录哟！");
						location.href="${pageContext.request.contextPath}/home/login.jsp"
						return false;
					}
	
				}
			);
	
		}
	</script>
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger"
						id="check_login" onclick="return checklogin()">使用新地址</div>
				</div>
				<div class="clear"></div>

				<%
					int k = 0;
				%>
				<ul>
					<s:iterator value="#session.addressList" var="add">
						<div class="per-border"></div>

						<li class="user-addresslist"
							onclick="addresschoose(<s:property value="ad_id" />)">
							<div class="address-left">
								<div class="user DefaultAddr">

									<span class="buy-address-detail"> <span class="buy-user"><s:property
												value="ad_name" /> </span> <span class="buy-phone"><s:property
												value="ad_tel" /></span>
									</span>
								</div>
								<div class="default-address DefaultAddr">
									<span class="buy-line-title buy-line-title-type">收货地址：</span>
									<s:property value="ad_add" />

									</span>
								</div>

							</div>

							<div class="clear"></div>
							<div class="new-addr-btn"></div>

						</li>


						<%
							k++;
						%>
					</s:iterator>
				</ul>

				<div class="clear"></div>
			</div>

			<div class="clear"></div>

			<!--支付方式-->
			<div class="logistics">
				<h3>选择支付方式</h3>
				<ul class="pay-list">
					<li class="pay card"><img src="../images/wangyin.jpg" />银联<span></span></li>
					<li class="pay qq"><img src="../images/weizhifu.jpg" />微信<span></span></li>
					<li class="pay taobao"><img src="../images/zhifubao.jpg" />支付宝<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last">

							<div class="bundle-main">
								<s:iterator value="#session.ordercart" var="newgood" status="k">
									<ul class="item-content clearfix">
										<div class="pay-phone">
											<li class="td td-item">
												<div class="item-pic">
													<a
														href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>"
														class="J_MakePoint"> <img
														src="../new_images/<s:property value="id"/>.jpg"
														width="80px" height="90px" class="itempic J_ItemImg"></a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<a
															href="${pageContext.request.contextPath}/goods/introduction?goodsId=<s:property value="id"/>"
															class="item-title J_MakePoint" data-point="tbcart.8.11"><s:property
																value="name" /></a>
													</div>
												</div>
											</li>
											<li class="td td-info">
												<div class="item-props">
													<span class="sku-line"><s:property
															value="discription" /></span> <span class="sku-line"></span>
												</div>
											</li>
											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now">￥<s:property
																value="price" /></em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<span class="phone-title">购买数量</span>
													<div class="sl">
														<s:property value="count" />
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number">￥${ordercart[k.index].price*ordercart[k.index].count}</em>
											</div>
										</li>
										<li class="td td-oplist">
											<div class="td-inner">
												<span class="phone-title">配送方式</span>
												<div class="pay-logis">
													快递<b class="sys_item_freprice">5</b>元
												</div>
											</div>
										</li>

									</ul>
								</s:iterator>
								<div class="clear"></div>

							</div>
					</tr>

					<div class="clear"></div>
				</div>


			</div>
			<div class="clear"></div>
			<div class="pay-total">
				<!--留言-->
				<div class="order-extra">
					<div class="order-user-info">
						<div id="holyshit257" class="memo">
							<label>买家留言：</label> <input type="text"
								title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
								placeholder="选填,建议填写和卖家达成一致的说明"
								class="memo-input J_MakePoint c2c-text-default memo-close">
								<div class="msg hidden J-msg">
									<p class="error">最多输入500个字符</p>
								</div>
						</div>
					</div>

				</div>

				<div class="clear"></div>
			</div>
			<!--含不运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计（不含运费） <span>¥</span><em class="pay-sum"><s:property
							value="#session.ordertotals" /></em>
				</p>
			</div>

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red " id="J_ActualFee">
									${ordertotals+5} </em>
							</span>
						</div>

						<div id="holyshit268" class="pay-address">

							<p class="buy-footer-address">
								<span class="buy-line-title buy-line-title-type">寄送至：</span> <span
									id="holyshit268_1"><font size="4px">河南省 | 郑州市 |
										金水区 | 大中华小区:&nbsp; ${usingaddress.ad_add}</font></span>
							</p>
							<p class="buy-footer-address">
								<div style="margin-left:0px;color: orange;">
									<font size="4px" style="font-weight: bold;">满￥30运费结账时自动减</font>
								</div>
								<span class="buy-line-title">收货人：</span> <span
									class="buy-address-detail"> <span class="buy-user"
									id="holyshit268_2"> ${usingaddress.ad_name}</span> <span
									class="buy-phone" id="holyshit268_3">${usingaddress.ad_tel}</span>
								</span>
							</p>
						</div>
					</div>

					<div id="holyshit269" class="submitOrder">
						<div class="go-btn-wrap">
							<a id="J_Go"
								href="${pageContext.request.contextPath}/orderaction/createorder"
								onclick="return checklogin()" class="btn-go" tabindex="0"
								title="点击此按钮，提交订单">提交订单</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	<script type="text/javascript">
		function addresschoose(id) {
			$.post("${pageContext.request.contextPath}/order/chooseaddress", {
				chooseNumber : id
			},
				function(status) {
					location.reload(true);
				}
	
			);
		}
	</script>
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
					href="#">网站地图</a> <em>© 2015-2025 NiWai.com 版权所有<a href=""
					target="_blank">腻歪之家</a> - Collect from <a href="" title=""
					target="_blank">腻歪</a></em>
			</p>
		</div>
	</div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form class="am-form am-form-horizontal">

				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" id="user-name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" placeholder="手机号必填" type="email">
					</div>
				</div>



				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro"
							placeholder="输入详细地址 如：楼号-房间号"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<div class="am-btn am-btn-danger close"
							onclick="return newaddress()">保存</div>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<script type="text/javascript">
		function newaddress() {
			var user_name = $("input[id=user-name]").val();
			var user_phone = $("input[id=user-phone]").val();
			var user_address = $("textarea[id=user-intro]").val();
			if (user_name == "" || user_phone == "" || user_address == "") {
				return false;
			}
			$.post("${pageContext.request.contextPath}/orderaction/newaddress", {
				user_name : user_name,
				user_phone : user_phone,
				user_address : user_address
			},
				function(status) {
					location.reload(true);
					return true;
				}
			);
	
	
		}
	</script>


	<div class="clear"></div>
</body>

</html>