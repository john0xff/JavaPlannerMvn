<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<style>
		.blue_section {
			background-color: #2babf5;
			opacity: 0.27;
			filter:alpha(opacity=27);
		}
		.red_section {
			background-color: red;
			opacity: 0.27;
			filter:alpha(opacity=27);
		}
		.highlight_section {
			opacity: 0.25;
			z-index:0;
			filter:alpha(opacity=25);
		}
		.highlight_section:hover {
			background-color: #90ee90;
		}
	</style>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Highlight</div>
			<div class="dsc">You may highlight specific blocks in the scheduler (periods of particular importance) with any CSS style.
			Also, there is the possibility to highlight the area under the mouse pointer.</div>
		<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>
	
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.api.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.controls.*,com.dhtmlx.planner.extensions.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setInitialDate(2013, 1, 7);
	    	s.config.setScrollHour(8);
	    	s.setWidth(900);
	    	s.load("13_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("13_events.jsp");

	    	// sets block on Sunday
	    	DHXBlockTime block = new DHXBlockTime();
	    	block.setDay(DHXBlockTime.DHXDayOfWeek.SUNDAY);
	    	s.timespans.add(block);

	    	// sets timespan on today from 8 to 20
	    	DHXMarkTime m1 = new DHXMarkTime();
	    	m1.setStartDate(8, 0);
	    	m1.setEndDate(20, 0);
	    	m1.setCssClass("blue_section");
	    	s.timespans.add(m1);

	    	// sets timespan on Monday and Driday from 10 to 15
	    	DHXMarkTime m2 = new DHXMarkTime();
	    	m2.setDays(DHXBlockTime.DHXDayOfWeek.MONDAY, DHXBlockTime.DHXDayOfWeek.FRIDAY);
	    	m2.addZone(new DHXZone(900, 1140));
	    	m2.setCssClass("red_section");
	    	s.timespans.add(m2);

	    	// enables highlight
	    	s.highlight.enable("highlight_section", 30);

			return s.render();
		}%>
</body>
</html>