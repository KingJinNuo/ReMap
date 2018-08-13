<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="../js/register.js"></script>

	</head>

	<body>

		<div class="login-boxtitle">
			<a href="${pageContext.request.contextPath}/action/toMain"><img alt="" src="../images/logobig.png" /></a>
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="../images/big.jpg" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a href="">邮箱注册</a></li>
								<li><a href="">手机号注册</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<form method="post" action="${pageContext.request.contextPath}/action/register" onsubmit="">
										
							   <div class="user-email">
										<label for="email"><i class="am-icon-envelope-o"></i></label>
										<input type="email" onblur="checkemail()"  name="email" id="email" placeholder="请输入邮箱账号">
										
                 </div>			
                 <span id="check-email"></span>	
                					
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="password" placeholder="设置密码">
                 </div>										
                 <div class="user-pass">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="passwordR" onblur="checkpwd()" id="passwordRepeat" placeholder="确认密码">
                 </div>	
                 <span id="check-pwd"></span>	
             
                 
								
										<div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>

								</div>
    </form>
								<div class="am-tab-panel">
									<form method="post" action="${pageContext.request.contextPath}/action/register">
                 <div class="user-phone">
								    <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
								    <input type="tel" onblur="checkphone()" name="tel" id="txtphonenum" placeholder="请输入手机号">
                 </div>				
                 <span id="check-phone"></span>															
										<div class="verification">
											<label for="code"><i class="am-icon-code-fork"></i></label>
											<input type="tel" name="" onblur="checkMessageCode()" id="MessageCode" placeholder="请输入验证码">
											<a class="btn" href="javascript:void(0)" onclick="sendMobileCode()" id="sendMobileCode">
												<input id="dyMobileButton"  type="button"  value="获取" > </a>
										</div>
										<span id="check-messagecode"></span>	
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="password1" placeholder="设置密码">
                 </div>
                									
                 <div class="user-pass">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="passwordRepeat1" onblur="checkpwd1()" placeholder="确认密码">
                 </div>	
					 <span id="check-pwd1"></span>					
							
										<div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
								
									<hr>
								</div>
    </form>
								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>

							</div>
						</div>

				</div>
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
								<em>© 2015-2025 NiWai.com 版权所有. <a href="#" title="腻歪之家">腻歪之家</a> - Collect from <a href="#" title="" target="_blank"></a></em>
							</p>
						</div>
					</div>
	</body>

</html>