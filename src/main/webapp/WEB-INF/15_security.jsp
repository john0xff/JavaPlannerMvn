<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Security</div>
			<div class="dsc">By default, any user can edit data in the scheduler and the related changes will be saved in the database. Built-in security manager will let you limit access to 'read', 'insert', 'update' and 'delete' operations for specific groups of users. </div>
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
	    	s.load("15_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("15_events.jsp");
			return s.render();
		}%>
</body>
</html>