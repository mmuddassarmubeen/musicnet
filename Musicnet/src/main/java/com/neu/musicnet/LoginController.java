package com.neu.musicnet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login()
	{
		return "login";
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String start()
	{
		return "login";
	}
	
	@RequestMapping(value="/403",method=RequestMethod.GET)
	public String accessDenied()
	{
		return "403";
	}
}
