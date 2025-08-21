package com.pahanaedu.dao;

import com.pahanaedu.model.Item;
import com.pahanaedu.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {
    public List<Item> findAll() {
        List<Item> list = new ArrayList<>();
        String sql = "SELECT * FROM items ORDER BY item_code";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Item(
                    rs.getInt("item_id"),
                    rs.getString("item_code"),
                    rs.getString("name"),
                    rs.getDouble("price")
                ));
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return list;
    }

    public Item findById(int id) {
        String sql = "SELECT * FROM items WHERE item_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Item(
                        rs.getInt("item_id"),
                        rs.getString("item_code"),
                        rs.getString("name"),
                        rs.getDouble("price")
                    );
                }
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return null;
    }

    public boolean addItem(Item item) {
        String sql = "INSERT INTO items (item_code, name, price) VALUES (?,?,?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, item.getItemCode());
            ps.setString(2, item.getName());
            ps.setDouble(3, item.getPrice());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) { ex.printStackTrace(); return false; }
    }

    public boolean updateItem(Item item) {
        String sql = "UPDATE items SET item_code=?, name=?, price=? WHERE item_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, item.getItemCode());
            ps.setString(2, item.getName());
            ps.setDouble(3, item.getPrice());
            ps.setInt(4, item.getItemId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) { ex.printStackTrace(); return false; }
    }

    public boolean deleteItem(int id) {
        String sql = "DELETE FROM items WHERE item_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) { ex.printStackTrace(); return false; }
    }
}
