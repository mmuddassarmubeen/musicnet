package com.neu.musicnet;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.musicnet.dao.EventDao;
import com.neu.musicnet.dao.ScheduleDao;
import com.neu.musicnet.dao.UserDao;
import com.neu.musicnet.model.Event;
import com.neu.musicnet.model.EventManager;
import com.neu.musicnet.model.Person;
import com.neu.musicnet.model.Schedule;
import com.neu.musicnet.validators.EventValidator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EventManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventManagerController.class);
	
	@Autowired
	private EventDao eventDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	@Qualifier("eventValidator")
	private EventValidator eventValidator;
	
	/*
	 * This is to initialize webDataBinder,set its
	 * validator as we specify.
	 */
	@InitBinder
	private void initBinder (WebDataBinder binder){
		binder.setValidator(eventValidator);
	}
	
	
	@RequestMapping(value = "/eventManager/home", method = RequestMethod.GET)
	public String home(Model model) {
		return "eventManager/home";
	}
	
	@RequestMapping(value="/eventManager/createEvent", method=RequestMethod.GET)
	public String createEvent(Model model)
	{		
		Event event = new Event();
		model.addAttribute("event",event);
		return "eventManager/createEvent";
	}	
	
	@RequestMapping(value="/eventManager/createEvent", method=RequestMethod.POST)
	public String addEvent(Model model, @Validated Event event, BindingResult bindingresult, HttpServletRequest request)
	{
		boolean result = false;
		if (bindingresult.hasErrors()){
			System.out.println("in error");
			return "eventManager/createEvent";
		}
		try{
			Principal p = request.getUserPrincipal();
			EventManager eventManager = (EventManager)userDao.findByUserName(p.getName()).getPerson();
			Set<EventManager> eventManagers = new HashSet<EventManager>();
			eventManagers.add(eventManager);
			event.setEventManagers(eventManagers);
			result = eventDao.createEvent(event);
		}
		catch(Exception ex)
		{
			logger.info("Exception thrown while creating event{}.",ex.getMessage());
		}
		return "redirect:home";
	}	
	
	@RequestMapping(value="/eventManager/schedule", method=RequestMethod.GET)
	public String schedule(Model model, HttpServletRequest request)
	{
		return "eventManager/schedule";
	}
	
	
	@RequestMapping(value = "/eventManager/currentEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> currentEvents(HttpServletRequest request) {
		
		try
		{
			Principal p = request.getUserPrincipal();
			EventManager eventManager = (EventManager)userDao.findByUserName(p.getName()).getPerson();
			List<Event> eventList = eventDao.getCurrentEvents(eventManager);
			return eventList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getCause().getMessage());
			return null;
		}
	}
	
	@RequestMapping(value = "/eventManager/futureEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> futureEvents(HttpServletRequest request) {
		
		try
		{
			Principal p = request.getUserPrincipal();
			EventManager eventManager = (EventManager)userDao.findByUserName(p.getName()).getPerson();
			List<Event> eventList = eventDao.getFutureEvents(eventManager);
			return eventList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getCause().getMessage());
			return null;
		}
	}
	
	@RequestMapping(value = "/eventManager/pastEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> pastEvents(HttpServletRequest request) {
		
		try
		{
			Principal p = request.getUserPrincipal();
			EventManager eventManager = (EventManager)userDao.findByUserName(p.getName()).getPerson();
			List<Event> eventList = eventDao.getPastEvents(eventManager);
			return eventList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getCause().getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/eventManager/getSchedule", method=RequestMethod.GET)
	public @ResponseBody List<Schedule> getScheduleInJSON(HttpServletRequest request)
	{
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_YEAR, cal.get(Calendar.DAY_OF_YEAR) - 1 );
		Date startDate = cal.getTime();
		cal.set(Calendar.DAY_OF_YEAR, cal.get(Calendar.DAY_OF_YEAR));
		Date endDate = cal.getTime();
		try
		{
			String user = request.getUserPrincipal().getName();
			EventManager p = (EventManager)userDao.findByUserName(user).getPerson();
			return scheduleDao.getSchedule(p);
			
		}
		catch(Exception ex)
		{
			System.out.println("Exception is: " + ex.getCause().getMessage());
			return null;
		}
		
	}
}
