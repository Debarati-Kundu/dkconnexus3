<!doctype html>
 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
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

 
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>jQuery UI Slider - Range slider</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
	<script type="text/javascript" src="js/underscore-1.2.2/underscore.min.js"></script>
		<script type="text/javascript" src="js/backbone-0.5.3/backbone.min.js"></script>
		<script type="text/javascript" src="js/prettify/prettify.min.js"></script>
		<script type="text/javascript" src="js/demo.js"></script>
		<script type="text/javascript" src="js/markerclustererplus-2.0.6/markerclusterer.min.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.map.js"></script>
		<script type="text/javascript">
            $(function() { 
            	
            	demo.add(function() {					
				$('#map_canvas').gmap({'zoom': 2, 'disableDefaultUI':true}).bind('init', function(evt, map) { 
						var bounds = map.getBounds();
						var southWest = bounds.getSouthWest();
						var northEast = bounds.getNorthEast();
						var lngSpan = northEast.lng() - southWest.lng();
						var latSpan = northEast.lat() - southWest.lat();
						

						<%List<ConnexusImage> images = OfyService.ofy().load().type(ConnexusImage.class).list();
						double lat1[] = {0.0};
						ArrayList<Double> LatList = new ArrayList<Double>();
						for ( ConnexusImage img : images ) 
						{lat1[0] = 23.0; LatList.add(23.0);} %>
						
						
						for ( var i = 0; i < <%=images.size()%>; i++ ){ 
							
							var mylat = 30.0;
							var pic = new Image();
							pic.src = "http://upload.wikimedia.org/wikipedia/commons/f/fe/UT_Tower_83400355_68b7a5eeb9_o.jpg";
							pic.height=100;
							pic.width=100;
							
//							$(this).gmap('addMarker', { 'position': new google.maps.LatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random()) } ).click(function() {
$(this).gmap('addMarker', { 'position': new google.maps.LatLng(<%=LatList.get(0)%>, <%=LatList.get(0)%>) } ).click(function() {								
					$('#map_canvas').gmap('openInfoWindow', { content : pic/*'Hello connexus!'*/ }, this);
							});
						}
						$(this).gmap('set', 'MarkerClusterer', new MarkerClusterer(map, $(this).gmap('get', 'markers')));
					});
				}).load();	
			}); 
			
        </script>
        
		
  <script>
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  });
  </script>
  
</head>
<body>
 
<p>
  <label for="amount">Price range:</label>
  <input type="text" id="amount" style="border: 0; color: #f6931f; font-weight: bold;" />
</p>
 
<div id="slider-range"></div>
  <div id="map_canvas" style="width:1000px;height:380px; align:center" ></div> 
 
</body>
</html>