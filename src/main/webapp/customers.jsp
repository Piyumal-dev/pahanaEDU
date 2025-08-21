<%@ page import="java.util.*, com.pahanaedu.model.Customer" %>
<%
    if (session.getAttribute("username") == null) { 
        response.sendRedirect("login.html"); 
        return; 
    }
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Customers</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* Navbar */
    nav {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        display: flex;
        justify-content: center;
        gap: 25px;
        padding: 15px 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        position: sticky;
        top: 0;
        z-index: 10;
    }

    nav a {
        color: white;
        text-decoration: none;
        font-size: 1.05rem;
        font-weight: 500;
        padding: 6px 8px;
        transition: color 0.3s ease;
    }

    nav a:hover {
        color: #ffd700;
    }

    /* Container */
    .container {
        flex: 1;
        padding: 30px;
        color: white;
    }

    h1 {
        text-align: center;
        margin-bottom: 25px;
        font-size: 2rem;
    }

    /* Table Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        background: rgba(255, 255, 255, 0.12);
        backdrop-filter: blur(8px);
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }

    th, td {
        padding: 14px 16px;
        text-align: left;
    }

    th {
        background: rgba(255, 255, 255, 0.15);
        font-weight: 600;
        color: #fff;
    }

    tr:nth-child(even) {
        background: rgba(255, 255, 255, 0.08);
    }

    tr:hover {
        background: rgba(255, 255, 255, 0.2);
        transition: background 0.3s ease;
    }

    /* Action buttons */
    .btn {
        padding: 6px 12px;
        border-radius: 6px;
        text-decoration: none;
        font-size: 0.9rem;
        font-weight: 500;
        color: white;
        transition: all 0.3s ease;
    }

    .btn-edit {
        background: #28a745;
    }

    .btn-edit:hover {
        background: #218838;
    }

    .btn-bill {
        background: #17a2b8;
    }

    .btn-bill:hover {
        background: #138496;
    }

    /* Responsive table */
    @media (max-width: 768px) {
        table, thead, tbody, th, td, tr {
            display: block;
        }
        thead {
            display: none;
        }
        tr {
            margin-bottom: 15px;
            background: rgba(255,255,255,0.1);
            border-radius: 8px;
            padding: 10px;
        }
        td {
            padding: 10px;
            text-align: right;
            position: relative;
        }
        td::before {
            content: attr(data-label);
            position: absolute;
            left: 10px;
            font-weight: bold;
            color: #ffd700;
        }
    }
</style>
</head>
<body>

<nav>
    <a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
    <a href="add_customer.html"><i class="fas fa-user-plus"></i> Add Customer</a>
    <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</nav>

<div class="container">
    <h1>Customer List</h1>
    <table>
        <thead>
            <tr>
                <th>Account No</th>
                <th>Name</th>
                <th>Address</th>
                <th>Telephone</th>
                <th>Units</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% if (customers != null) {
             for (Customer c : customers) { %>
                <tr>
                    <td data-label="Account No"><%= c.getAccountNo() %></td>
                    <td data-label="Name"><%= c.getName() %></td>
                    <td data-label="Address"><%= c.getAddress() %></td>
                    <td data-label="Telephone"><%= c.getTelephone() %></td>
                    <td data-label="Units"><%= c.getUnitsConsumed() %></td>
                    <td data-label="Actions">
                        <a class="btn btn-edit" href="editCustomer?account_no=<%= c.getAccountNo() %>">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        &nbsp;
                        <a class="btn btn-bill" href="calculateBill?account_no=<%= c.getAccountNo() %>">
                            <i class="fas fa-file-invoice-dollar"></i> Bill
                        </a>
                    </td>
                </tr>
        <%   }
           } %>
        </tbody>
    </table>
</div>

</body>
</html>
