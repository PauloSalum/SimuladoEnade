package com.anhanguera.cp.infra;

import com.anhanguera.cp.model.Users.Aluno;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by PauloMagno on 04/06/2015.
 */
public interface AlunoRepository extends CrudRepository<Aluno, Long> {
    List<Aluno> findByEmailAndSenha(String email, String senha);
}
