package br.com.desafio.cartorio.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.desafio.cartorio.models.Cartorio;

public class CartorioValidation implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Cartorio.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "cartorio", "field.required");		
	}
	
}
