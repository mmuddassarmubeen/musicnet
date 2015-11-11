package com.neu.musicnet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neu.musicnet.dao.EventDao;
import com.neu.musicnet.model.Event;

@Controller
public class PdfGeneratorController {
	
	@Autowired
	EventDao eventDao;
	
	@RequestMapping(value = "/eventManager/pdf", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		
		String output = null;
		try {
			output = ServletRequestUtils.getStringParameter(request, "output");
		} catch (ServletRequestBindingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			List<Event> events = eventDao.getAllEvents();
			//dummy data
			Map<String,Event> eventData = new HashMap<String,Event>();
			
			for(Event event : events)
			{
				eventData.put(event.getName(), event);
				
			}
	 
		    //return excel view
		    return new ModelAndView("PdfEvent","eventData",eventData);
	 
			
	}

}
