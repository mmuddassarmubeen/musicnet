package com.neu.musicnet.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.musicnet.model.Event;

public class EventValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Event.class == clazz;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmpty(errors, "name", "validate.name", "Your Name Is Incorrect");
		ValidationUtils.rejectIfEmpty(errors, "description", "description.empty","Description is blank");
		Event event =(Event)target;
		if(event.getStart() == null || event.getEnd() == null || event.getEnd().before(event.getStart()))
		{
			errors.reject("Invalid dates","Invalid event start and end dates");
			
		}
	}

}
