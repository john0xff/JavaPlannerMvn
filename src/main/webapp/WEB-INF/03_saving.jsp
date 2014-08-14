<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Saving</div>
			<div class="dsc">JavaPlanner provides simple integration with the server side. Add, edit, delete events and then, reload the page. All the changes will be saved.</div>
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
    		s.load("03_events.jsp", DHXDataFormat.JSON);
        	s.data.dataprocessor.setURL("03_events.jsp");
			return s.render();
		}%>
</body>
</html>