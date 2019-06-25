package com.anhanguera.cp.Controllers;

import com.anhanguera.cp.LoginData;
import com.anhanguera.cp.Services.DateMethods;
import com.anhanguera.cp.repositories.PerguntaRepository;
import com.anhanguera.cp.repositories.ResultadosRepository;
import com.anhanguera.cp.entities.Questionarios.Pergunta;
import com.anhanguera.cp.entities.Questionarios.Resposta;
import com.anhanguera.cp.entities.Resultados;
import com.anhanguera.cp.entities.Users.Aluno;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** Created by PauloMagno on 06/06/2015. */
@Controller
@RequiredArgsConstructor
public class SimuladoController {

  private final PerguntaRepository perguntaRepository;
  private final ResultadosRepository resultadosRepository;

  @RequestMapping(value = "/resultadoSimulado", method = RequestMethod.GET)
  public String Simulado(final HttpServletRequest req, Model model, HttpSession session) {
    float qtRespostasCorretas = 0;
    float qtPerguntas = (float) perguntaRepository.count();
    List<Pergunta> perguntas = (List<Pergunta>) perguntaRepository.findAll();

    for (Pergunta p : perguntas) {
      for (Resposta r : p.getRespostas()) {
        if (Integer.valueOf(req.getParameter(String.valueOf(p.getId()))) == r.getId()) {
          if (r.isCorreta()) {
            qtRespostasCorretas++;
          }
        }
      }
    }

    Resultados r = new Resultados();
    r.setData(DateMethods.GetDate());
    System.out.println(req.getAttribute("user"));
    r.setAluno((Aluno) session.getAttribute("user"));
    r.setPontuacao((qtRespostasCorretas / qtPerguntas) * 10);
    resultadosRepository.save(r);

    session.setAttribute("resultados", resultadosRepository.findAll());
    model.addAttribute("login", new LoginData());
    return "index";
  }
}
