<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html xmlns:jsp="http://java.sun.com/JSP/Page">
	<head>
	<title>Facebook login</title>
	<link type="text/css" rel="stylesheet" href="/stylesheets/main1.css"> 
	</head>
	
  <body>
  
  <div id="fb-root"></div>
<script>
  // Additional JS functions here
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '441233759331417', // App ID
      channelUrl : 'https://dkconnexus.appspot.com/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional init code here
    FB.Event.subscribe('auth.authResponseChange', function(response) {
        // Here we specify what we do with the response anytime this event occurs. 
        if (response.status === 'connected') {
          testAPI();
        } else if (response.status === 'not_authorized') {
          FB.login();
        } else {
          FB.login();
        }
      });
  };

  // Load the SDK asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
  
  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	      console.log('Good to see you, ' + response.name + '.');
	    });
	  }
</script>

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
<h2>Social</h2>

<fb:login-button show-faces="true" width="200" max-rows="1"></fb:login-button>

<p style="text-align: center; "><a href="/view_stream.jsp">Share streams with your friends and groups on Facebook</a>
</p>

  </body>

  </html>