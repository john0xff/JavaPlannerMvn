<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Timeline view</div>
			<div class="dsc">Timeline View can be used to visualize and monitor the progress of ongoing tasks or projects. The vertical scale in the view presents event holders, while the horizontal scale is a configurable time-scale. There is the possibility to enable the hierarchical structure and show the resources in expandable groups. </div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>

	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.controls.*,com.dhtmlx.planner.extensions.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
    		s.setInitialDate(2013, 1, 7);
    		s.setWidth(900);
    		s.setInitialView("topic");
	    	s.load("09_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("09_events.jsp");

	    	DHXTimelineView view = new DHXTimelineView("topic", "event_topic", "Topic");
	    	view.setRenderMode(DHXTimelineView.RenderModes.BAR);
	    	view.setXScaleUnit(DHXTimelineView.XScaleUnits.MINUTE);
	    	view.setXStep(30);
	    	view.setXSize(10);
	    	view.setXStart(16);
	    	view.setXLength(48);
	    	view.setServerList("event_topic");
	    	s.views.add(view);

	    	DHXLightboxSelect sel = new DHXLightboxSelect("event_topic", "Topic");
	    	sel.setServerList("event_topic");
	    	s.lightbox.add(sel);
	    	
			return s.render();
		}%>
</body>
</html>