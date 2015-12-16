package com.anhanguera.cp.model.Questionarios;

import javax.persistence.*;
import java.util.List;

/**
 * Created by PauloMagno on 04/06/2015.
 */
@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"nome"}))
public class Questionario {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String nome;
    @OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, orphanRemoval=true,mappedBy = "questionario")
    private List<Pergunta> perguntas;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Pergunta> getPerguntas() {
        return perguntas;
    }

    public void setPerguntas(List<Pergunta> perguntas) {
        this.perguntas = perguntas;
    }

    public void addPerguntas(Pergunta pergunta) {
        if(pergunta.getQuestionario()!= this){
            pergunta.setQuestionario(this);
        }
        this.perguntas.add(pergunta);
    }
}
