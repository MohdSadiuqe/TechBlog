package com.tech.blog.entities;

import java.sql.Timestamp;

public class Posts {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private Timestamp pDate;
    private int cid;
    private int userId;

    // Constructor with all parameters
    public Posts(int pid, String pTitle, String pContent, String pCode, Timestamp pDate, int cid, int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pDate = pDate;
        this.cid = cid;
        this.userId = userId;
    }

    // Default constructor
    public Posts() {}

    public int getPid() {
        return pid;
    }

    public void setPid(int Pid) {  // Fixed assignment
        this.pid = Pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
