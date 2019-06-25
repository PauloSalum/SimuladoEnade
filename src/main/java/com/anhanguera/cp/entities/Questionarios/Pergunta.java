package com.anhanguera.cp.entities.Questionarios;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

/** Created by PauloMagno on 04/06/2015. */
@Entity
@Getter
@Setter
public class Pergunta {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @Column(columnDefinition = "TEXT")
  private String pergunta;

  @OneToMany(
    fetch = FetchType.EAGER,
    cascade = CascadeType.ALL,
    orphanRemoval = true,
    mappedBy = "pergunta"
  )
  private List<Resposta> respostas = new ArrayList<>();

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "questionario_id")
  private Questionario questionario;


  public void addRespostas(Resposta resposta) {
    if (resposta.getPergunta() != this) {
      resposta.setPergunta(this);
    }
    this.respostas.add(resposta);
  }
}
