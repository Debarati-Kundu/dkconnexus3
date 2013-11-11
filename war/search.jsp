<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
	<title>Search Streams</title>
	<link type="text/css" rel="stylesheet" href="/stylesheets/main1.css"> 
	
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	
	<script>
	
  $(function() {
    var cache = {};
    
    $( '#imgsearch' ).autocomplete({
      minLength: 1,
      source: function( request, response ) {
        var term = request.term;
        if ( term in cache ) {
          response( cache[ term ] );
          return;
        }
        $.getJSON( "to_search_auto.jsp?query=" + term, function(data) {
          cache[ term ] = data;
          response( data );
          console.log(cache);
        });
      }
    });
  });
  
 // $("#country").autocomplete("to_search_auto.jsp?query=A");
</script>

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
<h2>Search Streams</h2>
<br>

<form id="imgsearch" style="text-align: left;" name="EnterSearch" action="to_search.jsp"
 method="post">
		Enter query: <input type="text" name="query">
		<br> 
		<br> 
		<input type="submit" value="Enter">
</form>

<!-- 
<form action="/sign" method="post">
	<div><textarea name="content" rows="1" cols="60">Enter stream name..</textarea></div>
	<div><input type="submit" value="Search"/></div>
</form>


<div class="ui-widget">
  <label for="birds">Birds: </label>
  <input id="birds" />
</div> 
--> 

  </body>
  </html>