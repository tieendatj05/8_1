<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Join our email list</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/main.css">
</head>
<body class="bg">
  <div class="card card-lg">
    <h1 class="title">Join our email list</h1>
    <p class="subtitle">Enter your name and email address below.</p>

    <%
      String err = (String) request.getAttribute("error");
      if (err != null) { %>
        <div class="alert"><%= err %></div>
    <% } %>

    <form method="post" action="<%=request.getContextPath()%>/emailList" class="form">
      <label>First Name:</label>
      <input type="text" name="firstName"
             value="<%= request.getAttribute("firstName")!=null?request.getAttribute("firstName"):"" %>" required>

      <label>Last Name:</label>
      <input type="text" name="lastName"
             value="<%= request.getAttribute("lastName")!=null?request.getAttribute("lastName"):"" %>" required>

      <label>Email:</label>
      <input type="email" name="email"
             value="<%= request.getAttribute("email")!=null?request.getAttribute("email"):"" %>" required>

      <button type="submit" class="btn-primary">Join Now</button>
    </form>
  </div>
</body>
</html>
