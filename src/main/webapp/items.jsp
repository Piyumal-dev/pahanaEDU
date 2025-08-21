<%@ page import="java.util.*, com.pahanaedu.model.Item" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.html");
        return;
    }
    List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Manage Items</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f6f9;
    margin: 0;
    padding: 20px;
    color: #333;
  }
  nav {
    background-color: #4a6cf7;
    padding: 15px 25px;
    display: flex;
    gap: 25px;
    border-radius: 8px;
    margin-bottom: 30px;
  }
  nav a {
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 1rem;
    transition: color 0.2s;
  }
  nav a:hover {
    color: #c2d1ff;
  }
  .container {
    max-width: 900px;
    margin: 0 auto;
    background: white;
    padding: 30px 40px;
    border-radius: 14px;
    box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
  }
  h1 {
    color: #4a6cf7;
    margin-bottom: 25px;
    text-align: center;
    font-weight: 700;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 1rem;
  }
  th, td {
    text-align: left;
    padding: 14px 18px;
    border-bottom: 1px solid #e1e5ee;
  }
  th {
    background-color: #f0f3ff;
    color: #4a6cf7;
    font-weight: 600;
  }
  tbody tr:hover {
    background-color: #f9faff;
  }
  td a {
    color: #4a6cf7;
    text-decoration: none;
    font-weight: 600;
    margin-right: 12px;
    transition: color 0.2s;
  }
  td a:hover {
    color: #374bb5;
    text-decoration: underline;
  }
  @media (max-width: 600px) {
    nav {
      flex-direction: column;
      gap: 15px;
      padding: 15px;
    }
    .container {
      padding: 20px;
    }
    table, thead, tbody, th, td, tr {
      display: block;
    }
    thead tr {
      position: absolute;
      top: -9999px;
      left: -9999px;
    }
    tr {
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 15px;
    }
    td {
      border: none;
      padding-left: 50%;
      position: relative;
      white-space: normal;
      text-align: right;
    }
    td:before {
      position: absolute;
      top: 14px;
      left: 15px;
      width: 45%;
      padding-right: 10px;
      white-space: nowrap;
      font-weight: 600;
      text-align: left;
      color: #4a6cf7;
    }
    td:nth-of-type(1):before { content: "Item Code"; }
    td:nth-of-type(2):before { content: "Name"; }
    td:nth-of-type(3):before { content: "Price"; }
    td:nth-of-type(4):before { content: "Actions"; }
  }
</style>
</head>
<body>
<div class="container">
  <nav>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="add_item.html">Add Item</a>
    <a href="logout">Logout</a>
  </nav>
  <h1>Items</h1>
  <table>
    <thead>
      <tr>
        <th>Item Code</th>
        <th>Name</th>
        <th>Price</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <% if (items != null) {
           for (Item item : items) { %>
      <tr>
        <td><%= item.getItemCode() %></td>
        <td><%= item.getName() %></td>
        <td>Rs. <%= String.format("%.2f", item.getPrice()) %></td>
        <td>
          <a href="editItem?item_id=<%= item.getItemId() %>">Edit</a>
          <a href="deleteItem?item_id=<%= item.getItemId() %>" onclick="return confirm('Delete this item?');">Delete</a>
        </td>
      </tr>
      <%   }
         } else { %>
      <tr><td colspan="4" style="text-align:center; color:#888;">No items found</td></tr>
      <% } %>
    </tbody>
  </table>
</div>
</body>
</html>
