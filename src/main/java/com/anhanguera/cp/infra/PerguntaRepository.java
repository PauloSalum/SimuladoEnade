package com.anhanguera.cp.infra;

import com.anhanguera.cp.model.Questionarios.Pergunta;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by PauloMagno on 04/06/2015.
 */
public interface PerguntaRepository extends CrudRepository<Pergunta, Long> {
    List<Pergunta> findByQuestionarioId(long id);
}
