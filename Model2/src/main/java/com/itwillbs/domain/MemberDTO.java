package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {
	//멤버변수=> 은닉(private), 캡슐화
	private String id;
	private String pass;
	private String pass1;
	private String pass2;
	private String name;
	private Timestamp date;
	
	
	//멤버변수 접근메서드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass1() {
		return pass1;
	}
	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getPass2() {
		return pass2;
	}
	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}
	
	
	
	
}
