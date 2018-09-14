<%@ page  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  	<script type="text/javascript">
  		$(function(){
  		$("#testJson").click(function(){
  			var url=this.href;
  			var args={};
  			$.post(url,args,function(data){
  				for(var i=0;i<data.length;i++){
  					var id=data[i].id;
  					var lastName=data[i].lastName;
  					alert(id+" "+lastName);
  				}
  				
  			});
  			
  			return false;
  		});	
  		})
  	</script>
  </head>
  
  <body>
    This is my ERROR page. <br>
    
   ${requestScope.exception}
    
  </body>
</html>
