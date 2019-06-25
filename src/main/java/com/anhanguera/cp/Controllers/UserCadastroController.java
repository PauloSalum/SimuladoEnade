package com.anhanguera.cp.Controllers;

import com.anhanguera.cp.LoginData;
import com.anhanguera.cp.repositories.AlunoRepository;
import com.anhanguera.cp.repositories.CoordenadorRepository;
import com.anhanguera.cp.repositories.ProfessorRepository;
import com.anhanguera.cp.entities.Users.Aluno;
import com.anhanguera.cp.entities.Users.Coordenador;
import com.anhanguera.cp.entities.Users.Professor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** Created by PauloMagno on 05/06/2015. */
@Controller
@RequiredArgsConstructor
public class UserCadastroController {

  private final AlunoRepository alunoRepository;
  private final ProfessorRepository professorRepository;
  private final CoordenadorRepository coordenadorRepository;

  @RequestMapping(value = "cadastraAluno")
  public String selecaoAluno(Model model) {
    model.addAttribute("aluno", new Aluno());
    return "cadastroaluno";
  }

  @RequestMapping(value = "cadastraProfessor")
  public String selecaoProfessor(Model model) {
    model.addAttribute("professor", new Professor());
    return "cadastroprofessor";
  }

  @RequestMapping(value = "cadastraCoordenador")
  public String selecaoCoordenador(Model model) {
    model.addAttribute("coordenador", new Coordenador());
    return "cadastrocoordenador";
  }

  @RequestMapping(value = "/cadastrarAluno", method = RequestMethod.POST)
  public String CadastraAluno(@ModelAttribute Aluno aluno, Model model) {
    model.addAttribute("aluno", aluno);
    model.addAttribute("login", new LoginData());
    try {
      alunoRepository.save(aluno);
      return "SelecaoCadastro";
    } catch (Exception e) {
      return "CadastroAluno";
    }
  }

  @RequestMapping(value = "/cadastrarProfessor", method = RequestMethod.POST)
  public String CadastraProfessor(@ModelAttribute Professor professor, Model model) {
    model.addAttribute("professor", professor);
    model.addAttribute("login", new LoginData());
    try {
      professorRepository.save(professor);
      return "SelecaoCadastro";
    } catch (Exception e) {
      return "CadastroProfessor";
    }
  }

  @RequestMapping(value = "/cadastrarCoordenador", method = RequestMethod.POST)
  public String CadastraCoordenador(@ModelAttribute Coordenador coordenador, Model model) {
    model.addAttribute("coordenador", coordenador);
    model.addAttribute("login", new LoginData());
    try {
      coordenadorRepository.save(coordenador);
      return "SelecaoCadastro";
    } catch (Exception e) {
      return "CadastroCoordenador";
    }
  }
}
