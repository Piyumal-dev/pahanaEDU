package com.pahanaedu.dao;

import com.pahanaedu.model.Customer;
import com.pahanaedu.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class CustomerDAO {
    public boolean addCustomer(Customer c) {
        String sql = "INSERT INTO customers (account_no, name, address, telephone, units_consumed) VALUES (?,?,?,?,?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, c.getAccountNo());
            ps.setString(2, c.getName());
            ps.setString(3, c.getAddress());
            ps.setString(4, c.getTelephone());
            ps.setInt(5, c.getUnitsConsumed());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateCustomer(Customer c) {
        String sql = "UPDATE customers SET name=?, address=?, telephone=?, units_consumed=? WHERE account_no=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getName());
            ps.setString(2, c.getAddress());
            ps.setString(3, c.getTelephone());
            ps.setInt(4, c.getUnitsConsumed());
            ps.setInt(5, c.getAccountNo());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) { ex.printStackTrace(); return false; }
    }

    public Customer findByAccount(int acc) {
        String sql = "SELECT * FROM customers WHERE account_no=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, acc);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(
                        rs.getInt("account_no"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("telephone"),
                        rs.getInt("units_consumed")
                    );
                }
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return null;
    }

    public java.util.List<Customer> findAll() {
        java.util.List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM customers ORDER BY account_no";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Customer(
                    rs.getInt("account_no"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getInt("units_consumed")
                ));
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return list;
    }
}
