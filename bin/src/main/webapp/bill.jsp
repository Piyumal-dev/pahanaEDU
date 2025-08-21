<%@ page import="com.pahanaedu.model.Customer" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.html"); return; }
  Customer c = (Customer) request.getAttribute("customer");
  String billAccount = request.getAttribute("billAccount") != null ? request.getAttribute("billAccount").toString() : null;
%>
<!doctype html>
<html><head><meta charset="utf-8"><title>Bill</title><link rel="stylesheet" href="css/style.css"></head>
<body>
  <div class="container">
    <nav><a href="dashboard.jsp">Dashboard</a> <a href="customers">Customers</a> <a href="logout">Logout</a></nav>
    <h1>Generate Bill</h1>

    <% if (c != null) { %>
      <h3>Customer: <%= c.getName() %> (Acc: <%= c.getAccountNo() %>)</h3>
      <form method="post" action="calculateBill">
        <input type="hidden" name="account_no" value="<%= c.getAccountNo() %>">
        <div class="form-row"><label>Units</label><input type="number" name="units" value="<%= c.getUnitsConsumed() %>" required></div>
        <div class="form-row"><label>Unit Price (Rs.)</label><input type="number" step="0.01" name="unit_price" value="50.00" required></div>
        <button class="btn" type="submit">Calculate & Print</button>
      </form>
    <% } else if (billAccount != null) { %>
      <h2>Bill generated</h2>
      <p>Units: <%= request.getAttribute("units") %></p>
      <p>Unit Price: Rs. <%= request.getAttribute("unitPrice") %></p>
      <p><strong>Total: Rs. <%= request.getAttribute("total") %></strong></p>
      <button class="btn" onclick="window.print()">Print</button>
    <% } else { %>
      <p>No customer selected.</p>
    <% } %>
  </div>
</body>
</html>
