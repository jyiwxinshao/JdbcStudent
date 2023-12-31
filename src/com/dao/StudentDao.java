package com.dao;

import com.bean.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    // 获取学生信息列表
    public static List<Student> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Student> list = new ArrayList<>();
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("select * from stuno");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Student stu = new Student();
                stu.setId(rs.getInt(1));
                stu.setName(rs.getString(2));
                stu.setAge(rs.getInt(3));
                stu.setBirthday(rs.getDate(4));
                stu.setSex(rs.getString(5));
                list.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return list;
    }

    // 增加学生信息
    public static void add(Student stu) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = BaseDao.getConnection();
            stmt = con.prepareStatement("insert into stuno(id,name,age,birthday,sex) values(?,?,?,?,?)");
            stmt.setInt(1, stu.getId());
            stmt.setString(2, stu.getName());
            stmt.setInt(3, stu.getAge());
            stmt.setDate(4, (Date) stu.getBirthday());
            stmt.setString(5, stu.getSex());
            stmt.executeUpdate();       //更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 根据学号删除学生信息
    public static void delete(int id) {
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            con = BaseDao.getConnection();
            stmt = con.prepareStatement("delete from stuno where id=?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 获取单个学生对象
    public static Student getStudent(int id) {
        Student s = new Student();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("select * from stuno where id=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setAge(rs.getInt("age"));
                s.setBirthday(rs.getDate("birthday"));
                s.setSex(rs.getString("sex"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return s;
    }

    // 修改功能
    public static void updateStudent(Student student) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            String sql = "UPDATE stuno SET id=?,name=?,age=?,birthday=?,sex=? where id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, student.getId());
            stmt.setString(2, student.getName());
            stmt.setInt(3, student.getAge());
            stmt.setDate(4, new java.sql.Date(student.getBirthday().getTime()));
            stmt.setString(5, student.getSex());
            stmt.setInt(6, student.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
    }

    // 查询功能，根据模糊查询学号返回所有学生信息
    public static List<Student> getStudentList(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Student> allStudent = new ArrayList<>();
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("select * from stuno where id like ?");
            stmt.setString(1, "%" + id + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Student stu = new Student();
                stu.setId(rs.getInt(1));
                stu.setName(rs.getString(2));
                stu.setAge(rs.getInt(3));
                stu.setBirthday(rs.getDate(4));
                stu.setSex(rs.getString(5));
                allStudent.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return allStudent;
    }
}
