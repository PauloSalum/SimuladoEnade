package com.anhanguera.cp.entities.Users;

import javax.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

/** Created by PauloMagno on 04/06/2015. */
@Entity
@Getter
@Setter
public class Aluno extends User {

  private int Matricula;

}
