<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
	<title>Development Environment Submission</title>
	<link rel="stylesheet" href="/JiveDemoProject/css/styles.css" type="text/css">
</head>
<body>
   <h2>Results:</h2>
   <p><h3>Your OS:</h3><br><s:property value="osName"/></p>
   <br>
   <p><h3>Your OS Version:</h3><br><s:property value="osVersion"/></p>
   <br>
   <p><h3>Your OS Notes:</h3><br><s:property value="osNotes"/></p>
   <br>
   <h4><a href="/JiveDemoProject/index.jsp">Back</a></h4>
   <hr>
   <h2>Previous Entries:</h2>
    <div class="nameList">
      <h3>OS Name:</h3>	
   	  <ul>
   		<s:property escapeHtml="false" value="queryName"/>
   	  </ul>
   	</div>
   	<div class="versionList">
      <h3>OS Version:</h3>
      <ul>
   		<s:property escapeHtml="false" value='queryVersion'/>
   	  </ul>
   	</div>
   	<div class="notesList">
   	  <h3>OS Notes:</h3>
   	  <ul>
   		<s:property escapeHtml="false" value='queryNotes'/>
   	  </ul>
   	</div>  
</body>
</html>
