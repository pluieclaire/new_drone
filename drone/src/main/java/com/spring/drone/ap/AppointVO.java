package com.spring.drone.ap;

import org.springframework.stereotype.Component;

@Component
public class AppointVO {

	private String Appoint_Title;
	private String Appoint_Date;
	private String Appoint_Desc;
	private String User_Id;
	
	public String getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(String user_Id) {
		User_Id = user_Id;
	}
	public String getAppoint_Title() {
		return Appoint_Title;
	}
	public void setAppoint_Title(String appoint_Title) {
		Appoint_Title = appoint_Title;
	}
	public String getAppoint_Date() {
		return Appoint_Date;
	}
	public void setAppoint_Date(String appoint_Date) {
		Appoint_Date = appoint_Date;
	}
	public String getAppoint_Desc() {
		return Appoint_Desc;
	}
	public void setAppoint_Desc(String appoint_Desc) {
		Appoint_Desc = appoint_Desc;
	}
	
	
}
