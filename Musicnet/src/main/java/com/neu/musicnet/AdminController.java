package com.neu.musicnet;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.musicnet.dao.AccountDao;
import com.neu.musicnet.dao.RoleDao;
import com.neu.musicnet.model.AccountRequest;
import com.neu.musicnet.model.Company;
import com.neu.musicnet.model.Role;
import com.neu.musicnet.model.UserAccount;

@Controller
public class AdminController {
	
	@Autowired
	private AccountDao accountDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@RequestMapping(value="/admin/home",method=RequestMethod.GET)
	public String home()
	{
		return "admin/home";
	}

	@RequestMapping(value="/admin/getCompanies",method=RequestMethod.GET)
	public @ResponseBody List<Company> getCompanies()
	{
		List<Company> companies = new ArrayList<Company>();
		Company comp = new Company();
		comp.setName("Test Company");
		companies.add(comp);
		 comp = new Company();
			comp.setName("Second Company");
			companies.add(comp);
		return companies;
	}
	
	
	@RequestMapping(value="/admin/createCompany", method=RequestMethod.GET)
	public String createCompany(Model model)
	{
		Company company = new Company();
		model.addAttribute("company",company);
		return "admin/createCompany";
	}
	
	@RequestMapping(value="/admin/viewCompanies", method=RequestMethod.GET)
	public String viewCompany(Model model)
	{
		Company company = new Company();
		model.addAttribute("company",company);
		return "admin/viewCompanies";
	}
	
	@RequestMapping(value="/admin/createUser", method=RequestMethod.GET)
	public String createUser(Model model)
	{
		UserAccount userAccount = new UserAccount();
		model.addAttribute("user",userAccount);
		return "admin/createUser";
	}
	
	@RequestMapping(value="/common/getRoles",method=RequestMethod.GET)
	public @ResponseBody List<Role> getRoles()
	{
		return roleDao.getRoles();
	}
	
	@RequestMapping(value="/admin/pendingRequests", method=RequestMethod.GET)
	public @ResponseBody List<AccountRequest> getPendingRequests()
	{
		
		try
		{
			return accountDao.getPendingRequests();
		}
		catch(Exception ex)
		{
			System.out.println("Exception retrieving pending requests" + ex.getCause().getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/admin/approveRequest", method=RequestMethod.POST)
	public @ResponseBody boolean approveRequest(@RequestBody AccountRequest account)
	{
		try
		{
			return accountDao.approveRequest(account);
		}
		catch(Exception ex)
		{
			System.out.println("Exception retrieving pending requests" + ex.getCause().getMessage());
			return false;
		}
	}
}
