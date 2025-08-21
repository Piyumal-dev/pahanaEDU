<%@ page import="com.pahanaedu.model.Customer" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.html"); return; }
  Customer c = (Customer) request.getAttribute("customer");
%>
<!doctype html>
<html><head><meta charset="utf-8"><title>Edit Customer</title><link rel="stylesheet" href="css/style.css"></head>
<body>
  <div class="container">
    <nav><a href="dashboard.jsp">Dashboard</a> <a href="customers">Customers</a> <a href="logout">Logout</a></nav>
    <h1>Edit Customer</h1>
    <form method="post" action="editCustomer">
      <input type="hidden" name="account_no" value="<%= c.getAccountNo() %>">
      <div class="form-row"><label>Name</label><input type="text" name="name" value="<%= c.getName() %>" required></div>
      <div class="form-row"><label>Address</label><textarea name="address" rows="2" required><%= c.getAddress() %></textarea></div>
      <div class="form-row"><label>Telephone</label><input type="text" name="telephone" value="<%= c.getTelephone() %>" required></div>
      <div class="form-row"><label>Units Consumed</label><input type="number" name="units_consumed" value="<%= c.getUnitsConsumed() %>" required></div>
      <button class="btn" type="submit">Save Changes</button>
    </form>
  </div>
</body>
</html>
