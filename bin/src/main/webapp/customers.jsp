<%@ page import="java.util.*, com.pahanaedu.model.Customer" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.html"); return; }
  List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!doctype html>
<html><head><meta charset="utf-8"><title>Customers</title><link rel="stylesheet" href="css/style.css"></head>
<body>
  <div class="container">
    <nav><a href="dashboard.jsp">Dashboard</a> <a href="add_customer.html">Add Customer</a> <a href="logout">Logout</a></nav>
    <h1>Customers</h1>
    <table>
      <tr><th>Account No</th><th>Name</th><th>Address</th><th>Telephone</th><th>Units</th><th>Actions</th></tr>
      <% if (customers != null) {
           for (Customer c : customers) { %>
             <tr>
               <td><%= c.getAccountNo() %></td>
               <td><%= c.getName() %></td>
               <td><%= c.getAddress() %></td>
               <td><%= c.getTelephone() %></td>
               <td><%= c.getUnitsConsumed() %></td>
               <td>
                 <a href="editCustomer?account_no=<%= c.getAccountNo() %>">Edit</a> |
                 <a href="calculateBill?account_no=<%= c.getAccountNo() %>">Bill</a>
               </td>
             </tr>
      <%   }
         } %>
    </table>
  </div>
</body>
</html>
