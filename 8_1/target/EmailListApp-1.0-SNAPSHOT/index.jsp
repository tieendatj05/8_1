<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Khi người dùng truy cập http://localhost:8080/<TênProject>/
    // thì sẽ tự động chuyển sang /emailList
    response.sendRedirect(request.getContextPath() + "/emailList");
%>
