<%@ page contentType="application/json" %>
<%= getEvents(request) %>
	
<%@ page import="com.dhtmlx.planner.*,demoapp.*" %>
<%!
	String getEvents(HttpServletRequest request) throws Exception {
		CustomUnitsEventsManager evs = new CustomUnitsEventsManager(request);
		return evs.run();
	}
%>