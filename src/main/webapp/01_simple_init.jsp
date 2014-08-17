<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Simple init</div>
			<div class="dsc">Basic scheduler has 3 default views: Day, Week, Month. You can add, edit, delete events but when you reload the page all changes will be lost.</div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>

	<%@ page import="com.dhtmlx.planner.*,demoapp.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			// creates and configures scheduler instance
			DHXPlanner s = new DHXPlanner("./codebase/");
    		s.setInitialDate(2013, 1, 7);
    		s.config.setScrollHour(8);
    		s.setWidth(900);

			// sets events set
			CustomEventsManager evs = new CustomEventsManager(request);
			s.parse(evs.getEvents());
			return s.render();
		}%>
</body>
</html>