package com.tech.blog.entities;

public class Category {
	
	private int cid;
	private String name;
	private String description;
	
	//Constructor with all filds
	public Category(int cid, String name, String description) {
		this.cid = cid;
		this.name = name;
		this.description = description;
	}
	
	//Default Constructor
	public Category() {
		
	}
	
	//Constructor with all filds but without id
	public Category(String name, String description) {
		this.name = name;
		this.description = description;
	}
	
	
	//Setter and Getter method
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	
	
}
