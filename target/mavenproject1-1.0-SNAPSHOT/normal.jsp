<%-- 
    Document   : normal
    Created on : 05-Feb-2023, 3:24:55 pm
    Author     : utsav
--%>
<%@page import="com.mycompany.mavenproject1.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login page");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "You are not normal! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <h1>This normal User Panel</h1>
    </body>
</html>
