<%@ page session="true" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.html");
    return;
  }
%>
<!doctype html>
<html>
<head><meta charset="utf-8"><title>Dashboard</title><link rel="stylesheet" href="css/style.css"></head>
<body>
  <div class="container">
    <nav>
      <a href="customers">Customers</a>
      <a href="add_customer.html">Add Customer</a>
      <a href="logout">Logout</a>
    </nav>
    <h1>Welcome, <%= username %></h1>
    <p>Use the navigation above to manage customers and bills.</p>
  </div>
</body>
</html>
