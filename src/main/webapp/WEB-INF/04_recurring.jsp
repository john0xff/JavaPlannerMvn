<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Recurring events</div>
			<div class="dsc">Recurring events are events that repeat in series, for example, the birthday of your friend, a monthly salary or a weekly staff meeting. Create a recurring event and try to edit it: you may change all occurrences in the series at once or edit just a single instance.</div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>
	
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.extensions.*,demoapp.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setInitialDate(2013, 1, 7);
	    	s.config.setScrollHour(8);
	    	s.config.setFullDay(true);
	    	s.setWidth(900);
	    	s.load("04_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("04_events.jsp");
	    	s.extensions.add(DHXExtension.RECURRING);
			return s.render();
		}%>
</body>
</html>