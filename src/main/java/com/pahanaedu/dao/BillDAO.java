package com.pahanaedu.dao;

import com.pahanaedu.util.DBUtil;
import java.sql.*;

public class BillDAO {
    public boolean saveBill(int accountNo, int units, double unitPrice, double total) {
        String sql = "INSERT INTO bills (account_no, units, unit_price, total_amount) VALUES (?,?,?,?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, accountNo);
            ps.setInt(2, units);
            ps.setDouble(3, unitPrice);
            ps.setDouble(4, total);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) { ex.printStackTrace(); return false; }
    }
}
