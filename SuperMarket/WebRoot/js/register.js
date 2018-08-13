document.write('<meta http-equiv="content-Type" content="text/html;charset=utf-8">');
var R = 0;
function submit() {
	if (R == 1) {
		return true;
	}
	else return false;

}
function checkemail() {
	var xhr;
	var id = document.getElementById("email").value;
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			if (xhr.response == "true") {
				document.getElementById("check-email").innerHTML = "<font size='3' color='green'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;恭喜您可以使用此账号</font>";
				R = 1;
			} else {
				document.getElementById("check-email").innerHTML = "<font size='3' color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;抱歉该邮箱已经被注册</font>";
				R = 0;
			}
		}

	}
	xhr.open("post", "${pageContext.request.contextPath}/checkid", "true");
	xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	xhr.send("id=" + id);

}

function checkphone() {
	var xhr;
	var id = document.getElementById("txtphonenum").value;
	if (id.length != 11) {
		document.getElementById("check-phone").innerHTML = "<font size='3' color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请确保您的手机号码位数</font>";
		return false;
	}
	document.getElementById("check-phone").innerHTML = "";
	var reg = "^1[3|4|5|8][0-9]\\d{8}$";
	var re=new RegExp(reg);
	if(!re.test(id)){
		document.getElementById("check-phone").innerHTML = "<font size='3' color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入正确的手机号码</font>";
	}else{
		document.getElementById("check-phone").innerHTML = "";
	}
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (id == "") return false;
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			if (xhr.response == "true") {
				document.getElementById("check-phone").innerHTML = "<font size='3' color='green'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;恭喜您可以使用此账号</font>";
				R = 1;
			} else {
				document.getElementById("check-phone").innerHTML = "<font size='3' color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;抱歉该号码已经被注册</font>";
				R = 0;
			}
		}

	}
	xhr.open("post", "${pageContext.request.contextPath}/checkid", "true");
	xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	xhr.send("id=" + id);

}
function checkpwd() {
	var pd = document.getElementById("password").value;
	var pdR = document.getElementById("passwordRepeat").value;
	var span = document.getElementById("check-pwd");
	if (pd == "" || pdR == "") {
		R = 0;
	} else if (pd == pdR) {
		R = 1;
		span.innerHTML = "";
		return true;
	} else {
		R = 0;

		span.style = "color:red";
		span.innerHTML = "<font size='3'>密码不一致！</font>";
		return false;
	}

}
function checkpwd1() {
	var pd = document.getElementById("password1").value;
	var pdR = document.getElementById("passwordRepeat1").value;
	var span = document.getElementById("check-pwd1");
	if (pd == "" || pdR == "") {
		R = 0;
	} else if (pd == pdR) {
		R = 1;
		span.innerHTML = "";
		return true;
	} else {
		R = 0;

		span.style = "color:red";
		span.innerHTML = "<font size='3'>密码不一致！</font>";
		return false;
	}

}


function sendMobileCode() {
	var phone = $("#txtphonenum").val();
	var i = 60;
	var flag = window.setInterval(function() {
		$("#dyMobileButton").prop("value", i-- + "s");
		if (i == 0) {

			window.clearInterval(flag);
			$("#dyMobileButton").prop("value", "重发");
		}
	}, 1000);

	$.ajax({
		url : "${pageContext.request.contextPath}/sendmessage",
		type : "POST",
		dataType : "json",
		data : "phone=" + phone,
		success : function(data) {
			if (data == true) {
				// location.reload();
			} else {

				$("#dyMobileButton").prop("value", "重发");
			}
			//window.clearInterval(flag);

		}
	});
}
function checkMessageCode() {
	var messagecode = document.getElementById("MessageCode");
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			if (xhr.response == "true") {
				document.getElementById("check-messagecode").innerHTML = "<font size='3' color='green'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验证通过</font>";
				R = 1;
			} else {
				document.getElementById("check-messagecode").innerHTML = "<font size='3' color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验证码有误</font>";
				R = 0;
			}
		}

	}
	xhr.open("post", "${pageContext.request.contextPath}/checkmessagecode", "true");
	xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	xhr.send("messagecode=" + messagecode);

}