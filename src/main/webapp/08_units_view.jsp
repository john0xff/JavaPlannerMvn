<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Units view</div>
			<div class="dsc">Units View lets you display several calendars for multiple resources simultaneously (e.g. human resources, rooms, etc.). The calendars are arranged in columns, so you can see all of them on one page.</div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>
	
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.controls.*,com.dhtmlx.planner.extensions.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
    		s.setInitialDate(2013, 1, 7);
    		s.config.setScrollHour(8);
    		s.setWidth(900);
	    	s.load("08_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("08_events.jsp");
	    	s.setInitialView("topic");

	    	// creates units view
	    	DHXUnitsView view = new DHXUnitsView("topic", "event_topic", "Topic");
    		view.setServerListLink("event_topic");
    		s.views.add(view);

	    	// adds section in lightbox
	    	DHXLightboxSelect sel = new DHXLightboxSelect("event_topic", "Topic");
	    	sel.setServerList("event_topic");
	    	s.lightbox.add(sel);
			return s.render();
		}%>
</body>
</html>