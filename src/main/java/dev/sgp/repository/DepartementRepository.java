package dev.sgp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dev.sgp.entite.Departement;

public interface DepartementRepository extends JpaRepository<Departement, Integer>{
	public Departement findDepartementById(int id);
}
