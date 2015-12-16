package com.anhanguera.cp.infra;

import com.anhanguera.cp.model.Users.Professor;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by PauloMagno on 04/06/2015.
 */
public interface ProfessorRepository extends CrudRepository<Professor, Long> {
    List<Professor> findByEmailAndSenha(String email, String senha);
}
