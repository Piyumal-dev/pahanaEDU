<%@ page import="com.pahanaedu.model.Customer" %>
<%
  if (session.getAttribute("username") == null) { 
      response.sendRedirect("login.html"); 
      return; 
  }
  Customer c = (Customer) request.getAttribute("customer");
  String billAccount = request.getAttribute("billAccount") != null ? request.getAttribute("billAccount").toString() : null;
  String customerName = request.getAttribute("customerName") != null ? request.getAttribute("customerName").toString() : "N/A";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Bill</title>
<style>
  /* General Reset and Font */
  * {
    box-sizing: border-box;
  }
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    background: #f0f3fa;
    color: #222;
  }
  nav {
    background: #3751ff;
    padding: 14px 24px;
    display: flex;
    gap: 25px;
    font-weight: 600;
  }
  nav a {
    color: #fff;
    text-decoration: none;
    font-size: 16px;
    padding: 6px 10px;
    border-radius: 6px;
    transition: background-color 0.3s ease;
  }
  nav a:hover, nav a:focus {
    background-color: #2a3fcc;
  }

  .container {
    max-width: 700px;
    margin: 50px auto 80px;
    background: #fff;
    padding: 35px 40px;
    border-radius: 14px;
    box-shadow: 0 12px 24px rgba(55, 81, 255, 0.15);
  }
  h1, h2, h3 {
    color: #3751ff;
    font-weight: 700;
    margin-bottom: 30px;
    text-align: center;
  }
  p {
    font-size: 17px;
    color: #444;
  }

  /* Form Styling */
  form {
    max-width: 480px;
    margin: 0 auto;
  }
  .form-row {
    margin-bottom: 24px;
  }
  label {
    display: block;
    font-weight: 700;
    margin-bottom: 8px;
    color: #3a3a3a;
  }
  input[type="number"], select {
    width: 100%;
    padding: 14px 18px;
    font-size: 16px;
    border-radius: 10px;
    border: 1.8px solid #c1c8e4;
    background-color: #f9fbff;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
  }
  input[type="number"]:focus, select:focus {
    border-color: #3751ff;
    box-shadow: 0 0 8px rgba(55, 81, 255, 0.4);
    outline: none;
  }
  input[readonly] {
    background-color: #e9efff;
    cursor: not-allowed;
  }
  .btn {
    background-color: #3751ff;
    color: #fff;
    border: none;
    border-radius: 12px;
    padding: 14px 0;
    font-size: 18px;
    font-weight: 700;
    cursor: pointer;
    width: 100%;
    transition: background-color 0.25s ease;
  }
  .btn:hover, .btn:focus {
    background-color: #2a3fcc;
  }

  /* Bill Summary (printable) */
  #printable {
    max-width: 700px;
    margin: 40px auto;
    background: #fff;
    padding: 40px 50px;
    border-radius: 14px;
    box-shadow: 0 14px 28px rgba(55, 81, 255, 0.15);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #222;
  }
  .company-header {
    text-align: center;
    margin-bottom: 35px;
  }
  .company-header h2 {
    margin: 0 0 6px;
    font-size: 32px;
    letter-spacing: 3px;
    font-weight: 900;
    color: #3751ff;
  }
  .company-header p {
    margin: 4px 0;
    font-size: 16px;
    font-weight: 600;
    color: #555;
  }
  hr {
    border: none;
    border-top: 1.5px solid #e2e8f0;
    margin: 30px 0;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 17px;
    color: #222;
  }
  th, td {
    border: 1.5px solid #d2d8e6;
    padding: 14px 18px;
    text-align: left;
  }
  th {
    background-color: #e6edff;
    font-weight: 700;
    color: #3751ff;
  }
  td.text-center {
    text-align: center;
  }
  td.text-right {
    text-align: right;
  }
  .total-row td {
    font-weight: 800;
    font-size: 20px;
    background-color: #f3f7ff;
  }
  .thankyou {
    text-align: center;
    margin-top: 50px;
    font-weight: 700;
    font-size: 18px;
    color: #4a4a4a;
  }

  /* Print Styles */
  @media print {
    body * {
      visibility: hidden;
    }
    #printable, #printable * {
      visibility: visible;
    }
    #printable {
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      padding: 30px 50px;
      box-shadow: none;
      border-radius: 0;
      font-size: 15pt;
      color: #000;
      background: white;
    }
    #printable table, #printable th, #printable td {
      border-color: #000 !important;
    }
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
    <h1>Generate Bill</h1>

    <% if (c != null) { %>
      <h3>Customer: <%= c.getName() %> (Acc: <%= c.getAccountNo() %>)</h3>

      <form method="post" action="calculateBill">
        <input type="hidden" name="account_no" value="<%= c.getAccountNo() %>">

        <div class="form-row">
          <label for="units">Units</label>
          <input type="number" id="units" name="units" value="<%= c.getUnitsConsumed() %>" min="0" required>
        </div>

        <div class="form-row">
          <label for="itemSelect">Select Item</label>
          <select id="itemSelect" name="item_id" required>
            <option value="">-- Select Item --</option>
            <% 
              com.pahanaedu.dao.ItemDAO itemDAO = new com.pahanaedu.dao.ItemDAO();
              java.util.List<com.pahanaedu.model.Item> items = itemDAO.findAll();
              for (com.pahanaedu.model.Item item : items) { 
            %>
              <option value="<%= item.getItemId() %>" data-price="<%= item.getPrice() %>">
                <%= item.getName() %> - Rs.<%= String.format("%.2f", item.getPrice()) %>
              </option>
            <% } %>
          </select>
        </div>

        <div class="form-row">
          <label for="unit_price">Unit Price (Rs.)</label>
          <input type="number" step="0.01" id="unit_price" name="unit_price" value="0.00" readonly required>
        </div>

        <div class="form-row">
          <label for="total">Total Amount (Rs.)</label>
          <input type="number" step="0.01" id="total" name="total" value="0.00" readonly>
        </div>

        <button class="btn" type="submit">Calculate & Print</button>
      </form>

    <% } else if (billAccount != null) { %>

      <div id="printable" role="region" aria-label="Bill details">
        <div class="company-header">
          <h2>Pahana Edu Power Ltd.</h2>
          <p>No. 123, Main Street, Colombo</p>
          <p>Tel: +94 11 1234567 | Email: info@pahanaedu.lk</p>
          <hr>
        </div>

        <h2>Bill</h2>

        <table>
          <thead>
            <tr>
              <th>Description</th>
              <th class="text-center">Units</th>
              <th class="text-right">Unit Price (Rs.)</th>
              <th class="text-right">Amount (Rs.)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Electricity Consumption</td>
              <td class="text-center"><%= request.getAttribute("units") %></td>
              <td class="text-right"><%= request.getAttribute("unitPrice") %></td>
              <td class="text-right"><%= request.getAttribute("total") %></td>
            </tr>
            <tr class="total-row">
              <td colspan="3" class="text-right">Total</td>
              <td class="text-right"><%= request.getAttribute("total") %></td>
            </tr>
          </tbody>
        </table>

        <p class="thankyou">Thank you for your payment!</p>
      </div>

      <button class="btn" onclick="window.print()">Print</button>

    <% } else { %>
      <p style="text-align:center; font-size: 18px; color: #999;">No customer selected.</p>
    <% } %>
  </div>

  <script>
    const itemSelect = document.getElementById('itemSelect');
    const unitPriceInput = document.getElementById('unit_price');
    const unitsInput = document.getElementById('units');
    const totalInput = document.getElementById('total');

    function calculateTotal() {
      const units = parseFloat(unitsInput.value) || 0;
      const price = parseFloat(unitPriceInput.value) || 0;
      totalInput.value = (units * price).toFixed(2);
    }

    itemSelect.addEventListener('change', function() {
      const price = this.options[this.selectedIndex].getAttribute('data-price');
      unitPriceInput.value = price || "0.00";
      calculateTotal();
    });

    unitsInput.addEventListener('input', calculateTotal);
  </script>

</body>
</html>
