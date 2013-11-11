<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.lang.reflect.Field" %>
<%@ page import= "dkconnexus.Stream" %>
<%@ page import= "dkconnexus.OfyService" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.gson.Gson" %>>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%  
	String query = request.getParameter("query");
	List<Stream> results = new ArrayList<Stream>();
	ListIterator<Stream> it = results.listIterator();
	List<String> names = new ArrayList<String>();
	
	Class Stream1 = Stream.class;
	for (Field field : Stream1.getDeclaredFields()) {
		String fieldName = field.getName();
		List<Stream> s = OfyService.ofy().load().type(Stream.class).filter(fieldName + " >=", query)
				.filter(fieldName + " <", query + "\uFFFD").list();
		for (Stream s1 : s) {
			if(!results.contains(s1)) {
				names.add(s1.name);
				results.add(s1);
			}
		}
	}
	Gson gson = new Gson();
	String json = gson.toJson(names);
	response.setContentType("application/json");
	response.getWriter().write(json.toString());
	
%>