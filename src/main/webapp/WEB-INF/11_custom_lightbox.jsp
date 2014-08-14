<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="content" id="content">
		<div class="sample">
			<div class="name">Custom lightbox</div>
			<div class="dsc">There is the possibility to create a fully custom lightbox. Double click on any empty cell or event in the scheduler and open lightbox that is fully custom and contains regular HTML inputs.</div>
			<div class="clear"></div>
		</div>
		<div class="scheduler" id="scheduler"><%= getScheduler(request) %></div>
	</div>
	
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.controls.*,com.dhtmlx.planner.extensions.*" %>
	<%!String getScheduler (HttpServletRequest request) throws Exception {
			DHXPlanner s = new DHXPlanner("./codebase/");
			s.setWidth(900);
	    	s.setInitialDate(2013, 1, 7);
	    	s.config.setScrollHour(8);
	    	s.config.setDetailsOnCreate(true);
	    	s.config.setDblClickCreate(true);
	    	s.config.setDetailsOnDblClick(true);

	    	s.load("11_events.jsp", DHXDataFormat.JSON);
	    	s.data.dataprocessor.setURL("11_events.jsp");

	    	DHXExternalLightboxForm box = s.lightbox.setExternalLightboxForm("./11_custom_editor.jsp", 296, 140);    
	    	box.setClassName("custom_lightbox");
			return s.render();
		}%>
</body>
</html>