package com.anhanguera.cp.entities.Questionarios;

import java.util.List;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

/** Created by PauloMagno on 04/06/2015. */
@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"nome"}))
@Getter
@Setter
public class Questionario {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  private String nome;

  @OneToMany(
    fetch = FetchType.EAGER,
    cascade = CascadeType.ALL,
    orphanRemoval = true,
    mappedBy = "questionario"
  )
  private List<Pergunta> perguntas;

  public void addPerguntas(Pergunta pergunta) {
    if (pergunta.getQuestionario() != this) {
      pergunta.setQuestionario(this);
    }
    this.perguntas.add(pergunta);
  }
}
