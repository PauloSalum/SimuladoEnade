package com.anhanguera.cp.infra;

import com.anhanguera.cp.model.Questionarios.Pergunta;
import com.anhanguera.cp.model.Questionarios.Questionario;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by PauloMagno on 04/06/2015.
 */
public interface QuestionarioRepository extends CrudRepository<Questionario, Long> {

}
