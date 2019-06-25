package com.anhanguera.cp.repositories;

import com.anhanguera.cp.entities.Users.Coordenador;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/** Created by PauloMagno on 04/06/2015. */
@Repository
public interface CoordenadorRepository extends CrudRepository<Coordenador, Long> {
  List<Coordenador> findByEmailAndSenha(String email, String senha);
}
