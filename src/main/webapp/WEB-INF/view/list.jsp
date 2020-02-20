<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 声明变量，赋值 -->
<c:set var="path" value="{pageContext.request.contextPath}" scope="page"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入外部css样式 -->
<link href="/resource/css/list.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<title>Insert title here</title>
</head>
<body>
     <form action="list" method="post">
        		 发布时间:<input type="date" name="y1" value="${a.y1}">----<input type="date" name="y2" value="${a.y2}">
        		 
        		 <select name="choice">
        		     <option value="">--请选择--</option>
        		     <c:if test="${choice=='created'}">
        		     <option value="created"selected>发布时间</option>
        		     </c:if>
        		     <c:if test="${choice!='created'}">
					 <option value="created">发布时间</option>
					 </c:if>
					<c:if test="${choice=='user_id'}">
					<option value="user_id" selected>作者</option>
					</c:if>
					<c:if test="${choice!='user_id'}">
					<option value="user_id">作者</option>
					</c:if>
        		 
        		 </select>
        		 <input type="submit" value="查询">
        		 
        		 
        		 <table>
        		     <tr>
        		        <th>ID</th>
        		        <th>标题</th>
        		        <th>发布时间</th>
        		        <th>作者</th>
        		        <th>hot</th>
        		     </tr>
        		   <c:forEach items="${getlist}" var="a">
        		          <tr>
        		              <td>${a.id}</td>
	        		          <td>${a.title}</td>
	        		          <td><fmt:formatDate value="${a.created}"/></td>
	        		          <td>${a.username}</td>
	        		          <td>${a.hot}</td>
        		          
        		          </tr>
        		   </c:forEach>
        		    <tr>
        		    <td colspan="10">
							<button name="pageNum" value="1">首页</button>
							<button name="pageNum" value="${page.prePage==0?1:page.prePage}">上一页</button>
							<button name="pageNum" value="${page.nextPage==0?page.pages:page.nextPage}">下一页</button>
							<button name="pageNum" value="${page.pages}">尾页</button>
							当前页/总页数：${page.pageNum}/${page.pages}
				</td>
        		    
        		    
        		    </tr>
        		 
        		 </table>
        		 
     
     
     
     </form>

</body>
</html>