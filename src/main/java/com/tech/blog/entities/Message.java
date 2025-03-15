package com.tech.blog.entities;

public class Message extends User {
    private String content;
    private String type;
    private String CssClass;

    public Message(String content, String type, String CssClass) {
        this.content = content;
        this.type=type;
        this.CssClass=CssClass;
    }

    // ✅ Fix: Add getMessage() method
    public String getMessage() {
        return this.content;
    }

    // Getters and Setters
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type=type;
    }

    public String getCssClass() {
        return CssClass;
    }

    public void setCssClass(String CssClass) {
        this.CssClass = CssClass;
    }
}
