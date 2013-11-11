<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%@ page import="dkconnexus.OfyService" %>
<%@ page import = "dkconnexus.EmailTime" %>
<%@ page import=" static com.googlecode.objectify.ObjectifyService.ofy" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
	<link type="text/css" rel="stylesheet" href="/stylesheets/main1.css"> 
	</head>
	
  <body>
  <% 
	String EmailFreq1 = request.getParameter("freq");
    EmailTime t1 = new EmailTime();
    t1.Id = 1;
    t1.EmailFreq = EmailFreq1;
    
//     String t1 = ofy().load().type(EmailFreq.class);
    ofy().save().entity(t1).now();
//	System.out.println("Inside email "+ t1.EmailFreq);
//	List<EmailTime> t2 = ofy().load().type(EmailTime.class).list();
//	System.out.println("Inside email2 "+ t2.size()); 
	response.sendRedirect("trending.jsp");
   %>
  </body>
  </html>