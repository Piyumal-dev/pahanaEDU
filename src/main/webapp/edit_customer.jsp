<%@ page import="com.pahanaedu.model.Customer" %>
<%
  if (session.getAttribute("username") == null) { 
      response.sendRedirect("login.html"); 
      return; 
  }
  Customer c = (Customer) request.getAttribute("customer");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Edit Customer</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, sans-serif;
        margin: 0;
        background: #f4f6f9;
        color: #333;
    }
    nav {
        background: #4a6cf7;
        padding: 12px 20px;
        display: flex;
        gap: 20px;
    }
    nav a {
        color: #fff;
        text-decoration: none;
        font-weight: 500;
    }
    nav a:hover {
        text-decoration: underline;
    }
    .container {
        max-width: 600px;
        margin: 40px auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    }
    h1 {
        text-align: center;
        margin-bottom: 25px;
        color: #4a6cf7;
    }
    .form-row {
        margin-bottom: 18px;
    }
    label {
        display: block;
        font-weight: 600;
        margin-bottom: 6px;
    }
    input, textarea {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.2s ease;
    }
    input:focus, textarea:focus {
        outline: none;
        border-color: #4a6cf7;
        box-shadow: 0 0 5px rgba(74,108,247,0.3);
    }
    .btn {
        background: #4a6cf7;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        width: 100%;
        transition: background 0.2s;
    }
    .btn:hover {
        background: #3a57d6;
    }
</style>
</head>
<body>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="customers">Customers</a>
        <a href="logout">Logout</a>
    </nav>

    <div class="container">
        <h1>Edit Customer</h1>
        <form method="post" action="editCustomer">
            <input type="hidden" name="account_no" value="<%= c.getAccountNo() %>">

            <div class="form-row">
                <label>Name</label>
                <input type="text" name="name" value="<%= c.getName() %>" required>
            </div>

            <div class="form-row">
                <label>Address</label>
                <textarea name="address" rows="2" required><%= c.getAddress() %></textarea>
            </div>

            <div class="form-row">
                <label>Telephone</label>
                <input type="text" name="telephone" value="<%= c.getTelephone() %>" required>
            </div>

            <div class="form-row">
                <label>Units Consumed</label>
                <input type="number" name="units_consumed" value="<%= c.getUnitsConsumed() %>" required>
            </div>

            <button class="btn" type="submit">Save Changes</button>
        </form>
    </div>
</body>
</html>
