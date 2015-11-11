package com.neu.musicnet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController {
	
	@RequestMapping(value="/velocity/contact", method=RequestMethod.GET)
	public ModelAndView getContact()
	{
		System.out.println("In velocity contact");
		return new ModelAndView("contact");
	}
	
	@RequestMapping(value="/freemarker/about", method=RequestMethod.GET)
	public ModelAndView getAbout()
	{
		System.out.println("In freemarker about");
		return new ModelAndView("about");
	}

}
