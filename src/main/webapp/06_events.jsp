<%@ page contentType="application/json" %>
<%= getEvents(request) %>
	
<%@ page import="com.dhtmlx.planner.*,demoapp.*" %>
<%!
	String getEvents(HttpServletRequest request) throws Exception {
		CustomMapEventsManager evs = new CustomMapEventsManager(request);
		return evs.run();
	}
%>