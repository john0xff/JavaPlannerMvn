<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Grid view</div>
			<div class="dsc">Grid view presents a list of upcoming events and unlike the Agenda view, it allows you to configure the number of columns and choose what data to display. It also supports sorting (including custom) and data templates.</div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>
	
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.extensions.*,com.dhtmlx.planner.controls.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setInitialDate(2013, 1, 7);
	    	s.setWidth(900);
	    	s.load("07_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("07_events.jsp");
	    	s.extensions.add(DHXExtension.RECURRING);
	    	DHXGridView view = new DHXGridView();
	    	view.addOption(new DHXGridViewColumn("text", "Text"));
	    	view.addOption(new DHXGridViewColumn("start_date", "Start date", 150));
	    	view.addOption(new DHXGridViewColumn("end_date", "End date", 150));
	    	view.setFrom(2013, 0, 1);
	    	s.views.add(view);
	    	s.setInitialView("grid");
			return s.render();
		}%>
</body>
</html>