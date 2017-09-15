package br.com.desafio.cartorio.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="editar/{id}")
	public String editar(@PathVariable Integer id, Model model){
		Cartorio cartorio = cartorioDAO.find(id);
		model.addAttribute("cartorio", cartorio);
		return "cartorios/editar";
	}
	
	@RequestMapping("/alteraCartorio")
	public ModelAndView altera(Integer id) {
		System.out.println(id);
		//cartorioDAO.editar(cartorio);
		return new ModelAndView("redirect:/cartorios/form");
	}
	
	@RequestMapping("remover")
	public String remover(Integer id, RedirectAttributes redirectAttributes){
		cartorioDAO.remove(id);
		redirectAttributes.addFlashAttribute("sucesso","Cartório removido com sucesso!");
		return "redirect:/cartorios/form";
	}
	
	@RequestMapping(method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Cartorio> retornaCartorios(){
		return cartorioDAO.findAll();
	}
}
