package com.anhanguera.cp.repositories;

import com.anhanguera.cp.entities.Users.Aluno;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/** Created by PauloMagno on 04/06/2015. */
@Repository
public interface AlunoRepository extends CrudRepository<Aluno, Long> {
  List<Aluno> findByEmailAndSenha(String email, String senha);
}
