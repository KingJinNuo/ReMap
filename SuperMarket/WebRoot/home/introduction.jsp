<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*"%> 
<%@page import="user.User" %>
<%@page import="goods.Goods" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="../css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="../css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>

		<script type="text/javascript" src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="../js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="../js/list.js"></script>

	</head>

	<body>


		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<%User user = (User)session.getAttribute("curruser");%>
						<%if(user==null||user.getId()==null){ %>
						<a href="${pageContext.request.contextPath}/home/login.jsp" target="_top" class="h">亲,请<font style="color:orange;padding: 10px;font-weight: bold; ">登录</font></a>
						<a href="${pageContext.request.contextPath}/home/register.jsp" target="_top"><font style="color:orange;font-weight: bold; ">免费注册</font></a>
						<%}else{%>
						<%if(user.getId()!=null&&user.getNickName().equals("**")){ %>
						亲爱的,<%=user.getId()%>,欢迎光临！
						<%}if(user.getId()!=null&&!user.getNickName().equals("**")){ %>
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
            <b class="line"></b>
			<div class="listMain">

				<!--分类-->
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="${pageContext.request.contextPath}/action/toMain">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="${pageContext.request.contextPath}/action/toMain">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="${pageContext.request.contextPath}/action/toMain">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				
				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a href="#"><img src="../new_images/<s:property value="goodDetails.id"/>.jpg" alt="放大镜" rel="../new_images/<s:property value="goodDetails.id"/>.jpg" class="jqzoom" /></a>
							</div>
						
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
							
				 <s:property value="goodDetails.discription"/>&nbsp;
				 <s:property value="goodDetails.name"/>
	          </h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>促销价</dt>
									<dd><em>¥</em><b class="sys_item_price"><s:property value="goodDetails.price"/></b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<dt>配送费</dt>
									<dd><em>¥</em><b class="sys_item_mktprice">5.00</b></dd>									
								</li>
								<div class="clear"></div>
							</div>

							
							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count"><%=new Random().nextInt(1000)%></span></div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count"><%=new Random().nextInt(9999)+1000 %></span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count"><%=new Random().nextInt(10000)%></span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										
										<div class="theme-popbod dform">
											<form  name="loginform" id="Buyform" action="${pageContext.request.contextPath}/orders/buyone" method="post">
												
												<div class="theme-signin-left">

													<div class="theme-options">
													
														<div class="cart-title">包装</div>
														<ul>
															<li class="sku-line selected">精美礼盒<i></i></li>
															<li class="sku-line">精心搭配<i></i></li>
															
														</ul>
													</div>
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input name="buy_one" hidden="hidden" value="<s:property value="goodDetails.id"/>"/>
															<input id="min" class="am-btn am-btn-default"  name="" type="button" value="-" />
															<input id="text_box" name="chooseNumber"  type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default"  name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock">9999</span>件</span>
														
														</dd>

													</div>
													<div class="clear"></div>

													

											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
							<script type="text/javascript">
							function joinCart(){
								var num=$("input[id=text_box]").val();
								
								$.post("${pageContext.request.contextPath}/order/addtocart",{goodid:${goodDetails.id},num:num},
										function(status){
											alert("伦家在购物车等你哟~");
										}
								);
								
							}
							function LikBuy(){
								document.getElementById("Buyform").submit();
							}
							
							
							</script>	
							
							
							<!--活动	-->
							<div class="shopPromotion gold">
								<div class="hot">
									<dt class="tb-metatit">店铺优惠</dt>
									<div class="gold-list">
										<p>购物满￥30免配送费<span><i class="am-icon-sort-down"></i></span></p>
									</div>
								</div>
								
								<div class="clear"></div>
								
							</div>
						</div>
						<div class="pay">
							
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" onclick="LikBuy()" title="点此按钮到下一步确认购买信息"  href="#">立即购买</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" title="加入购物车" onclick="joinCart()" href="javascript:void(0)"><i></i>加入购物车</a>
								</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>

				</div>

			
				<div class="clear"></div>
				
							
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">

										<span class="index-needs-dt-txt">宝贝详情</span></a>

								</li>

								<li>
									<a href="#">

										<span class="index-needs-dt-txt">全部评价</span></a>

								</li>

							
							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
											<li title="">产品类型:&nbsp;<s:property value="goodDetails.type"/> </li>
											<li title="">原料产地:&nbsp;<s:property value="goodDetails.place"/></li>
											<li title="">产地:&nbsp;<s:property value="goodDetails.place"/></li>
											
											<li title="">产品规格:&nbsp;<s:property value="goodDetails.size"/></li>
											<li title="">生产日期：&nbsp;<s:property value="goodDetails.date"/></li>
											<li title="">保质期:&nbsp;<s:property value="goodDetails.qgp"/></li>
											<li title="">产品标准号:&nbsp;GB/T 22165</li>
											<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
											<li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存 </li>
											
										</ul>
										<div class="clear"></div>
									</div>

									<div class="details">
										<div class="attr-list-hd after-market-hd">
											<h4>商品细节</h4>
										</div>
										<div class="twlistNews">
											<img src="../new_images/<s:property value="goodDetails.id"/>.jpg" />
											<img src="../new_images/<s:property value="goodDetails.id"/>.jpg" />
											<img src="../new_images/<s:property value="goodDetails.id"/>.jpg" />
											<img src="../new_images/<s:property value="goodDetails.id"/>.jpg" />
											<img src="../new_images/<s:property value="goodDetails.id"/>.jpg" />
										</div>
									</div>
									<div class="clear"></div>

								</div>

								<div class="am-tab-panel am-fade">
									
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>100<span>%</span></strong><br> <span>好评度</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>买家印象</dt>                    
                                            <dd class="p-bfc">
                                            			<q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                            			<q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                            			<q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                            			<q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                            			<q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                            			<q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                            			<q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                            			<q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                            			<q class="comm-tags"><span>皮很薄</span><em>(831)</em></q> 
                                            </dd>                                           
                                         </dl> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<ul class="am-comments-list am-comments-list-flip">
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="../images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime=""><%=new Date()%></time>
													</div>
												</header>

				
									</ul>

									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>

									
									<div class="clear"></div>

								</div>

							</div>

						</div>

						<div class="clear"></div>

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
									<em>© 2015-2025 Niwai.com 版权所有. <a href="" target="_blank" title=""></a> - Collect from 腻歪</em>
								</p>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!--菜单 -->
			<div class=tip>
				<div id="sidebar">
					<div id="wrap">
						<div id="prof" class="item">
							<a href="#">
								<span class="setting"></span>
							</a>
							<div class="ibar_login_box status_login">
								<div class="avatar_box">
									<p class="avatar_imgbox"><img src="../images/no-img_mid_.jpg" /></p>
									<ul class="user_info">
										<li>用户名：sl1903</li>
										<li>级&nbsp;别：普通会员</li>
									</ul>
								</div>
								<div class="login_btnbox">
									<a href="#" class="login_order">我的订单</a>
									<a href="#" class="login_favorite">我的收藏</a>
								</div>
								<i class="icon_arrow_white"></i>
							</div>

						</div>
						<div id="shopCart" class="item">
							<a href="${pageContext.request.contextPath}/home/shopcart.jsp">
								<span class="message"></span>
							</a>
							<p>
								购物车
							</p>
							<p class="cart_num"></p>
						</div>
						<div id="asset" class="item">
							<a href="#">
								<span class="view"></span>
							</a>
							<div class="mp_tooltip">
								我的资产
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="foot" class="item">
							<a href="#">
								<span class="zuji"></span>
							</a>
							<div class="mp_tooltip">
								我的足迹
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="brand" class="item">
							<a href="#">
								<span class="wdsc"><img src="../images/wdsc.png" /></span>
							</a>
							<div class="mp_tooltip">
								我的收藏
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="broadcast" class="item">
							<a href="#">
								<span class="chongzhi"><img src="../images/chongzhi.png" /></span>
							</a>
							<div class="mp_tooltip">
								我要充值
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div class="quick_toggle">
							<li class="qtitem">
								<a href="#"><span class="kfzx"></span></a>
								<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
							</li>
							<!--二维码 -->
							<li class="qtitem">
								<a href="#none"><span class="mpbtn_qrcode"></span></a>
								<div class="mp_qrcode" style="display:none;"><img src="../images/weixin_code_145.png" /><i class="icon_arrow_white"></i></div>
							</li>
							<li class="qtitem">
								<a href="#top" class="return_top"><span class="top"></span></a>
							</li>
						</div>

						<!--回到顶部 -->
						<div id="quick_links_pop" class="quick_links_pop hide"></div>

					</div>

				</div>
				<div id="prof-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						我
					</div>
				</div>
				<div id="shopCart-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						购物车
					</div>
				</div>
				<div id="asset-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						资产
					</div>

					<div class="ia-head-list">
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">优惠券</div>
						</a>
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">红包</div>
						</a>
						<a href="#" target="_blank" class="pl money">
							<div class="num">￥0</div>
							<div class="text">余额</div>
						</a>
					</div>

				</div>
				<div id="foot-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						足迹
					</div>
				</div>
				<div id="brand-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						收藏
					</div>
				</div>
				<div id="broadcast-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						充值
					</div>
				</div>
			</div>

	</body>

</html>