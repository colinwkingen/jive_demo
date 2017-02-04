<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="/JiveDemoProject/css/styles.css"/>
  <title>Environment Submission</title>
</head>
<body>
   <h1>Development Environment Logging</h1>
   <h3>Enter your OS, Version Number and Notes:</h3>
   <form action="environment">
      <p><label for="osName">Please enter your OS:</label></p>
      <br>
      <input type="text" name="osName"/><s:fielderror class="error" fieldName="osName"/>
      <p><label for="osVersion">Please enter your OS version:</label></p>
      <br>
      <input type="text" name="osVersion"/><s:fielderror class="error" fieldName="osVersion"/>
      <p><label for="osNotes">Please enter any notes:</label></p>
      <br>
      <input type="text" name="osNotes"/>
      <br>
      <br>
      <input type="submit" value="Submit"/>
      <br>
   </form>
</body>
</html>