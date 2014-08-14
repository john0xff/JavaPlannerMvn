<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Map view</div>
			<div class="dsc">Map view integrates Agenda view with Google Maps that allows you to display locations associated with the calendar events on the map. You can specify the event location in 2 ways: to specify the address in the event description or to set the point right on Google Maps.</div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>

	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.extensions.*,com.dhtmlx.planner.controls.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setInitialDate(2013, 1, 7);
	    	s.config.setScrollHour(8);
	    	s.setWidth(900);
	    	s.xy.setMapDateWidth(160);
	    	s.xy.setMapDescriptionWidth(300);
	    	s.load("06_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("06_events.jsp");
	    	s.extensions.add(DHXExtension.RECURRING);
	    	s.views.add(new DHXMapView());
	    	DHXMapView map = (DHXMapView) s.views.getView(3);
	    	map.setStartDate(2013, 1, 1);
	    	s.setInitialView("map");

	    	// adds section in lightbox
	    	DHXLightboxText loc = new DHXLightboxText("event_location", "Location");
	    	loc.setHeight(40);
	    	s.lightbox.add(loc);

	    	s.setInitialView("map");
			return s.render();
		}%>
</body>
</html>