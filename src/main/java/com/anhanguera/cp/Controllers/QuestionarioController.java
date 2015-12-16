package com.anhanguera.cp.Controllers;

import com.anhanguera.cp.LoginData;
import com.anhanguera.cp.infra.PerguntaRepository;
import com.anhanguera.cp.infra.QuestionarioRepository;
import com.anhanguera.cp.model.Questionarios.Pergunta;
import com.anhanguera.cp.model.Questionarios.Questionario;
import com.anhanguera.cp.model.Questionarios.Resposta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by PauloMagno on 06/06/2015.
 */
@Controller
public class QuestionarioController {
    @Inject
    HttpSession session;

    QuestionarioRepository questionarioRepository;
    PerguntaRepository perguntaRepository;

    @Autowired
    public QuestionarioController(QuestionarioRepository questionarioRepository, PerguntaRepository perguntaRepository) {
        this.questionarioRepository = questionarioRepository;
        this.perguntaRepository=perguntaRepository;
    }

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

    @RequestMapping(value = "/Perguntas", params = {"CadastraQuestoes"})
    public String Perguntas(@ModelAttribute Questionario questionario) {
        if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
            return "index";
        }

            Long id = questionario.getId();
            Questionario q = questionarioRepository.findOne(id);
        if(q!=null){
            session.setAttribute("perguntas", perguntaRepository.findByQuestionarioId(id));
            session.setAttribute("questionario", q);
            return "CadastroQuestoes";
        }else{
            return "CadastroQuestionarios";
        }
    }

    @RequestMapping(value = "/Perguntas", params = {"DeletaQuestionario"})
    public String RemoverQuestionario(@ModelAttribute Questionario questionario, final HttpServletRequest req) {
        if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
            return "index";
        }
        try {
            Questionario q = questionarioRepository.findOne(questionario.getId());
            System.out.println("q.getId() = " + q.getId());
            questionarioRepository.delete(q.getId());
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
            p.addRespostas(new Resposta(req.getParameter(String.valueOf(i)), Integer.valueOf(req.getParameter("Resposta")) == i ? true : false));
            i++;
        }
        Questionario q = questionarioRepository.findOne(Long.valueOf(req.getParameter("questionarioid")));
        q.addPerguntas(p);
        questionarioRepository.save(q);
        session.setAttribute("perguntas", perguntaRepository.findByQuestionarioId(q.getId()));
        session.setAttribute("questionario", q);
        return "CadastroQuestoes";
    }

    @RequestMapping(value = "/cadastrarPerguntas", params = {"voltar"})
    public String VoltarParaCadastraQuestões(Model model) {
        if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
            return "index";
        }
        model.addAttribute("login",new LoginData());
        return "index";
    }

    @RequestMapping(value = "/opcaoPergunta", params = {"np"})
    public String NovaPergunta(HttpServletRequest req) {
        if (("").equals(session.getAttribute("user")) || session.getAttribute("user") == null) {
            return "index";
        }
        Questionario q = questionarioRepository.findOne(Long.valueOf(req.getParameter("questionarioid")));
        session.setAttribute("perguntas", perguntaRepository.findByQuestionarioId(Long.valueOf(req.getParameter("questionarioid"))));
        session.setAttribute("questionario", q);
        return "CadastroQuestoes";

    }

    @RequestMapping(value = "/opcaoPergunta", params = {"nq"})
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
        perguntaRepository.delete(Long.valueOf(req.getParameter("perguntaid")));
        Questionario q = questionarioRepository.findOne(Long.valueOf(req.getParameter("questionarioid")));
        session.setAttribute("perguntas", perguntaRepository.findByQuestionarioId(Long.valueOf(req.getParameter("questionarioid"))));

        session.setAttribute("questionario", q);
        return "CadastroQuestoes";

    }

}
