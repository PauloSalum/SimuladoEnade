package com.anhanguera.cp.repositories;

import com.anhanguera.cp.entities.Questionarios.Pergunta;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/** Created by PauloMagno on 04/06/2015. */
@Repository
public interface PerguntaRepository extends CrudRepository<Pergunta, Long> {
  List<Pergunta> findByQuestionarioId(long id);
}
