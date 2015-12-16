package com.anhanguera.cp.model.Questionarios;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by PauloMagno on 04/06/2015.
 */
@Entity
public class Pergunta {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(columnDefinition = "TEXT")
    private String pergunta;
    @OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, orphanRemoval=true,mappedBy = "pergunta")
    private List<Resposta> respostas = new ArrayList<>();
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="questionario_id")
    private Questionario questionario;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    public List<Resposta> getRespostas() {
        return respostas;
    }

    public void setRespostas(List<Resposta> respostas) {
        this.respostas = respostas;
    }
    public void addRespostas(Resposta resposta) {
        if(resposta.getPergunta()!=this){
            resposta.setPergunta(this);
        }
        this.respostas.add(resposta);
    }

    public Questionario getQuestionario() {
        return questionario;
    }

    public void setQuestionario(Questionario questionario) {
        this.questionario = questionario;
    }
}
