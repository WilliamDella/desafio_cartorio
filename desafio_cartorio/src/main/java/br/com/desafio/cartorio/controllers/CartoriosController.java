package br.com.desafio.cartorio.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.desafio.cartorio.daos.CartorioDAO;
import br.com.desafio.cartorio.models.Cartorio;
import br.com.desafio.cartorio.validation.CartorioValidation;

@RequestMapping("/cartorios")
@Controller
public class CartoriosController {

	@Autowired
	private CartorioDAO cartorioDAO;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.addValidators(new CartorioValidation());
	}
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView form(){
		List<Cartorio> cartorios = cartorioDAO.listar();
		ModelAndView modelAndView = new ModelAndView("/cartorios/form");
		modelAndView.addObject("cartorios", cartorios);
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(@Valid Cartorio cartorio, BindingResult result, RedirectAttributes redirectAttributes){
		
		if(result.hasErrors()){
			return form();
		}
		
		cartorioDAO.gravar(cartorio);
		redirectAttributes.addFlashAttribute("sucesso","Cartório cadastrado com sucesso!");
		return new ModelAndView("redirect:cartorios/form");
	}
	
	// método para fazer a listagem RESTFul
	@RequestMapping(method=RequestMethod.GET)
	public String cartorios(){
		return "/cartorios/sucesso";
	}
}
