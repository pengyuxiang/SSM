<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	pageContext.setAttribute("PATH",request.getContextPath());
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="js/bootstrap.min.css">

</head>
<body >


<div class="demo" style="padding: 20px 0;">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form action="" method="post" >
					<div class="form-group">
						<input name="" type="text"  class="form-control"  placeholder="题干">
						<i class="fa fa-user"></i>
					</div>
					<div class="form-group help">
						<input name="" type="password" class="form-control" 
						id="inputPassword3" placeholder="答案">
						<i class="fa fa-lock"></i>
						<a href="#" class="fa fa-question-circle"></a>
					</div>
					<div class="form-group">
					
						<button type="submit" class="btn btn-default">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>
