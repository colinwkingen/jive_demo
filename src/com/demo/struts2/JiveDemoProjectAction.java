package com.demo.struts2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;

import org.apache.commons.lang.StringEscapeUtils;

import com.opensymphony.xwork2.ActionSupport;

import java.lang.System.*;

public class JiveDemoProjectAction extends ActionSupport{
		
   public String osName;
   public String osVersion;
   public String osNotes;
   
   public String queryName;
   public String queryVersion;
   public String queryNotes;
   

   public String execute() throws Exception {
	   
	   String formResult = "Invalid Result.";
	   Connection mysqlConn = null;
	   try {
		   String URL = "jdbc:mysql://localhost/colin_jive_demo";
		   Class.forName("com.mysql.jdbc.Driver");
		   mysqlConn = DriverManager.getConnection(URL, "colin_demo", "Colin_32");
		   System.out.println("+++++++ Query and Prepare +++++++");
		   queryName = "SELECT name FROM environment;"; 
		   queryVersion = "SELECT version FROM environment;";
		   queryNotes = "SELECT notes FROM environment;";
		   
		   PreparedStatement psName = mysqlConn.prepareStatement(queryName); 
		   PreparedStatement psVersion = mysqlConn.prepareStatement(queryVersion);
		   PreparedStatement psNotes = mysqlConn.prepareStatement(queryNotes);
		   	   
		   String insertStatement = "INSERT INTO environment (name, version, notes) VALUES";
		   insertStatement += " ('" + this.osName + "', '" + this.osVersion + "', '" + this.osNotes + "' );";
		   
		   PreparedStatement ps = mysqlConn.prepareStatement(insertStatement);
		   try {
			   ps.executeUpdate();
		   } catch (Exception e) {
			   System.out.println("+++++++ Error Inserting Values to Database +++++++");
			   System.out.println(ps);
			   e.printStackTrace();
		   }
		   ResultSet nameSet = null;
		   ResultSet versionSet = null;
		   ResultSet notesSet = null;
		   try {
			   nameSet = psName.executeQuery();
			   versionSet = psVersion.executeQuery();
			   notesSet = psNotes.executeQuery();
		   } catch (Exception e) {
			   e.printStackTrace();
			   System.out.println("+++++++ Error Grabbing Values from Database +++++++");
		   }
		   try {
			 queryName = parseResults(nameSet);	  
			 queryVersion = parseResults(versionSet);
			 queryNotes = parseResults(notesSet);
		   } catch (Exception e) {
			   System.out.println("+++++++ Error Parsing Results +++++++");
			   e.printStackTrace();
		   }  
	   } catch (Exception e) {
		   System.out.println("+++++++ General Error getting connection and executing SQL. +++++++");
		   e.printStackTrace();
	   }
	   if (osName != null && osVersion != null) {
		   return "success";
	   } else {
		   return "input";   
	   }
   }
   
   public String parseResults(ResultSet set) {
	  String all = "";
	  try {
		  int columns = set.getMetaData().getColumnCount();
		  while(set.next()){
			 for (int i = 0; i < columns;) {
			    all += "<li>" + (set.getString(i + 1)) + "</li>";
			    if (++i < columns) all += ",";
			 }
		  }  
	  } catch (SQLException se) {
		  se.printStackTrace();
		  System.out.println("+++++++ SQL Exception! +++++++");
	  }
	  return all;
   }
   
   public void validate(){
	 if ( osName.length() < 1 ){ 
       addFieldError("osName", "OS Name is a required field." );   
     }
     if ( osVersion.length() < 1 ){ 
	   addFieldError("osVersion", "OS Version is a required field." );
	 }
   }
   
   public String getosName() {
      return osName;
   }

   public void setosName(String osName) {
      this.osName = osName;
   }
   
   public String getosVersion() {
	  return osVersion;
   }

   public void setosVersion(String osVersion) {
	  this.osVersion = osVersion;
   }
   
   public String getosNotes() {
	  return osNotes;
   }

   public void setosNotes(String osNotes) {
	  this.osNotes = osNotes;
   }

    
}
