package com.pahanaedu.dao;

import com.pahanaedu.util.DBUtil;
import java.sql.*;
import java.security.MessageDigest;

public class UserDAO {
	public boolean validate(String username, String password) {
	    String sql = "SELECT password FROM users WHERE username = ?";
	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, username);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                String storedPass = rs.getString("password");
	                String hashedInput = sha256(password);  // hash the password entered by user
	                return storedPass.equals(hashedInput);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}



    private String sha256(String base) {
        try{
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if(hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch(Exception ex) { throw new RuntimeException(ex); }
    }
}
