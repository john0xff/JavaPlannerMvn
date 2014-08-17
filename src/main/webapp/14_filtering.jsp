<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Events filtering</div>
			<div class="dsc">You may filter events by one or several criteria, using different filtering rules for different views. Filtering can be applied initially or invoked on some action.</div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>
	
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.controls.*,com.dhtmlx.planner.extensions.*,
		java.util.Calendar" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setInitialDate(2013, 1, 7);
	    	s.config.setScrollHour(8);
	    	s.setWidth(900);
	    	s.load("14_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("14_events.jsp");

	    	DHXFilter filter = new DHXFilter("month");
	    	filter.addRule(new DHXRule("start_date", DHXRule.DHXOperator.Greater, Calendar.getInstance()));
	    	s.views.getView(0).setFilter(filter);

			return s.render();
		}%>
</body>
</html>