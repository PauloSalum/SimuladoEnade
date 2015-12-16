package com.anhanguera.cp.model.Users;

import javax.persistence.Entity;

/**
 * Created by PauloMagno on 04/06/2015.
 */
@Entity
public class Aluno  extends User{

    private int Matricula;

    public int getMatricula() {
        return Matricula;
    }

    public void setMatricula(int matricula) {
        Matricula = matricula;
    }
}
