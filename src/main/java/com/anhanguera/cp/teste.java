package com.anhanguera.cp;

import com.anhanguera.cp.infra.AlunoRepository;
import com.anhanguera.cp.infra.ResultadosRepository;
import com.anhanguera.cp.model.Resultados;
import com.anhanguera.cp.model.Users.Aluno;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by PauloMagno on 04/06/2015.
 */
@Component
public class teste {

    AlunoRepository alunoRepository;
    ResultadosRepository resultadosRepository;

    @Autowired
    public teste(AlunoRepository alunoRepository, ResultadosRepository resultadosRepository){
        this.alunoRepository = alunoRepository;
        this.resultadosRepository = resultadosRepository;
    }

    public void testes(){
        Aluno a = new Aluno();
        a.setMatricula(55547858);
        a.setCpf("05854916746");
        a.setDataNascimento("18/11/1988");
        a.setEmail("paulo.salum@outlook.com");
        a.setNome("Paulo Salum");
        a.setSenha("Pmagnus22");
        a.setSexo("M");
        try{
            alunoRepository.save(a);
            Resultados r = new Resultados();
            r.setAluno(a);
            r.setData("04/06/2015");
            r.setPontuacao(1000);
            resultadosRepository.save(r);
        }catch(Exception e) {
            System.out.println("erro: "+ e);
        }



    }
}
