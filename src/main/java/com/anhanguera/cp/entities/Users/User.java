package com.anhanguera.cp.entities.Users;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

/** Created by PauloMagno on 04/06/2015. */
@Entity
@Getter
@Setter
@Inheritance(strategy = InheritanceType.JOINED)
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"email", "cpf"}))
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  private String nome;
  private String cpf;
  private String dataNascimento;
  private String email;
  private String senha;
  private String sexo;

}
