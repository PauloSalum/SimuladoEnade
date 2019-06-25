package com.anhanguera.cp.repositories;

import com.anhanguera.cp.entities.Users.Professor;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/** Created by PauloMagno on 04/06/2015. */
@Repository
public interface ProfessorRepository extends CrudRepository<Professor, Long> {
  List<Professor> findByEmailAndSenha(String email, String senha);
}
