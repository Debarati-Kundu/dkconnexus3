<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.lang.reflect.Field" %>
<%@ page import= "dkconnexus.Stream" %>
<%@ page import= "dkconnexus.OfyService" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
	<title>Search Streams</title>
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
<br>

<table>
<% 
	String query = request.getParameter("query");
	List<Stream> results = new ArrayList<Stream>();
	ListIterator<Stream> it = results.listIterator();
	
	Class Stream1 = Stream.class;
	for (Field field : Stream1.getDeclaredFields()) {
		String fieldName = field.getName();
		List<Stream> s = OfyService.ofy().load().type(Stream.class).filter(fieldName + " >=", query)
				.filter(fieldName + " <", query + "\uFFFD").list();
//		System.out.println("s2 " + fieldName + " " + s.size());
		for (Stream s1 : s) {
			if(!results.contains(s1)) {
				results.add(s1);
%>
				<tr><td> <img width="100" height="100" src="<%= s1.coverImageUrl %>"> </td> 
				<td><a href="show_stream.jsp?streamId=<%= s1.id %>&streamName=<%= s1.name %>"> <%= s1.name %></a></td><tr>
<% 
			}
		}
	}
%>
</table>

<%
if (results.size()==0)
{
%>
<h1>No result found</h1>
<% 
}
%>

<!-- 
<form action="/sign" method="post">
	<div><textarea name="content" rows="1" cols="60">Enter stream name..</textarea></div>
	<div><input type="submit" value="Search"/></div>
</form>
-->
  </body>
  </html>