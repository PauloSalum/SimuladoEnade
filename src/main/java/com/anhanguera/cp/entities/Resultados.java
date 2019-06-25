package com.anhanguera.cp.entities;

import com.anhanguera.cp.entities.Users.Aluno;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

/** Created by PauloMagno on 04/06/2015. */
@Entity
@Getter
@Setter
public class Resultados {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "aluno_id")
  private Aluno aluno;

  private String data;
  private float pontuacao;

}
