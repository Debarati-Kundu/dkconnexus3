<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="dkconnexus.EmailTime" %>
<%@ page import="dkconnexus.Stream" %>
<%@ page import="dkconnexus.OfyService" %>
<%@ page import=" static com.googlecode.objectify.ObjectifyService.ofy" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
	<title>Trending Streams</title>
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
<h2>Top 3 Trending Streams</h2>

<table>
<tr>
<% 		
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
//		Collections.sort(th);
		ListIterator<Stream> it = th.listIterator();
		for(int i = 0; i < 3; i++) {
			if (it.hasNext()) {
				Stream s = it.next();
				%>
				<td> <img width="100" height="100" src="<%= s.coverImageUrl %>"> </td>
			    <td><a href="show_stream.jsp?streamId=<%= s.id %>&streamName=<%= s.name %>"> <%= s.name %></a></td>
				<%			
			}
		}
%>
</tr>
</table>
<br><br><br><br><br><br>
<h3 style="text-align: left">Email trending report</h3>
<!--  <form action = "send_report.jsp" method = "get">-->

<form action ="email_time_set.jsp" method="get"> 
	<input type="radio" name="freq" value="no">No reports<br>
	<input type="radio" name="freq" value="five">Every 5 minutes<br>
	<input type="radio" name="freq" value="hour">Every one hour<br>
	<input type="radio" name="freq" value="daily">Every day<br><br>
	<div><input type="submit" value="Update rate"/></div>
</form>

   </form>
  </body>
  </html>