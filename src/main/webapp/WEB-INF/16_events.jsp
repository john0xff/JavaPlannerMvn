<%@ page contentType="application/json" %>
<%= getEvents(request) %>
	
<%@ page import="com.dhtmlx.planner.*,demoapp.*" %>
<%!
	String getEvents(HttpServletRequest request) throws Exception {
		CustomEventsManager evs = new CustomEventsManager(request);
		return evs.run();
	}
%>