<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="dkconnexus.OfyService" %>
<%@ page import="dkconnexus.Stream" %>
<%@ page import="dkconnexus.EmailTime" %>
<%@ page import=" static com.googlecode.objectify.ObjectifyService.ofy" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
		List<EmailTime> t2 = OfyService.ofy().load().type(EmailTime.class).list();
		//ofy().load().type(EmailTime.class).list();
		String time1;
		for (EmailTime e : t2) {
			time1 = e.EmailFreq;
		}
		
		List<Stream> s = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(s);
		
	/*	for(Stream str : s) {
			out.println(str.name);
	//		ListIterator<String> it = str.subscribers.listIterator();
//			ListIterator<Date> it = str.stream_view_dates.listIterator();
		//	if(str.stream_view_dates == null)
				out.println(str.views);
	//		Iterator it=str.stream_view_dates.iterator(); 
		//	for(Date d : str.stream_view_dates) {
				
		//	}
	  //  	ListIterator<Date> it = str.stream_view_dates.listIterator();
	    //	for(int i = 0; i < str.stream_view_dates.size(); i++) {
	//	    	if (it.hasNext()) {
			//	    Date d = it.next();
		//		    System.out.println(it.next());
		//    	}
	    	}*/
//			for (Date d : str.stream_view_dates)
//				out.println(d);
		
		
//		System.out.println("Send report " + time1);
%>