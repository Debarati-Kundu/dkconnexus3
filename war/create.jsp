<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
	<title>Create your own stream</title>
	<link type="text/css" rel="stylesheet" href="/stylesheets/main1.css"> 
	</head>
	
  <body>
  	<h1 style="text-align: center;">Connex.us</h1>
  	<div id="nav">
	<ul style="text-align: center;">
		<li> <a href="dkconnexus.jsp">Manage</a> </li>
		<li> <a href="create.jsp">Create</a> </li>
		<li> <a href="view_stream.jsp">View</a> </li>
		<li> <a href="search.jsp">Search</a> </li>
		<li> <a href="trending.jsp">Trending</a>
		</li> <li class="last"> <a href="social.jsp">Social</a></li>
	</ul>
	<br class="clear" />
</div>
<h2> Create your own stream</h2>
<br>

<form style="text-align: left;" name="CreateStreamInput" action="createStreamServlet"
		method="get">
		Name: <input type="text" name="streamName">
		<br> 
		<br> 
		Tags: <input type="text" name="tags">
		<br> 
		<br> 
		URL to display image: <input type="text" name="url">
		<br>
		<br> 
		Add subscribers: <input type="text" name="subs">
		<br>
		<br> 
		Add optional message: <input type="text" name="msg">
		<br>
		<br> 
		<input type="submit" value="Create Stream">
</form>

<!--  

<form action="/sign" method="post">
	<div><textarea name="content" rows="1" cols="60">Enter name here..</textarea></div>
	<div><input type="submit" value="Name your stream"/></div>
</form>
<br>
<br>
<br>
<form action="/sign" method="post">
	<div><textarea name="content" rows="3" cols="60">Enter subscriber list</textarea></div>
	<br>
	<div><textarea name="content" rows="3" cols="60">Optional message for invite</textarea></div>
	<div><input type="submit" value="Add subscribers"/></div>
</form>

<form action="/sign" method="post">
	<div style="position:absolute; top: 210px; left: 750px;"><textarea name="content" rows="3" cols="60">Enter tags</textarea></div>
	<div style="position:absolute; top: 280px; left: 750px;"><input type="submit" value="Tag your streams"/></div>
</form>

<form action="/sign" method="post">
	<div style="position:absolute; top: 400px; left: 750px;"><textarea name="content" rows="1" cols="60"></textarea></div>
	<div style="position:absolute; top: 450px; left: 750px;"><input type="submit" value="URL to cover image (Can be empty)"/></div>
</form>

<br>
<form action="/sign" method="post">
	<div style="text-align: center;"><input type="submit" value="Create Stream"/></div>
</form>
-->
  </body>
  </html>