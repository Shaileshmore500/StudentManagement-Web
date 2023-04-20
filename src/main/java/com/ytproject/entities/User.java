package com.ytproject.entities;

import java.sql.Timestamp;

public class User {
	private int id;
	private String name;
	private String email;
	private String number;
	private String password;
	private String profile_img;
	private Timestamp register_date;

	// Create Constructor

	// default constructor
	public User() {

	}

	public User(int id, String name, String email, String number, String password) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.number = number;
		this.password = password;

	}

	public User(String email, String password) {

		this.email = email;

		this.password = password;

	}

	public User(String name, String email, String number, String password, String profile_img) {

		this.name = name;
		this.email = email;
		this.number = number;
		this.password = password;
		this.profile_img = profile_img;

	}

	public User(String name, String email, String number, String password) {

		this.name = name;
		this.email = email;
		this.number = number;
		this.password = password;

	}

	public User(int id, String name, String email, String number, String password, String profile_img,
			Timestamp register_date) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.number = number;
		this.password = password;
		this.profile_img = profile_img;
		this.register_date = register_date;

	}

	public User(String name, String email, String number, String password, String profile_img,
			Timestamp register_date) {

		this.name = name;
		this.email = email;
		this.number = number;
		this.password = password;
		this.profile_img = profile_img;
		this.register_date = register_date;

	}

	// getters and setters
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getNumber() {
		return number;
	}

	public String getPassword() {
		return password;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public Timestamp getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Timestamp register_date) {
		this.register_date = register_date;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

}
