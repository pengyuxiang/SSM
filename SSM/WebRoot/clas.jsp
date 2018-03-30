<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	pageContext.setAttribute("PATH",request.getContextPath());
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
		<link rel="stylesheet" type="text/css" href="js/easyui.css">
    	<link rel="stylesheet" type="text/css" href="js/icon.css">
    	<link rel="stylesheet" type="text/css" href="js/demo.css">
    	<!-- <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script> -->
    		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    	<script type="text/javascript" src="js/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  </head>
    	
    
   
    <body>
  <div style="margin:20px 0;" ></div>
        <div id="tb" style="padding:5px;height:auto">
         <div style="margin-bottom:5px">
         
        <div>
        <table id="dg" class="easyui-datagrid" title="DataGrid Complex Toolbar" style="width:800px;height:350px"
         >
        <thead>
          <tr >
            <th data-options="field:'ck',checkbox:true" class="dg"></th>
            <th data-options="field:'id'" width="80">班级ID</th>
                <th data-options="field:'clasname'" width="100">班级名字</th>
                <th data-options="field:'num',align:'right'" width="80">班级人数${sum}</th>
               
          </tr>
        </thead>
      </table>
    </div>
      </div>

  
  <style scoped="scoped">
    .textbox{
      height:20px;
      margin:0;
      padding:0 2px;
      box-sizing:content-box;
    }
  </style>

  <script>
  //id

 	//在表单里放入外键值 format是自定义名字
      function format(value,rows,index){
     
        return rows['user']['name'];
      }

//`--------------------------------------
    $(function(){
      $('#dg').datagrid({loadFilter:pagerFilter,singleSelect:true,//是否单选 
        
        pagination:true,//分页控件 
        rownumbers:true,//行号  
       // loadFilter:pagerFilter
   		 url:'clasjson',}).datagrid('loadData', getData());
		/* $('#dg').datagrid({
		
		
		singleSelect:true,//是否单选 
        pagination:true,//分页控件 
        rownumbers:true,//行号  
       // loadFilter:pagerFilter
   		 url:'teacherjson',
   		  
      
   		}); */

/*  var p = $('#dg').datagrid('getPager'); 
    $(p).pagination({ 
    	
        pageSize: 10,//每页显示的记录条数，默认为10 
        pageList: [5,10],//可以设置每页记录条数的列表 
        beforePageText: '第',//页数文本框前显示的汉字 
        afterPageText: '页    共 {pages} 页', 
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
}); */

  $('input.easyui-validatebox').validatebox({
        tipOptions: { // the options to create tooltip
          showEvent: 'mouseenter',
          hideEvent: 'mouseleave',
          showDelay: 0,
          hideDelay: 0,
          zIndex: '',
          onShow: function(){
            if (!$(this).hasClass('validatebox-invalid')){
              if ($(this).tooltip('options').prompt){
                $(this).tooltip('update', $(this).tooltip('options').prompt);
              } else {
                $(this).tooltip('tip').hide();
              }
            } else {
              $(this).tooltip('tip').css({
                color: '#000',
                borderColor: '#CC9933',
                backgroundColor: '#FFFFCC'
              });
            }
          },
          onHide: function(){
            if (!$(this).tooltip('options').prompt){
              $(this).tooltip('destroy');
            }
          }
        }
      }).tooltip({
        position: 'right',
        content: function(){
          var opts = $(this).validatebox('options');
          return opts.prompt;
        },
        onShow: function(){
          $(this).tooltip('tip').css({
            color: '#000',
            borderColor: '#CC9933',
            backgroundColor: '#FFFFCC'
          });
        }
      });
    });
    
    
    
    
function pagerFilter(data){
           if (typeof data.length == 'number' && typeof data.splice == 'function'){    // 判断数据是否是数组
               data = {
                   total: data.length,
                   rows: data
               }
           }
           var dg = $(this);
           var opts = dg.datagrid('options');
           var pager = dg.datagrid('getPager');
           pager.pagination({
               onSelectPage:function(pageNum, pageSize){
                   opts.pageNumber = pageNum;
                   opts.pageSize = pageSize;
                   pager.pagination('refresh',{
                       pageNumber:pageNum,
                       pageSize:pageSize
                   });
                   dg.datagrid('loadData',data);
               }
           });
           if (!data.originalRows){
               data.originalRows = (data.rows);
           }
           var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
           var end = start + parseInt(opts.pageSize);
           data.rows = (data.originalRows.slice(start, end));
           return data;
       }
    
    
  </script>
  

    </body>
    </html>