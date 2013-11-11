<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>s
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%@ page import="dkconnexus.Stream" %>
<%@ page import="dkconnexus.OfyService" %>
<%@ page import="dkconnexus.ConnexusImage" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>

<html>
	<head>
	<title>View individual stream</title>
	<link type="text/css" rel="stylesheet" href="/stylesheets/main1.css"> 
	</head>
	
  <body>
<%
		UserService userService = UserServiceFactory.getUserService(); 
		User user = userService.getCurrentUser(); 

		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		Long streamId = new Long(request.getParameter("streamId"));
		String streamName = request.getParameter("streamName");
%>		
<%
// Presently it assumes that the user has logged in already, and does not throw any error 
// if user is not logged in. It will redirect to the same //page as the subscribe button
		List<Stream> s = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(s);
		for ( Stream str : s ) {
		    if ( str.id.equals(streamId) ) {
		    	if (str.subscribers == null) {
					str.subscribers = new LinkedList<String>();
				}
		    	if(!str.subscribers.contains(user.getEmail()))
		    		str.subscribers.add(user.getEmail()); 
		    	OfyService.ofy().save().entity(str).now();     // Ask if this is the correct method

/*		    	
		    	ListIterator<String> it = str.subscribers.listIterator();
		    	for(int i = 0; i < str.subscribers.size(); i++)
		    	{
		    	if (it.hasNext()) {
				    String sub = it.next();
				    System.out.println("sub " + str.views);
		    	}
		    	}
		    	*/
//		    	response.sendRedirect("/show_stream.jsp?streamId=" + streamId + "&"
//				+ "streamName=" + streamName);	
     		}
     	 }
		response.sendRedirect("/dkconnexus.jsp");
%>


  </body>
  </html>
