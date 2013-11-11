<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.lang.reflect.Field" %>
<%@ page import= "dkconnexus.Stream" %>
<%@ page import= "dkconnexus.ConnexusImage" %>
<%@ page import= "dkconnexus.OfyService" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.gson.Gson" %>>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%  
	List<ConnexusImage> images = OfyService.ofy().load().type(ConnexusImage.class).list();
	Gson gson = new Gson();
	String json = gson.toJson(images);
	response.setContentType("application/json");
	response.getWriter().write(json.toString());
	
//    System.out.println(json);
	
%>