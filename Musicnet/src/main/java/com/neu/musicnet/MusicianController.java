package com.neu.musicnet;

import java.io.File;
import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.musicnet.dao.EventDao;
import com.neu.musicnet.dao.ScheduleDao;
import com.neu.musicnet.dao.SkillDao;
import com.neu.musicnet.dao.UserDao;
import com.neu.musicnet.model.Event;
import com.neu.musicnet.model.Musician;
import com.neu.musicnet.model.Person;
import com.neu.musicnet.model.Schedule;
import com.neu.musicnet.model.Skill;

@Controller
public class MusicianController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	private EventDao eventDao;
	
	@Autowired
	private SkillDao skillDao;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="/musician/home", method=RequestMethod.GET)
	public String home(Model model, HttpServletRequest request)
	{
		Principal p = request.getUserPrincipal();
		Person person = userDao.findByUserName(p.getName()).getPerson();
        model.addAttribute("person", person);
		return "musician/home";
	}
	
	@RequestMapping(value="/musician/schedule", method=RequestMethod.GET)
	public String schedule(Model model)
	{
		return "musician/schedule";
	}
	
	@RequestMapping(value="/musician/events", method=RequestMethod.GET)
	public String events(Model model)
	{
		return "musician/events";
	}
	
	@RequestMapping(value="/musician/getSchedule", method=RequestMethod.GET)
	public @ResponseBody List<Schedule> getScheduleInJSON(HttpServletRequest request)
	{
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_YEAR, cal.get(Calendar.DAY_OF_YEAR) - 1 );
		Date startDate = cal.getTime();
		cal.set(Calendar.DAY_OF_YEAR, cal.get(Calendar.DAY_OF_YEAR));
		Date endDate = cal.getTime();
		try
		{
			Musician p = (Musician)userDao.findByUserName(request.getUserPrincipal().getName()).getPerson();
			return scheduleDao.getSchedule(p);
			
		}
		catch(Exception ex)
		{
			System.out.println("Exception is: " + ex.getCause().getMessage());
			return null;
		}
		
	}
	
	@RequestMapping(value = "/musician/openEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> currentEvents(HttpServletRequest request) {
		
		try
		{
			Principal p = request.getUserPrincipal();
			Musician musician = (Musician)userDao.findByUserName(p.getName()).getPerson();
			List<Event> eventList = eventDao.getAllOpenEvents(musician);
			return eventList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getCause().getMessage());
			return null;
		}
	}
	
	@RequestMapping(value = "/musician/myEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> myEvents(HttpServletRequest request) {
		
		try
		{
			Principal p = request.getUserPrincipal();
			Musician musician = (Musician)userDao.findByUserName(p.getName()).getPerson();
			List<Event> eventList = eventDao.myEvents(musician);
			return eventList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getCause().getMessage());
			return null;
		}
	}
	
	@RequestMapping(value = "/musician/viewSkills", method = RequestMethod.GET)
	public @ResponseBody List<Skill> getSkills(HttpServletRequest request) {
		
		try
		{
			Principal p = request.getUserPrincipal();
			Musician musician = (Musician)userDao.findByUserName(p.getName()).getPerson();
			List<Skill> eventList = skillDao.getSkills(musician);
			return eventList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getCause().getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/musician/upload",method=RequestMethod.GET)
	public String uploadPhoto()
	{
		return "musician/uploadphoto";
	}
	
	@RequestMapping(value="/musician/upload",method=RequestMethod.POST)
	public String savePhoto(HttpServletRequest request)
	{
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if(isMultipart)
		{
			DiskFileItemFactory factory = new DiskFileItemFactory();
	
			// Configure a repository (to ensure a secure temp location is used)
			File repository = (File) context.getAttribute("fileuploaddirectory");
			factory.setRepository(repository);
	
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			ProgressListener progressListener = new ProgressListener(){
				   private long megaBytes = -1;
				   @Override
				public void update(long pBytesRead, long pContentLength, int pItems) {
				       long mBytes = pBytesRead / 1000000;
				       if (megaBytes == mBytes) {
				           return;
				       }
				       megaBytes = mBytes;
				       System.out.println("We are currently reading item " + pItems);
				       if (pContentLength == -1) {
				           System.out.println("So far, " + pBytesRead + " bytes have been read.");
				       } else {
				           System.out.println("So far, " + pBytesRead + " of " + pContentLength
				                              + " bytes have been read.");
				       }
				   }
				};
				
				upload.setProgressListener(progressListener);
	
			// Parse the request
			try {
				List<FileItem> items = upload.parseRequest(request);
				for(FileItem item : items)
				{
					if(!item.isFormField())
					{
						String[] fileNameSplit = item.getName().split("\\.");
						String ext = fileNameSplit[fileNameSplit.length - 1];
						Principal p = request.getUserPrincipal();
						Musician musician = (Musician)userDao.findByUserName(p.getName()).getPerson();
						String name = new File(musician.getLastName() + musician.getId()).getName() + "." + ext;
						String fullpath = context.getRealPath("") + context.getInitParameter("fileuploaddirectory").toString() + File.separator + name;
						System.out.println(fullpath);
						String imageContextPath = context.getContextPath() + File.separator + context.getInitParameter("fileuploaddirectory").toString() + File.separator + name;
						item.write(new File(fullpath));
						musician.setImagefile(imageContextPath);
						userDao.saveImage(musician);
					}
				}
				
				
				
				
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			
		}
		return "musician/uploadphoto";
	}
	
	@RequestMapping(value="/musician/subscribeEvent", method=RequestMethod.POST)
	public @ResponseBody boolean approveRequest(@RequestBody Event event, HttpServletRequest request)
	{
		try
		{
			Principal p = request.getUserPrincipal();
			Person musician = userDao.findByUserName(p.getName()).getPerson();
			return eventDao.subscribe(event, musician);
		}
		catch(Exception ex)
		{
			System.out.println("Exception retrieving pending requests" + ex.getCause().getMessage());
			return false;
		}
	}
	
	@RequestMapping(value="/musician/addSkill", method=RequestMethod.GET)
	public String addSkill(Model model, HttpServletRequest request)
	{
		Skill skill = new Skill();
		model.addAttribute("skill", skill);
		model.addAttribute("name",request.getUserPrincipal().getName());
		return "musician/addSkill";
	}
	
	@RequestMapping(value="/musician/addSkill", method=RequestMethod.POST)
	public String skillAdded(Model model, HttpServletRequest request, Skill skill)
	{
		try
		{
			Principal p = request.getUserPrincipal();
			Musician musician = (Musician)userDao.findByUserName(p.getName()).getPerson();
			if(musician.getSkills() == null)
			{
				musician.setSkills(new HashSet<Skill>());
			}
			musician.getSkills().add(skill);
			skillDao.addSkills(musician);
			return "redirect:home";
		}
		catch(Exception ex)
		{
			System.out.println("Exception" + ex.getCause().getMessage());
			return "musician/addSkill";
		}
	}

}
