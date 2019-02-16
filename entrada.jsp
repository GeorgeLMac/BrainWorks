<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome <%=session.getAttribute("name")%></title>
</head>
<body>
    <h3>Login realizado com sucesso</h3>
    <h4> <%=session.getAttribute("name")%> </h4>
       
      <%
      String id = request.getParameter("userId");
      String driverName = "com.mysql.jdbc.Driver";
      String ConnectionUrl = "jdbc:mysql://localhost:3306/";
      String dbName = "Workers";
      String userId = "root";
      String password = "giu007";
      
      try{
    	  Class.forName(driverName);
      } catch (ClassNotFoundException e) {
    	  e.printStackTrace();
      }
      
      Connection conn = null;
      Statement st = null;
      ResultSet rs = null;
      %> 
       
       <%
       
    	   conn = driverManager.getConnection(ConnetionUrl+dbName, userId, password);
    	   st=conn.createStatement();
    	   String sql = "SELECT * FROM login";
    	   
    	   rs = st.executeQuery(sql);
    	   while(rs.next()){
       
       
       
       %>
<%
String uname= (String)session.getAttribute("name");
pageContext.setAttribute("uname",uname);
%>
 
<c:choose>
        <c:when test="${uname == 'Operador' || uname == 'edson'}">
           abc
		</c:when>
        <c:otherwise>
            E-mail não informado
        </c:otherwise>
    </c:choose>       
        
</body>
</html>
