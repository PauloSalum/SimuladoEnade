package com.anhanguera.cp.Controllers;

import com.anhanguera.cp.LoginData;
import com.anhanguera.cp.repositories.PerguntaRepository;
import com.anhanguera.cp.repositories.QuestionarioRepository;
import com.anhanguera.cp.entities.Questionarios.Pergunta;
import com.anhanguera.cp.entities.Questionarios.Questionario;
import com.anhanguera.cp.entities.Questionarios.Resposta;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** Created by PauloMagno on 06/06/2015. */
@Controller
@RequiredArgsConstructor
public class QuestionarioController {
  private final HttpSession session;
  private final QuestionarioRepository questionarioRepository;
  private final PerguntaRepository perguntaRepository;


  @RequestMapping(value = "/cadastrarQuestionario", method = RequestMethod.POST)
  public String CadastrarQuestionario(@ModelAttribute Questionario questionario) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }
    try {

      questionarioRepository.save(questionario);

    } catch (Exception e) {
      System.out.println("e = " + e);
    }
    session.setAttribute("questionarios", questionarioRepository.findAll());
    return "CadastroQuestionarios";
  }

  @RequestMapping(
    value = "/Perguntas",
    params = {"CadastraQuestoes"}
  )
  public String Perguntas(@ModelAttribute Questionario questionario) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }

    Long id = questionario.getId();
    var result = questionarioRepository.findById(id);
    if (result.isPresent()) {
      session.setAttribute("perguntas", perguntaRepository.findByQuestionarioId(id));
      session.setAttribute("questionario", result.get());
      return "CadastroQuestoes";
    } else {
      return "CadastroQuestionarios";
    }
  }

  @RequestMapping(
    value = "/Perguntas",
    params = {"DeletaQuestionario"}
  )
  public String RemoverQuestionario(
      @ModelAttribute Questionario questionario, final HttpServletRequest req) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }
    try {
      questionarioRepository.deleteById(questionario.getId());
    } catch (Exception e) {
      System.out.println("e = " + e);
    }
    session.setAttribute("questionarios", questionarioRepository.findAll());
    return "CadastroQuestionarios";
  }

  @RequestMapping(value = "/cadastrarPerguntas")
  public String CadastraPerguntas(final HttpServletRequest req) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }
    int i = 1;
    Pergunta p = new Pergunta();
    p.setPergunta(req.getParameter("pergunta"));
    while (i <= 5) {
      p.addRespostas(
          new Resposta(
              req.getParameter(String.valueOf(i)),
              Integer.valueOf(req.getParameter("Resposta")) == i ? true : false));
      i++;
    }
    var q =
        questionarioRepository.findById(Long.valueOf(req.getParameter("questionarioid")));
    if(q.isPresent()){
      q.get().addPerguntas(p);
      questionarioRepository.save(q.get());
      session.setAttribute("perguntas", perguntaRepository.findByQuestionarioId(q.get().getId()));
      session.setAttribute("questionario", q);
    }
    return "CadastroQuestoes";
  }

  @RequestMapping(
    value = "/cadastrarPerguntas",
    params = {"voltar"}
  )
  public String VoltarParaCadastraQuestões(Model model) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }
    model.addAttribute("login", new LoginData());
    return "index";
  }

  @RequestMapping(
    value = "/opcaoPergunta",
    params = {"np"}
  )
  public String NovaPergunta(HttpServletRequest req) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }
    var q =
        questionarioRepository.findById(Long.valueOf(req.getParameter("questionarioid")));
    session.setAttribute(
        "perguntas",
        perguntaRepository.findByQuestionarioId(Long.valueOf(req.getParameter("questionarioid"))));
    session.setAttribute("questionario", q.get());
    return "CadastroQuestoes";
  }

  @RequestMapping(
    value = "/opcaoPergunta",
    params = {"nq"}
  )
  public String Questionarios(Model model) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }
    model.addAttribute("questionario", new Questionario());
    return "CadastroQuestionarios";
  }

  @RequestMapping(value = "/deletarPergunta")
  public String DeletarPergunta(HttpServletRequest req) {
    if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
      return "index";
    }
    perguntaRepository.deleteById(Long.valueOf(req.getParameter("perguntaid")));
    Optional<Questionario> q =
        questionarioRepository.findById(Long.valueOf(req.getParameter("questionarioid")));
    session.setAttribute(
        "perguntas",
        perguntaRepository.findByQuestionarioId(Long.valueOf(req.getParameter("questionarioid"))));

    session.setAttribute("questionario", q.get());
    return "CadastroQuestoes";
  }
}
