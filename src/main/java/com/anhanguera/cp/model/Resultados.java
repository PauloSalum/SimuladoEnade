package com.anhanguera.cp.model;

import com.anhanguera.cp.model.Users.Aluno;

import javax.persistence.*;

/**
 * Created by PauloMagno on 04/06/2015.
 */
@Entity
public class Resultados {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @OneToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="aluno_id")
    private Aluno aluno;
    private String data;
    private float pontuacao;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public float getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(float pontuacao) {
        this.pontuacao = pontuacao;
    }
}
