package br.com.desafio.cartorio.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.desafio.cartorio.models.Cartorio;

@Repository
@Transactional
public class CartorioDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Cartorio cartorio){
		manager.persist(cartorio);
	}
	
	public List<Cartorio> listar(){
		return manager.createQuery("select c from Cartorio c", Cartorio.class).getResultList();
	}
	
}
