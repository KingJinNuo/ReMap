<%@ page language="java" pageEncoding="UTF-8"%>
<!-- saved from url=(0044)http://www.zi-han.net/theme/Seven/chat.html# -->
<html class="csstransforms csstransforms3d csstransitions js flexbox flexboxlegacy canvas 
canvastext postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba
 hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations
 csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent
 video audio localstorage sessionstorage webworkers applicationcache">
<head>
    <title>与悦桔客服小薇聊天中...</title>
    	<link href="../Seven/bootstrap.min.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/font-awesome.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/Seven-font.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/isotope.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css">
    	<link href="./Seven/fullcalendar.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/wizard.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/select2.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/morris.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/datatables.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/datepicker.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/timepicker.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/colorpicker.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/daterange-picker.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/typeahead.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/summernote.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/pygments.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/style.css" media="all" rel="stylesheet" type="text/css">
    	<link href="../Seven/green.css" media="all" rel="alternate stylesheet" title="green-theme" type="text/css">
    	<link href="../Seven/orange.css" media="all" rel="alternate stylesheet" title="orange-theme" type="text/css">
    	<link href="../Seven/magenta.css" media="all" rel="alternate stylesheet" title="magenta-theme" type="text/css">
    	<link href="../Seven/gray.css" media="all" rel="alternate stylesheet" title="gray-theme" type="text/css">
    	<script src="../Seven/jquery-1.7.2.min.js" type="text/javascript"></script>
    	<script src="../Seven/jquery-ui.js" type="text/javascript"></script>
    	<script src="../Seven/bootstrap.min.js" type="text/javascript"></script>
    	<script src="../Seven/raphael.min.js" type="text/javascript"></script>
    	<script src="../Seven/selectivizr-min.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.mousewheel.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.vmap.min.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.vmap.sampledata.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.vmap.world.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    	<script src="../Seven/fullcalendar.min.js" type="text/javascript"></script>
    	<script src="../Seven/gcal.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.dataTables.min.js" type="text/javascript"></script>
    	<script src="../Seven/datatable-editable.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.easy-pie-chart.js" type="text/javascript"></script>
    	<script src="../Seven/excanvas.min.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.isotope.min.js" type="text/javascript"></script>
    	<script src="../Seven/isotope_extras.js" type="text/javascript"></script>
    	<script src="../Seven/modernizr.custom.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.fancybox.pack.js" type="text/javascript"></script>
    	<script src="../Seven/select2.js" type="text/javascript"></script>
    	<script src="../Seven/styleswitcher.js" type="text/javascript"></script>
    	<script src="../Seven/wysiwyg.js" type="text/javascript"></script>
    	<script src="../Seven/summernote.min.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.inputmask.min.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.validate.js" type="text/javascript"></script>
    	<script src="../Seven/bootstrap-fileupload.js" type="text/javascript"></script>
    	<script src="../Seven/bootstrap-datepicker.js" type="text/javascript"></script>
    	<script src="../Seven/bootstrap-timepicker.js" type="text/javascript"></script>
    	<script src="../Seven/bootstrap-colorpicker.js" type="text/javascript"></script>
    	<script src="../Seven/bootstrap-switch.min.js" type="text/javascript"></script>
    	<script src="../Seven/typeahead.js" type="text/javascript"></script>
    	<script src="../Seven/daterange-picker.js" type="text/javascript"></script>
    	<script src="../Seven/date.js" type="text/javascript"></script>
    	<script src="../Seven/morris.min.js" type="text/javascript"></script>
    	<script src="../Seven/skycons.js" type="text/javascript"></script>
    	<script src="../Seven/fitvids.js" type="text/javascript"></script>
    	<script src="../Seven/jquery.sparkline.min.js" type="text/javascript"></script>
    	<script src="../Seven/main.js" type="text/javascript"></script>
    	<script src="../Seven/respond.js" type="text/javascript"></script>
    	<script type="text/javascript" src="../Seven/stats" charset="UTF-8"></script>
    	<script type="text/javascript" src="../Seven/stats" charset="UTF-8"></script>
     
     
    	<script type="text/javascript">
		var thistime;
		$(function time()
				{
				thistime=new Date()                                   //创建一个对象
				var hours=thistime.getHours()                    //获取时钟
				var minutes=thistime.getMinutes()             //获取分钟
				var seconds=thistime.getSeconds()              //获取秒钟
				var years=thistime.getYear()                         //获取年
				var months=thistime.getMonth()                //获取月
				var days=thistime.getDay()                          //获取日
    			if(eval(hours)<10)
						{
						hours="0"+hours
						}
						if(eval(minutes<10))
						{
						minutes="0"+minutes
						}
						if(seconds<10)
						{
						seconds="0"+seconds
						}
						thistime=hours+":"+minutes+":"+seconds     //把时间显示顺序调整好          
						var timer=setTimeout("time()",1000)  });           //设置计时器，让时间每分每秒更新
			$(function(){
    		$('#f1').submit(function(){
				var content = $('#info').val();
				console.log(content)
				//alert(content.length);
				if($.trim(content).length ==0){
					$('#info').val('');
					return false;
				}
				var str = '<li class="current-user">'
                    +'<img width="30" height="30" src="../Seven/avatar-female.jpg">'
                    +'<div class="bubble">'
                     +' <a class="user-name" href="#">兰若</a>'
                     +' <p class="message">'+$('#info').val()+'</p>'
                     +' <p class="time">'
                      +'  <strong>Today </strong>'+thistime+''
                      +'</p>'
                    +'</div>'
                  +'</li>';
				 $('#info').val('');
				$('.widget-content > ul').append(str);
				var div = document.getElementById('msg');  
				div.scrollTop = div.scrollHeight;
				//console.log($('.widget-content > ul').eq(0));
    			$.ajax({
    					type:'post',
    					url:'${pageContext.request.contextPath}/Chat',
    					data:'contentName='+content,
    					dataType:'json',
    					success:function(date){
    					console.log(date)
						var newWen="";
						
						var s = date.text;
					
						if(date.url){
							console.log(typeof date)
							s+='<br/> <a href='+date.url+'>'+content+'</a>';
						}
					newWen= '<li class="xiao_wei">'
                    +'<img width="30" height="30" src="../Seven/avatar-male.jpg">'
                    +'<div class="bubble">'
                     +' <a class="user-name" href="#">客服-小铃铛</a>'
                     +' <p class="message">'+s+'</a>'+'</p>'
                     +' <p class="time">'
                      +'  <strong>Today </strong>'+thistime+''
                      +'</p>'
                    +'</div>'
                  +'</li>';	
						$('.widget-content > ul').append(newWen);
						 
						div.scrollTop = div.scrollHeight;
    					}
    			});
				
    			return false;
    		});
    		});
			   
    	</script>
    </head>
<body onload="time()">
    <div class="modal-shiftfix">
      <!-- Navigation -->
	  <div class="navbar navbar-fixed-top scroll-hide">
	    <a href="#" target="_blank"><img alt="image" class="img-circle" src="../images/logobig.png" width="200px"  high="200px" ></a>
		<font size="6" color="" face="微软雅黑">&nbsp;&nbsp;&nbsp;悦桔客服</font>
      </div>
	
      <!-- End Navigation -->
      <div class="container-fluid main-content" >
        <div class="page-title" >
          <h1>
                聊天窗口
          </h1>
        </div>
        <div class="row" >
          <!-- Conversation -->
          <div class="col-lg-12">
            <div class="widget-container scrollable chat chat-page">
			<div class="contact-list">
				<div class="heading" >
                      联系人(1)<i class="icon-plus pull-right"></i>
                </div>
				 <ul>
                  <li>
                    <a href="#"><img width="30" height="30" src="../Seven/avatar-male.jpg"><span style="color:red">悦桔-客服小薇</span>[在线] <i class="icon-circle text-danger"></i></a>
                  </li>
                    
                  
                </ul>
				 </div>
              <div class="heading">
               与 <a href="#">悦桔-客服小薇</a> 的聊天
              </div>
			  
              <div class="widget-content padded" id="msg">
                <ul>
                  <li class="xiao_wei">
                    <img width="30" height="30" src="../Seven/avatar-male.jpg">
                    <div class="bubble">
                      <a class="user-name" href="#">悦桔-客服小薇</a>
                      <p class="message">
							你好！有什么可以帮助你的呢？
                      </p>
                      <p class="time">
                        <strong>Today </strong>
                      </p>
                    </div>
                  </li>
                </ul>
              </div>
			  <form id="f1">
              <div class="post-message">
                <input class="form-control" name="contentName" placeholder="输入需要发送的信息…" type="text" id="info"><input type="submit"  value="发送">
              </div>
			  </form>
          </div>
        </div>
		</div>
      </div>
    </div>
</body>
</html>