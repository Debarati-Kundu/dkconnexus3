<html>
	<head>
	<title>Map Streams</title>
<!-- 	<link type="text/css" rel="stylesheet" href="/stylesheets/main1.css">   --> 
<script type="text/javascript" src="js/modernizr-2.0.6/modernizr.min.js"></script>

	</head>
	
  <body>
  		<div id="map_canvas" style="width:500px;height:380px"></div>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
		<script type="text/javascript" src="js/jquery-1.7.1/jquery.min.js"></script>
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
						for ( var i = 0; i < 1000; i++ ) {
							$(this).gmap('addMarker', { 'position': new google.maps.LatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random()) } ).click(function() {
								$('#map_canvas').gmap('openInfoWindow', { content : 'Hello world!' }, this);
							});
						}
						$(this).gmap('set', 'MarkerClusterer', new MarkerClusterer(map, $(this).gmap('get', 'markers')));
					}
					);
				}).load();
			});
        </script>
  </body>
  </html>