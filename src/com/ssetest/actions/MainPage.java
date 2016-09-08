package com.ssetest.actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;


//upon successful form submission, this will redirect to the results
@Result(name="success", location="results", type="redirect")
public class MainPage extends ActionSupport {

	//input attributes
	private String enteredOS;
	private String enteredVersion;
	private String enteredNotes;

	
	@Override
	public String execute() throws Exception {
		
		Connection conn = null;
		
		try{
			//establishing connection
			Class.forName("com.mysql.jdbc.Driver");
			conn = DBConnection.getConnection();
			
			//SQL Statement for the prepared statement
			String sql = "insert into OSInformation values (?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			//enter input information into database
			ps.setString(1, enteredOS);
			ps.setString(2, enteredVersion);
			ps.setString(3, enteredNotes);
			
			ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			if(conn != null)
				conn.close();
		}
		
		return SUCCESS;
	}

	public String getEnteredOS() {
		return enteredOS;
	}

	@RequiredFieldValidator(type=ValidatorType.FIELD, message="OS is a required field")
	public void setEnteredOS(String enteredOS) {
		this.enteredOS = enteredOS;
	}

	public String getEnteredVersion() {
		return enteredVersion;
	}

	@RequiredFieldValidator(type=ValidatorType.FIELD, message="OS Version is a required field")
	public void setEnteredVersion(String enteredVersion) {
		this.enteredVersion = enteredVersion;
	}

	public String getEnteredNotes() {
		return enteredNotes;
	}

	public void setEnteredNotes(String enteredNotes) {
		this.enteredNotes = enteredNotes;
	}

}
