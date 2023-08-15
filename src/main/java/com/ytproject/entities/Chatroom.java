package com.ytproject.entities;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import lombok.Data;


public  class Chatroom {

	public String description;
	public int senderid;
	public int receiverid;
	public Timestamp time;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSenderid() {
		return senderid;
	}

	public void setSenderid(int senderid) {
		this.senderid = senderid;
	}

	public int getReceiverid() {
		return receiverid;
	}

	public void setReceiverid(int receiverid) {
		this.receiverid = receiverid;
	}

	public Timestamp getTime() {
/*
		try {
			String t = time.toString().replace('.', ':');
			System.out.println(t);
			DateFormat input = new SimpleDateFormat("hh:mm aa");
			return (Timestamp) input.parse(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
*/
		return time;
	}

	public void setTime(Timestamp timestamp) {
		this.time = timestamp;
	}

	public Chatroom() {

	}

	public Chatroom(String description, int senderid, int receiverid, Timestamp time) {
		super();
		this.description = description;
		this.senderid = senderid;
		this.receiverid = receiverid;
		this.time = time;
	}
}
