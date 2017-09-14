package br.com.desafio.cartorio.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cartorio {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String cartorio;
	
	public int getId() {
		return id;
	}
	
	public String getCartorio() {
		return cartorio;
	}
	
	public void setCartorio(String cartorio) {
		this.cartorio = cartorio;
	}
	
	@Override
	public String toString() {
		return "Cartorio [id=" + id + ", cartorio=" + cartorio + "]";
	}
	
	
}
