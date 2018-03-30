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
          <a href="javascript:void(0)" class="easyui-linkbutton" onclick="opena()"  plain="true">添加</a>
          <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="updateuser()" plain="true">修改</a>
          <a href="javascript:void(0)" class="easyui-linkbutton"  plain="true">保存</a>
          <a href="javascript:void(0)" class="easyui-linkbutton"  plain="true">剪切</a>
          <a href="javascript:void(0)" class="easyui-linkbutton" onclick="deleteteacher()"  plain="true">删除</a>
        </div> 
        <div>
        <table id="dg" class="easyui-datagrid" title="DataGrid Complex Toolbar" style="width:800px;height:350px"
         >
        <thead>
          <tr >
            <th data-options="field:'ck',checkbox:true" class="dg"></th>
            <th data-options="field:'id'" width="80">Item ID</th>
                <th data-options="field:'a_name'" width="100">Product ID</th>
                <th data-options="field:'password',align:'right'" width="80">List Price</th>
                
                <th data-options="field:'name',formatter:format"  width="150">管理的学生</th>
          </tr>
        </thead>
      </table>
      <!-- 添加 模态框 -->
    <div id="mtk" class="easyui-window" title="学生信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
        <div class="easyui-layout" data-options="fit:true" "> 
     
        <form id="add" method="post">
            <table align="center" cellpadding="5">
              <tr>
        <td>a_name:</td>
        <td><input name="a_name" class="easyui-textbox"></td>
      </tr>
                <tr>
                    <td>PassWord:</td>
                    <td><input class="easyui-textbox" type="text" name="password"></td>
                </tr>
               <tr>
                    <td>管理的班级:</td>
                    <td>
                    <select  name="uid" style="width:100px" class="easyui-combobox">
                            <option style="height: 50px" value="--请选择--">--请选择--</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                           </select>
                    
                    </td>
                      
                   
                </tr>
             </table>
              <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
      
   </div>
        </form></div>
   

    </div>
<!-- 修改 -->
 <div id="mtkbj" class="easyui-window" title="学生信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
        <div class="easyui-layout" data-options="fit:true" "> 
     
        <form id="ffbj" method="post">
            <table align="center" cellpadding="5">
              <tr><input  type="hidden" name="id" value=""/>
        <td>Aname:</td>
        <td><input name="a_name" class="easyui-validatebox textbox" data-options="prompt:'Enter User Name.',required:true,validType:'length[3,10]'"></td>
      </tr>
                <tr>
                    <td>PassWord:</td>
                    <td><input class="easyui-textbox" type="text" name="password"></td>
                </tr>
               
                 <tr>
                    <td>UID:</td>
                    <td> 
                    
                    <select style="width:100px" class="easyui-combobox" name="uid">
                            <option style="height: 50px" value="--请选择--">--请选择--</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                           </select>
                    
                    </td>
                      
                   
                </tr>
             </table>
              <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormbj()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
      
   </div>
        </form></div>
    </div>



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
    function opena(){
        $('#mtk').window('open'); 
      $('#add').form('clear');}
//增删改查

 function updateuser(){
      var row = $('#dg').datagrid('getSelected');
      if(row==null){
        alert("请选择一个对象");
      }else{

      var obj=JSON.stringify(row);
      $('#ffbj').form('load', row);
    //$('#combj').combobox('setValue',re.clas.clasName);
       $('#mtkbj').window('open'); 
       }
 }
  function submitFormbj(){
           var re=$("#dg").datagrid('getSelected');  
        /*student  ID的值*/
           // console.log(re.id);
             $('#ffbj').form('submit',
                        {   type:'post',
                            url:'updateteacher',
                            success : function(data) {
                        $("#dg").datagrid("reload"); 
                            alert("添加成功");

                            $('#mtkbj').window('close')
                            }
                        });
             }



  function deleteteacher(){
 //获取选中行的id 
  var row = $('#dg').datagrid('getChecked');

   var names=[];
     $.each(row,function(index,item){
        names.push(item.id);
      });
      var id=names.join(",");
      alert(id);
      
        $.ajax({
      type:'post',
      url:'deleteteacher',
      data:'id='+id,
     
     success:function(data){
      alert("删除成功");
        //数据重载
          $("#dg").datagrid("reload");
   //alert("error");
        
      }
        
    });

       

  };
 function submitForm(){
 
                  //add表单
              $('#add').form('submit',
                        {   type:'get',
                            url:'addteacher',
                            success : function(data) {
               
                                console.log(data);
                                $("#dg").datagrid("reload"); 
                            alert("添加成功");

                            $('#mtk').window('close')
                            }
                        });
        
        /*清除表单内容*/
        function clearForm(){
            $('#ff').form('clear');
        }

        $(function(){
            var pager = $('#dg').datagrid().datagrid('getPager');  // get the      
        })

}

</script>
  <script>
  //id

  
 	//在表单里放入外键值
      function format(value,rows,index){
     
        return rows['user']['name'];
      }

//`--------------------------------------
    $(function(){
      $('#dg').datagrid({loadFilter:pagerFilter,singleSelect:true,//是否单选 
        
        pagination:true,//分页控件 
        rownumbers:true,//行号  
       // loadFilter:pagerFilter
   		 url:'teacherjson',}).datagrid('loadData', getData());
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