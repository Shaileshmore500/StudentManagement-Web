package com.ytproject.entities;

public class category {
	int cat_id;
	String cat_name;
	String cat_desc;
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getCat_desc() {
		return cat_desc;
	}
	public void setCat_desc(String cat_desc) {
		this.cat_desc = cat_desc;
	}
	public category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public category(int cat_id, String cat_name, String cat_desc) {
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
		this.cat_desc = cat_desc;
	}
	public category(String cat_name, String cat_desc) {
		super();
		this.cat_name = cat_name;
		this.cat_desc = cat_desc;
	}
	

}
