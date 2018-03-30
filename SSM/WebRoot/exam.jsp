<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="js/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    	<script type="text/javascript" src="js/jquery.min.js"></script>
  </head>
  <script>
  	$(document).ready(function(){
 		$.ajax({
      type:'get',
      url:'examlist',
      success:function(data){
      }
        
    });
    })
 </script>
  <script>
function chk(){
  var arr=[];
  $("input[type='radio']:checked").each(function(){ 
       arr.push(this.value);
  })
 
  $.ajax({
      type:'post',
      url:'examresult',
      traditional:true,
      data:{"result":arr},
      success:function(sum){
     		alert("得分"+sum);
     		
    	}
        
    });
   
}
  </script>
 
  <body >
		<c:forEach items="${lis}" var="p">
		<form action="result" method="get"> 
  			 第${p.questionid}题：${p.question}（分值：${p.fs}）<br>
    <label><input name="test"  type="radio" value="a" onchange="getValue()" />${p.choicea} </label> 
    <label><input name="test"  type="radio" value="b" onchange="getValue()"/>${p.choiceb} </label> 
    <label><input name="test"  type="radio" value="c" onchange="getValue()"/>${p.choicec} </label> 
    <label><input name="test"  type="radio" value="d" onchange="getValue()"/>${p.choiced} </label> 
    </form> 
		</c:forEach>	
<input type="button"  class="btn btn-default" onclick="chk()" value="提交" />
  
  </body>
</html>
