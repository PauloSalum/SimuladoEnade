package com.anhanguera.cp.Controllers;

import com.anhanguera.cp.LoginData;
import com.anhanguera.cp.repositories.*;
import com.anhanguera.cp.entities.Questionarios.Questionario;
import com.anhanguera.cp.entities.Resultados;
import com.anhanguera.cp.entities.Users.Aluno;
import com.anhanguera.cp.entities.Users.Coordenador;
import com.anhanguera.cp.entities.Users.Professor;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/** Created by PauloMagno on 04/06/2015. */
@Controller
@RequiredArgsConstructor
public class LoginController {

  public static final String QUESTIONARIOS = "questionarios";
  private final HttpSession session;
  private final AlunoRepository alunoRepository;
  private final ProfessorRepository professorRepository;
  private final CoordenadorRepository coordenadorRepository;
  private final ResultadosRepository resultadosRepository;
  private final QuestionarioRepository questionarioRepository;

  @GetMapping(value = "/")
  public String index(Model model) {
    session.invalidate();
    List<Resultados> resultados = ListaOrdenada((List<Resultados>) resultadosRepository.findAll());
    session.setAttribute("resultados", resultados);
    model.addAttribute("login", new LoginData());
    return "index";
  }

  @PostMapping(value = "/")
  public String login(@ModelAttribute LoginData login, Model model) throws Exception {
    model.addAttribute("login", new LoginData());

    if (("aluno").equals(login.getTipo())) {
      List<Aluno> alunos;
      if (!(alunos = alunoRepository.findByEmailAndSenha(login.getEmail(), login.getSenha()))
          .isEmpty()) {
        Aluno a = alunos.get(0);

        session.setAttribute("user", a);
        session.setAttribute(QUESTIONARIOS, questionarioRepository.findAll());
        return "Simulado";
      }
    } else if (("professor").equals(login.getTipo())) {
      List<Professor> professores;
      if (!(professores =
              professorRepository.findByEmailAndSenha(login.getEmail(), login.getSenha()))
          .isEmpty()) {
        Professor p = professores.get(0);
        model.addAttribute("questionario", new Questionario());
        session.setAttribute(QUESTIONARIOS, questionarioRepository.findAll());
        session.setAttribute("user", p);
        return "CadastroQuestionarios";
      }
    } else if (("coordenador").equals(login.getTipo())) {
      List<Coordenador> coordenadores = new ArrayList<>();
      try {
        coordenadores =
            coordenadorRepository.findByEmailAndSenha(login.getEmail(), login.getSenha());
      } catch (Exception e) {
        throw new Exception(e);
      }
      if (!coordenadores.isEmpty()) {
        Coordenador c = coordenadores.get(0);
        model.addAttribute("questionario", new Questionario());
        List<Questionario> q = (List<Questionario>) questionarioRepository.findAll();
        for (Questionario q2 : q) {
          System.out.println("q = " + q2.getNome());
        }
        session.setAttribute(QUESTIONARIOS, q);
        session.setAttribute("user", c);
        return "CadastroQuestionarios";
      }
    }
    return "index";
  }

  @GetMapping(value = "/selecaoCadastro")
  public String SelecaoCadastro(@ModelAttribute LoginData login, Model model) {
    return "SelecaoCadastro";
  }

  private List<Resultados> ListaOrdenada(List<Resultados> list) {
    Resultados temp;
    for (int i = 0; i < list.size(); i++) {
      for (int j = 0; j < list.size() - 1; j++) {
        if (list.get(j).getPontuacao() < list.get(j + 1).getPontuacao()) {
          temp = list.get(j + 1);
          list.set(j + 1, list.get(j));
          list.set(j, temp);
        }
      }
    }
    while (list.size() > 10) {
      list.remove(list.size() - 1);
    }
    return list;
  }
}
