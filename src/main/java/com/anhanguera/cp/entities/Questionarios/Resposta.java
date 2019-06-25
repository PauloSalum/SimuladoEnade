package com.anhanguera.cp.entities.Questionarios;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

/** Created by PauloMagno on 04/06/2015. */
@Entity
@Getter
@Setter
public class Resposta {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @Column(columnDefinition = "TEXT")
  private String resposta;

  private boolean correta;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "pergunta_id")
  private Pergunta pergunta;

  public Resposta() {}

  public Resposta(String resposta, boolean correta) {
    this.resposta = resposta;
    this.correta = correta;
  }

}
