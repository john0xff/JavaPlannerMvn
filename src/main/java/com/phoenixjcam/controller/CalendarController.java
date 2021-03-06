package com.phoenixjcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController
{
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test()
	{
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("test", "test.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public ModelAndView showCalendar()
	{
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("calendar", "calendar.jsp");

		return modelAndView;
	}
}
