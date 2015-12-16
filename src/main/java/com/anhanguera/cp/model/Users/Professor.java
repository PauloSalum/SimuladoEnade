package com.anhanguera.cp.model.Users;

import javax.persistence.Entity;

/**
 * Created by PauloMagno on 04/06/2015.
 */
@Entity
public class Professor extends User{
    private String materia;
    private String Curso;

    public String getCurso() {
        return Curso;
    }

    public void setCurso(String curso) {
        Curso = curso;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }
}
