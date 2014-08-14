<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Lightbox</div>
			<div class="dsc">Lightbox is an editor of scheduler's events. To open lightbox, double click on any cell in the scheduler. Lighbox can contain any number of controls (by default, a text field for the event description and selects for setting the event duration). </div>
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
	    	s.load("10_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("10_events.jsp");
	    	s.config.setDetailsOnCreate(true);
	    	s.config.setDetailsOnDblClick(true);

	    	// lightbox configuring
	    	s.lightbox.get("description").setHeight(30);
    		DHXLightboxSelect sel = new DHXLightboxSelect("event_topic", "Topic");
    		sel.setServerList("event_topic");
    		s.lightbox.add(sel,1);
			return s.render();
		}%>
</body>
</html>