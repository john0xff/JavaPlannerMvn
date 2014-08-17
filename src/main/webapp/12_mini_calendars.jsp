<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Mini calendars</div>
			<div class="dsc">To simplify navigation, you can display a small date picker on the left side of the scheduler header. Also, you can put a date picker in the lightbox or any HTML container outside the scheduler.</div>
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
	    	s.load("12_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("12_events.jsp");

	    	s.calendars.attachMiniCalendar();
	    	s.lightbox.add(new DHXLightboxMiniCalendar("cal", "Time period"));

			return s.render();
		}%>
</body>
</html>