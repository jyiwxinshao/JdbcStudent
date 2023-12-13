package com.dao;

import com.bean.Admin;

import java.sql.*;

public class AdminDao {
    // 增加管理员信息
    public static void add(Admin admin) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = BaseDao.getConnection();
            stmt = con.prepareStatement("insert into admininistrator(account,password) values(?,?)");
            stmt.setString(1, admin.getAccount());
            stmt.setString(2, admin.getPassword());
            stmt.executeUpdate();       //更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 修改功能
    public static void updateAdmin(Admin admin) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            String sql = "UPDATE admininistrator SET account=?,password=? where account=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, admin.getAccount());
            stmt.setString(2, admin.getPassword());
            stmt.setString(3, admin.getAccount());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
    }
}
