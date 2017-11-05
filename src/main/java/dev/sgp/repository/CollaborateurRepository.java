package dev.sgp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dev.sgp.entite.Collaborateur;

public interface CollaborateurRepository extends JpaRepository<Collaborateur, Integer>{
	public Collaborateur findCollaborateurById(int id);
}
