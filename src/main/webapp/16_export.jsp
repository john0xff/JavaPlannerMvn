<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Export to PDF and iCal</div>
			<div class="dsc">To provide printing capabilities, scheduler supports export to a PDF document. Also, there is support for data export to the iCal format that allows you to share the scheduler data across different apps and devices. </div>
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
	    	s.load("16_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("16_events.jsp");
	    	s.toPDF();
	    	s.toICal("16_ical.jsp");
			return s.render();
		}%>
</body>
</html>