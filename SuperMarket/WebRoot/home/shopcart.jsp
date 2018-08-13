<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*"%> 
<%@page import="user.User" %>
<%@page import="orders.ShopCart" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="../js/jquery.js"></script>

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
					<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
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

			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
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
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="bundle-hd">
								<div class="bd-promos">
									
									<span class="list-change theme-login">编辑</span>
								</div>
							</div>
							<div class="clear"></div>
							<div class="bundle-main">
							<!-- 购物车 -->
								
								<s:iterator value="#session.shopcart" var="sp" status="k">
										<script type="text/javascript">
				function deleteCart(id){
								var num=$("input[id=deletecart]").val();
								
								$.post("${pageContext.request.contextPath}/order/deletefromcart",{goodid:id},
										function(status){
											alert("你好缠银，不要伦家了555……");
											location.reload(true);
										}
								);
								
							}
				function changeCart(id){
								var num=$("input[id=updatecart]").val();
								$.post("${pageContext.request.contextPath}/order/updatecart",{goodid:id,num:num},
										function(status){
											location.reload(true)
											alert("已为您更新完成！！！");
											
										}
								);
								
							}
				function changeCart1(id){
					var num=$("input[id=updatecart]").val()-1;
					$.post("${pageContext.request.contextPath}/order/updatecart",{goodid:id,num:num},
							function(status){
								location.reload(true)
								alert("已为您更新完成！！！");
								
							}
					);
					
				}
				function changeCart2(id){
					var num=$("input[id=updatecart]").val();
					num++;
					$.post("${pageContext.request.contextPath}/order/updatecart",{goodid:id,num:num},
							function(status){
								location.reload(true)
								alert("已为您更新完成！！！");
								
							}
					);
					
				}
				function selectall(){
					if($("#J_SelectAllCbx2").is(":checked")){
					$("input:checkbox").each(function(){
						
						$(this).attr("checked",true);//全部选中
					});
					}else{
						$("input:checkbox").each(function(){
							
							$(this).attr("checked",false);
						});
					}
					
				}
				function deleteall(){
					$.post("${pageContext.request.contextPath}/order/deleteall",
							function(status){
								location.reload(true)
								alert("分手吧！！！");
								
							}
					);
				}
				//勾选并去付钱
				function chooseTopay(){
					var value="";
					$("input[name=items]:checked").each(function(){
						value+=$(this).val()+",";
					});
					if(value==""){
						alert("亲，您还没选好反谁的牌子呢~");
						return false;
						}
					else{ 
					location.href="${pageContext.request.contextPath}/orders/buymore?idstring="+value;
					return true;
					}
				}
							</script>
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="J_CheckBox_170037950254" name="items" value="<s:property value="id"/>"  type="checkbox">
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank" data-title="" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="../new_images/<s:property value="id"/>.jpg" class="itempic J_ItemImg" width="100px"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="#" target="_blank" title="" class="item-title J_MakePoint" data-point="tbcart.8.11"><s:property value="name"/> </a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line"><s:property value="discription"/></span>
											
											<span tabindex="0" class="btn-edit-sku theme-login">修改</span>
											<i class="theme-login am-icon-sort-desc"></i>
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">￥${shopcart[k.index].price+3}</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">￥<s:property value="price"/></em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" onclick="changeCart1(${id},this)" type="button" value="-" />
													<input class="text_box" name="" type="text" id="updatecart"  onchange="changeCart(${id},this)" value="<s:property value="count"/>" style="width:30px;" />
													<input class="add am-btn" name="" onclick="changeCart2(${id},this)" type="button" value="+" />
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">￥${shopcart[k.index].price*shopcart[k.index].count}</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
					
											<a href="javascript:;" id="deletecart" onclick="deleteCart(${id})" data-point-url="#" class="delete">删除</a>
										</div>
									</li>
								</ul>
						</s:iterator>
								
								
							</div>
						</div>
					</tr>
					<div class="clear"></div>

				</div>
				<div class="clear"></div>
		
				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" onchange="selectall()" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div>
					<div class="operations">
						<a href="javascript:void(0)" onclick="deleteall()" hidefocus="true" class="deleteAll">删除</a>
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							
							<em id="J_SelectedItemsCount"></em><span class="txt"></span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">购物车总价值:</span>
							<strong class="price">¥<em id="J_Total"><s:property value="#session.totals"/></em></strong>
						</div>
						<div class="btn-area">
							<a href="javascript:void(0)" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
								<span onclick="return chooseTopay()">结&nbsp;算</span></a>
						</div>
					</div>

				</div>

				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="${pageContext.request.contextPath}/action/login">腻歪科技</a>
							<b>|</b>
							<a href="${pageContext.request.contextPath}/action/login">商城首页</a>
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
							<em>© 2015-2025 NiWai.com 版权所有<a href="" target="_blank" title=""></a> - Collect from <a href="" title="" target="_blank">腻歪之家</a></em>
						</p>
					</div>
				</div>

			</div>

	</body>

</html>