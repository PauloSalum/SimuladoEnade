package com.anhanguera.cp.Controllers;

import com.anhanguera.cp.LoginData;
import com.anhanguera.cp.infra.*;
import com.anhanguera.cp.model.Questionarios.Questionario;
import com.anhanguera.cp.model.Resultados;
import com.anhanguera.cp.model.Users.Aluno;
import com.anhanguera.cp.model.Users.Coordenador;
import com.anhanguera.cp.model.Users.Professor;
import com.anhanguera.cp.teste;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by PauloMagno on 04/06/2015.
 */
@Controller
public class LoginController {
    @Inject
    teste t;
    @Inject
    HttpSession session;

    AlunoRepository alunoRepository;
    ProfessorRepository professorRepository;
    CoordenadorRepository coordenadorRepository;
    ResultadosRepository resultadosRepository;
    QuestionarioRepository questionarioRepository;
    @Autowired
    public LoginController(QuestionarioRepository questionarioRepository, ResultadosRepository resultadosRepository, AlunoRepository alunoRepository,
            ProfessorRepository professorRepository, CoordenadorRepository coordenadorRepository){
        this.alunoRepository = alunoRepository;
        this.professorRepository=professorRepository;
        this.coordenadorRepository=coordenadorRepository;
        this.resultadosRepository=resultadosRepository;
        this.resultadosRepository=resultadosRepository;
        this.questionarioRepository = questionarioRepository;

    }

    @RequestMapping(value ="/", method = RequestMethod.GET)
    public String index(Model model){
        //t.testes();
        session.invalidate();
        List<Resultados>resultados = ListaOrdenada((List<Resultados>) resultadosRepository.findAll());
        session.setAttribute("resultados", resultados);
        model.addAttribute("login", new LoginData());
        return "index";
    }

    @RequestMapping(value ="/", method = RequestMethod.POST)
    public String login(@ModelAttribute LoginData login, Model model){
        model.addAttribute("login", new LoginData());

        if(("aluno").equals(login.getTipo()))
        {
            List <Aluno> alunos;
            if(!(alunos = alunoRepository.findByEmailAndSenha(login.getEmail(), login.getSenha())).isEmpty())
            {
                Aluno a = alunos.get(0);

                session.setAttribute("user", a);
                session.setAttribute("questionarios", questionarioRepository.findAll());
                return "Simulado";
            }
        }else if(("professor").equals(login.getTipo()))
        {
            List <Professor> professores;
            if(!(professores = professorRepository.findByEmailAndSenha(login.getEmail(),login.getSenha())).isEmpty()) {
                Professor p = professores.get(0);
                model.addAttribute("questionario", new Questionario());
                session.setAttribute("questionarios", questionarioRepository.findAll());
                session.setAttribute("user", p);
                return "CadastroQuestionarios";
            }
        }else if(("coordenador").equals(login.getTipo()))
        {
            List<Coordenador> coordenadores = new ArrayList<>();
            try{
                coordenadores = coordenadorRepository.findByEmailAndSenha(login.getEmail(),login.getSenha());
            }catch (Exception e){
                System.out.println("e = " + e);
            }
            if(!coordenadores.isEmpty()){
                Coordenador c = coordenadores.get(0);
                model.addAttribute("questionario", new Questionario());
                List<Questionario> q =(List<Questionario>) questionarioRepository.findAll();
                for(Questionario q2 : q) {
                    System.out.println("q = " + q2.getNome());
                }
                session.setAttribute("questionarios", q);
                session.setAttribute("user",c);
                return "CadastroQuestionarios";
            }
        }
        return"index";
    }
    @RequestMapping(value ="/selecaoCadastro", method = RequestMethod.GET)
    public String SelecaoCadastro(@ModelAttribute LoginData login, Model model){
        return "SelecaoCadastro";
    }


    private List<Resultados> ListaOrdenada(List<Resultados> list){
        Resultados temp;
        for(int i =0; i<list.size();i++){
                for(int j=0; j <list.size()-1;j++){
                    if (list.get(j).getPontuacao() < list.get(j+1).getPontuacao()) {
                        temp = list.get(j+1);
                        list.set(j+1,list.get(j));
                        list.set(j,temp);
                    }
                }
        }
        while(list.size()>10) {
            list.remove(list.size()-1);
        }
        return list;
    }
}
