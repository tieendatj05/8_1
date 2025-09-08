<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Thanks for taking our survey!</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/main.css">
</head>
<body class="bg">
  <div class="card card-xl">
    <h1 class="title">Thanks for taking our survey!</h1>
    <p class="subtitle">Here is the information that you entered:</p>

    <div class="kv">
      <div><b>Email:</b></div>
      <div><%= request.getAttribute("email") %></div>

      <div><b>First Name:</b></div>
      <div><%= request.getAttribute("firstName") %></div>

      <div><b>Last Name:</b></div>
      <div><%= request.getAttribute("lastName") %></div>
    </div>

    <p class="note">
      This email address was added to our list on
      <%= request.getAttribute("addedAt") %>
    </p>

    <p class="note">
      The first address on our list is <%= String.valueOf(request.getAttribute("firstOnList")) %><br>
      The second address on our list is <%= String.valueOf(request.getAttribute("secondOnList")) %>
    </p>

    <p class="note">For customer service, contact custserv@murach.com</p>

    <form action="<%=request.getContextPath()%>/emailList" method="get">
      <button class="btn-primary" type="submit">Return</button>
    </form>
  </div>
</body>
</html>
