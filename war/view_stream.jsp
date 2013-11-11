<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%@ page import="dkconnexus.Stream" %>
<%@ page import="dkconnexus.OfyService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.Collections" %>

<html>
	<head>
	<title>View all streams</title>
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
<%
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		
		ListIterator<Stream> it = th.listIterator();
		int numStreams = th.size();
		int numCols = 3;
		int numRows = (numStreams%numCols == 0)? (numStreams/numCols) : ((numStreams/numCols) + 1);
		%>
		<table>
		<% 
		for (int i = 0;  i < numRows; i++) { 
		%>
			<tr>
			<% 
			for(int j = 0; j < numCols; j++) {
				if (it.hasNext()) {
				    Stream s = it.next();
				    %>
				    <td> <img width="100" height="100" src="<%= s.coverImageUrl %>"> </td>
				    <td><a href="show_stream.jsp?streamId=<%= s.id %>&streamName=<%= s.name %>"> <%= s.name %></a></td>
				    <% 
//			    System.out.println(s);
				}
			}
			%>
			</tr>
		<% 
		}
		
		%>
 </table>
  </body>
  </html>