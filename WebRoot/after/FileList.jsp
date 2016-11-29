<%@ page language="java" import="java.util.*" import="java.io.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 

      
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	 <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	
  </head>
  
  <body>
  <%
  String name=request.getParameter("name");
  name=new String(name.getBytes("iso-8859-1"),"utf-8");
   %>
  <%  
  
Class.forName("oracle.jdbc.driver.OracleDriver");  
  
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@172.16.75.50:1521:jnudarkside","sam0719","1381200");  
  
Statement stmt=conn.createStatement();  
  
ResultSet rs=stmt.executeQuery("select \"Name\",COURSE_NAME,\"Address\",\"Uploader\",\"SIZE\",\"TO_CHAR\"(UPLOAD_DATE,'yyyy-mm-dd') FROM \"DATA\" WHERE COURSE_NAME='"+name+"' ORDER BY UPLOAD_DATE DESC"); 

%> 
  <br>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<img  src="pic/jnu.jpg" />
			
		</div>
		<div class="col-md-1 column">
		</div>
		<div class="col-md-2 column blue side STHieti">
			<h3 class="text-center blue">
				  <%  
    java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(    
     "yyyy-MM-dd HH:mm:ss");    
   java.util.Date currentTime = new java.util.Date();    
   String time = simpleDateFormat.format(currentTime).toString();  
   out.println(time);  
     %>
			</h3>
		</div>
		<div class="col-md-3 column">
			<div class="btn-group">
				 <button class="btn btn-default blue" type="button"><em class="glyphicon glyphicon-align-left"></em>登陆</button> <button class="btn btn-default blue"  type="button"><em class="glyphicon glyphicon-align-center"></em>注册</button>
			</div>
		<form  role="search">
			
				<input type="text"  /> <button type="submit" class="btn btn-default">搜索</button>
		</form>	
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h1 class="text-center blue side STHieti">
				<%=name %>
			</h1>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="list-group">
				 <a href="#" class="list-group-item active">文件列表</a>
				 
				
				 
				<div class="list-group-item">
				<% while(rs.next()){ %>
					<h1 class="list-group-item-heading blue STHieti">
						<%=rs.getString(1) %>
					</h1>
					
					<p class="list-group-item-text right blue STHieti">
						上传用户:<%=rs.getString(4)%>  文件大小:<%=rs.getString(5)%>kb   上传时间: <%=rs.getString(6) %><a href="/file/<%=rs.getString(1) %>">下载</a>
					</p>
					<% } %>
				</div>
			</div>
		</div>
	</div>

	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
		</div>
	</div>
</div>

<hr align="center" width="55%" color="#991111" size="5"/>




  
<table> 

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
      <script src="https://code.jquery.com/jquery.js"></script>
      <!-- 包括所有已编译的插件 -->
      <script src="js/bootstrap.min.js"></script>
  </body>
</html>
