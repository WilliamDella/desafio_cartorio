package br.com.desafio.cartorio.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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
	
	public Cartorio find(Integer id){
		return manager.createQuery("select distinct(c) from Cartorio c where c.id = :id", Cartorio.class).
				setParameter("id", id).getSingleResult();
	}
	
	public void remove(Integer id){
		Cartorio cartorio = find(id);
		manager.remove(cartorio);
	}

	public void atualizar(Integer id, Cartorio cart) {		
		Cartorio cart2 = find(id);
        cart2.setCartorio(cart.getCartorio());
		manager.merge(cart2);
	}	
}



