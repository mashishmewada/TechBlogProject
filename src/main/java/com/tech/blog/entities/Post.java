package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	
	private int pid;
	private String pTitle;
	private String pContent;
	private String pcode;
	private String pPic;
	private Timestamp pdate;
	private int catId;
	private int userId;
	
	//Default Constructor
	public Post() {
		
	}


	//Constructor with all filds
	public Post(int pid, String pTitle, String pContent, String pcode, String pPic, Timestamp pdate, int catId, int userId) {
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pcode = pcode;
		this.pPic = pPic;
		this.pdate = pdate;
		this.catId = catId;
		this.userId = userId;
	}


	//Constructor with all filds but without id
	public Post(String pTitle, String pContent, String pcode, String pPic, Timestamp pdate, int catId, int userId) {
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pcode = pcode;
		this.pPic = pPic;
		this.pdate = pdate;
		this.catId = catId;
		this.userId = userId;
	}


	//Setter and Getter method
	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
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


	public String getPcode() {
		return pcode;
	}


	public void setPcode(String pcode) {
		this.pcode = pcode;
	}


	public String getpPic() {
		return pPic;
	}


	public void setpPic(String pPic) {
		this.pPic = pPic;
	}


	public Timestamp getPdate() {
		return pdate;
	}


	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}


	public int getCatId() {
		return catId;
	}


	public void setCatId(int catId) {
		this.catId = catId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
