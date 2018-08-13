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

		<title>地址管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
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
		</div>
		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
							<s:iterator value="#session.addressList" var="add" >
							<li class="user-addresslist defaultAddr">
								<span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
								<p class="new-tit new-p-re">
									<span class="new-txt"><s:property value="ad_name"/></span>
									<span class="new-txt-rd2"><s:property value="ad_tel"/></span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<s:property value="ad_add"/></p>
								</div>
								<div class="new-addr-btn">
									<a href="#"><i class="am-icon-edit"></i></a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);" onclick="delclick(<s:property value='ad_id'/>);"><i class="am-icon-trash"></i>删除</a>
								</div>
							</li>

						</s:iterator>
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
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
												<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a class="am-btn am-btn-danger" onclick="return newaddress()">保存</a>
												<a href="javascript: void(0)" onclick="cancel()" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
						function delclick(id){
							$.post("${pageContext.request.contextPath}/orderaction/deleteaddress",{address_id:id},
									function(status){
									alert("您已经删除了该地址哟~");
									location.reload();
							});
						}
						function cancel(){
							location.reload();
						}
						function  newaddress(){
							var user_name=$("input[id=user-name]").val();
							var user_phone=$("input[id=user-phone]").val();
							var user_address=$("textarea[id=user-intro]").val();
							if(user_name==""||user_phone==""||user_address==""){
								return false;
								}
							$.post("${pageContext.request.contextPath}/orderaction/newaddress",{
									user_name:user_name,user_phone:user_phone,user_address:user_address},
									function(status){
										location.reload(true);
										return true;
									}
							);
							
							
						}
					</script>

					<div class="clear"></div>

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
							<em>© 2015-2025 NiWai.com 版权所有. <a href="" target="_blank" title="">腻歪之家</a> - Collect from <a href="http://www.cssmoban.com/" title="" target="_blank">腻歪</a></em>
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
							<li> <a href="${pageContext.request.contextPath}/person/information.jsp">个人资料</a></li>
							
							<li class="person active"> <a href="${pageContext.request.contextPath}/person/address.jsp">收货地址</a></li>
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