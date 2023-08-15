package com.ytproject.entities;

import java.sql.Timestamp;

public class post {
	
	int pId;
	
	String pTitle;
	String pContent;
	String pCode;
	String pLink;
	String pPic;
	int cId;
	int userId;
	Timestamp pDate;
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
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
	public String getpLink() {
		return pLink;
	}
	public void setpLink(String pLink) {
		this.pLink = pLink;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public post(int pId, String pTitle, String pContent, String pCode, String pLink, String pPic, int cId, int userId,
			Timestamp pDate) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pLink = pLink;
		this.pPic = pPic;
		this.cId = cId;
		this.userId = userId;
		this.pDate = pDate;
	}
	public post(String pTitle, String pContent, String pCode, String pLink, String pPic, int cId, int userId,
			Timestamp pDate) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pLink = pLink;
		this.pPic = pPic;
		this.cId = cId;
		this.userId = userId;
		this.pDate = pDate;
	}
	
	public post( int cId,String pTitle, String pContent, String pCode, String pLink,String pPic,int userId ) {
		//String query = "insert into post (pTitle , pContent , pCode , pLink , pPic) values(?,?,?,?,?)";
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pLink = pLink;
		this.pPic = pPic;
		this.cId = cId;
		this.userId=userId;
		
		//this.userId = userId;
	}
	
	
	

}
