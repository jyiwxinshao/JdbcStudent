package com.bean;

import java.util.Date;

public class Student {
    private int id;
    private String name;
    private int age;
    private Date birthday;
    private String sex;

    public Student() {
    }

    public Student(int id, String name, int age, Date birthday, String sex) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.birthday = birthday;
        this.sex = sex;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
