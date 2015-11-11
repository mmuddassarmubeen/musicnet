package com.neu.musicnet.validators;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;
import org.springframework.stereotype.Component;

import com.neu.musicnet.model.AccountRequest;

@Component
public class AccountRequestValidator {
	
	public void validateRegister(AccountRequest accountRequest, ValidationContext context)
	{
		MessageContext messages = context.getMessageContext();
		if(accountRequest.getFirstname().isEmpty())
		{
			messages.addMessage(new MessageBuilder().error().source("firstname").defaultText("First name is empty").build());
		}
		if(accountRequest.getLastname().isEmpty())
		{
			messages.addMessage(new MessageBuilder().error().source("lastname").defaultText("Last name is empty").build());
		}
		if(accountRequest.getEmail().isEmpty())
		{
			messages.addMessage(new MessageBuilder().error().source("email").defaultText("Email is empty").build());
		}
		if(accountRequest.getDateOfBirth() == null)
		{
			messages.addMessage(new MessageBuilder().error().source("dateOfBirth").defaultText("Date of Birth is empty").build());
		}
		
	}
	
	public void validateRegisterCredentials(AccountRequest accountRequest, ValidationContext context)
	{
		MessageContext messages = context.getMessageContext();
		if(accountRequest.getUsername().isEmpty())
		{
			messages.addMessage(new MessageBuilder().error().source("username").defaultText("username is empty").build());
		}
		if(accountRequest.getPassword().isEmpty())
		{
			messages.addMessage(new MessageBuilder().error().source("password").defaultText("password is empty").build());
		}
		if(accountRequest.getConfirmpassword().isEmpty())
		{
			messages.addMessage(new MessageBuilder().error().source("confirmpassword").defaultText("confirmpassword is empty").build());
		}
		if(!accountRequest.getConfirmpassword().equals(accountRequest.getPassword()))
		{
			messages.addMessage(new MessageBuilder().error().source("confirmpassword").defaultText("confirmpassword doesn't match password").build());
		}
		if(accountRequest.getCompany().isEmpty())
		{
			messages.addMessage(new MessageBuilder().error().source("company").defaultText("company is empty").build());
		}
	}

}
