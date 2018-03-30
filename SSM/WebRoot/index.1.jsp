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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Soft</title>
    
    <link rel="stylesheet" href="./plugins/font-awesome/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="layui.css" media="all">
    <link rel="stylesheet" href="app.css" media="all">
</head>

<body>
    <div class="layui-layout layui-layout-admin kit-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">Soft</div>
            <div class="layui-logo kit-logo-mobile">K</div>
            
            <ul class="layui-nav layui-layout-right kit-nav">
               
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img"> 当前用户：${name}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">name:${name}</a></dd>
                        <dd><a href="javascript:;">password:${password}</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="loginout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black kit-side">
            <div class="layui-side-scroll">
                <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                    <li class="layui-nav-item">
                        <a class="" href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span>老师</span></a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" kit-target data-options="{url:'ta.jsp',icon:'&#xe6c6;',title:'表格',id:'1'}">
                                    <i class="layui-icon">&#xe6c6;</i><span>老师表</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="form.html" data-icon="fa-user" data-title="表单" kit-target data-id='2'><i class="fa fa-user" aria-hidden="true"></i><span> 表单</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="shangchuan.jsp" data-icon="&#xe628;" data-title="上传题目" kit-target data-id='3'><i class="layui-icon">&#xe628;</i><span>上传题目</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="list4.html" data-icon="&#xe614;" data-title="列表四" kit-target data-id='4'><i class="layui-icon">&#xe614;</i><span> 列表四</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" kit-target data-options="{url:'https://www.baidu.com',icon:'&#xe658;',title:'百度一下',id:'5'}"><i class="layui-icon">&#xe658;</i><span> 百度一下</span></a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span>学生</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'1.jsp',icon:'&#xe6c6;',title:'学生',id:'6'}">
                                    <i class="layui-icon">&#xe6c6;</i><span>学生表</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'clas.jsp',icon:'&#xe658;',title:'班级',id:'50'}"><i class="layui-icon">&#xe658;</i><span>班级表</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'clas.jsp',icon:'&#xe658;',title:'成绩',id:'50'}"><i class="layui-icon">&#xe658;</i><span>成绩表</span></a></dd>
                            <dd><a onclick="opena()" href="javascript:;" kit-target data-options="{url:'exam.jsp',icon:'&#xe658;',title:'考试中心',id:'8'}"><i class="layui-icon">&#xe658;</i><span>考试主入口</span></a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="/components/table/table.html" data-name="table" kit-loader><i class="fa fa-plug" aria-hidden="true"></i><span> 表格(page)</span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="/views/form.html" data-name="form" kit-loader><i class="fa fa-plug" aria-hidden="true"></i><span> 表单(page)</span></a>
                    </li>
                </ul>
            </div>
        </div>
       <div class="layui-body" id="container">
            <!-- 内容主体区域 -->
          
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            2018 &copy;
            biyesheji

        </div>
    </div>
    
    <script src="./plugins/layui/layui.js"></script>
    <script>
    function opena(){
        alert("你确定进入考试页面？");
        }


        var message;
        layui.config({
            base: 'js/'
        }).use(['app', 'message'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer;
            //将message设置为全局以便子页面调用
            message = layui.message;
            //主入口
            app.set({
                type: 'iframe'
            }).init();
         
        });
    </script>
</body>

</html>