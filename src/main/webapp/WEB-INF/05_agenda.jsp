<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Agenda view</div>
			<div class="dsc">Agenda view presents a list of ongoing and upcoming events in the order that they are to be taken place. The view contains 2 columns: one for the event date and the other for description. </div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>
	
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.extensions.*,com.dhtmlx.planner.controls.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setWidth(900);
	    	s.setInitialDate(2013, 1, 7);
	    	s.load("05_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("05_events.jsp");
	    	s.extensions.add(DHXExtension.RECURRING);
	    	s.views.add(new DHXAgendaView());
	    	s.setInitialView("agenda");
	    	DHXAgendaView agenda = (DHXAgendaView) s.views.getView(3);
	    	agenda.setStartDate(2012, 11, 20);
	    	agenda.setEndDate(2013, 02, 01);
			return s.render();
		}%>
</body>
</html>