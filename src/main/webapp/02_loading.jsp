<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Loading</div>
			<div class="dsc">Scheduler can load data of ICal, JSON, XML formats from a file or object. There is support for static and dynamic loading modes. </div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>

	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,demoapp.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setInitialDate(2013, 1, 7);
	    	s.config.setScrollHour(8);
	    	s.setWidth(900);
    		s.load("02_events.jsp", DHXDataFormat.JSON);
			return s.render();
		}%>
</body>
</html>