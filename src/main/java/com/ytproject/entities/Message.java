package com.ytproject.entities;

public class Message {
	
	private String content;
	private String type;
	private String cssClass;
	private String pagename; 
	
	public Message(String content,String type , String cssClass) {
		  this.content=content;
		  this.type=type;
		  this.cssClass=cssClass;
		  
	}
	public String getContent() {
		return content;
	}
	public Message(String content, String type, String cssClass, String pagename) {
		super();
		this.content = content;
		this.type = type;
		this.cssClass = cssClass;
		this.pagename = pagename;
	}
	public String getPagename() {
		return pagename;
	}
	public void setPagename(String pagename) {
		this.pagename = pagename;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
}
