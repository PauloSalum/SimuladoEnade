-- --------------------------------------------------------
-- Servidor:                     mysqldb.cxssnzntsq9f.us-west-2.rds.amazonaws.com
-- Versão do servidor:           5.6.22-log - MySQL Community Server (GPL)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para simuladoenade
CREATE DATABASE IF NOT EXISTS `simuladoenade` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `simuladoenade`;


-- Copiando estrutura para tabela simuladoenade.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `matricula` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_5jico8r03sk0intnng9tarvv9` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.aluno: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`matricula`, `id`) VALUES
	(5555555, 2);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela simuladoenade.coordenador
CREATE TABLE IF NOT EXISTS `coordenador` (
  `curso` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_pde71hk0hutgabagvvl6c3pfg` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.coordenador: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `coordenador` DISABLE KEYS */;
INSERT INTO `coordenador` (`curso`, `id`) VALUES
	('Ciencia da Computação', 4);
/*!40000 ALTER TABLE `coordenador` ENABLE KEYS */;


-- Copiando estrutura para tabela simuladoenade.pergunta
CREATE TABLE IF NOT EXISTS `pergunta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pergunta` text,
  `questionario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_874f8r5oldkcy3y55hro4v9qa` (`questionario_id`),
  CONSTRAINT `FK_874f8r5oldkcy3y55hro4v9qa` FOREIGN KEY (`questionario_id`) REFERENCES `questionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.pergunta: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `pergunta` DISABLE KEYS */;
INSERT INTO `pergunta` (`id`, `pergunta`, `questionario_id`) VALUES
	(1, 'O conceito de Tipo de Dados Abstrato (TDA) é popular em linguagens de programação. Nesse contexto, analise as afirmativas a seguir.  I. A especificação de um TDA é composta das operações aplicáveis a ele, da sua representação interna, e das implementações das operações. II. Dois mecanismos utilizáveis na implementação de um TDA em programas orientados a objetos são a composição e a herança.  III. Se S é um subtipo de outro T, então entidades do tipo S em um programa podem ser substituídas por entidades do tipo T, sem alterar a corretude desse programa.  IV. O encapsulamento em linguagens de programação orientadas a objetos é um efeito positivo do uso de TDA.  É correto apenas o que se afirma em', 1),
	(2, 'Considere a relação EMPREGADO (NumeroEmp, RG, nome, sobrenome, salario, endereco), em que o atributo grifado corresponde à chave primária da relação. Suponha que se deseje realizar as seguintes consultas: 1 Listar o nome dos empregados com sobrenome Silva; 2 Listar o nome dos empregados em ordem crescente de seus sobrenomes. Em relação à definição de um índice sobre o atributo sobrenome para melhorar o desempenho das consultas acima, julgue os itens a seguir.  I Um índice que implemente Árvore-B+ será adequado para melhorar o desempenho da consulta 1.  II Um índice que implemente Árvore-B+ será adequado para melhorar o desempenho da consulta 2.  III Um índice que implemente uma função hash será adequado para melhorar o desempenho da consulta 1.  IV Um índice que implemente uma função hash será adequado para melhorar o desempenho da consulta 2.  Assinale a opção correta. ', 1),
	(3, 'Qual tipo de software tradutor deve ser utilizado para programas em geral, quando a velocidade de execução é uma exigência de alta prioridade? ', 1),
	(4, 'Em redes locais de computadores, o protocolo de controle de acesso ao meio define um conjunto de regras que devem ser adotadas pelos múltiplos dispositivos para compartilhar o meio físico de transmissão. No caso de uma rede Ethernet IEEE 802.3 conectada fisicamente a um concentrador (hub), em que abordagem se baseia o protocolo de controle de acesso ao meio? ', 1),
	(5, 'Na comunicação sem fio, o espectro de radiofrequência adotado é um recurso finito e apenas determinada banda de frequência está disponível para cada serviço. Dessa forma, torna-se crítico explorar técnicas de múltiplo acesso que permitam o compartilhamento da banda de frequência do serviço entre os usuários. Qual opção apresenta apenas técnicas de múltiplo acesso para o compartilhamento da banda de frequência alocada a um serviço? ', 1),
	(6, 'Julgue os itens a seguir, relativos a métodos de busca com informação (busca heurística) e sem informação (busca cega), aplicados a problemas em que todas as ações têm o mesmo custo, o grafo de busca tem fator de ramificação finito e as ações não retornam a estados já visitados.  I A primeira solução encontrada pela estratégia de busca em largura é a solução ótima. II A primeira solução encontrada pela estratégia de busca em profundidade é a solução ótima.  III As estratégias de busca com informação usam funções heurísticas que, quando bem definidas, permitem melhorar a eficiência da busca.  IV A estratégia de busca gulosa é eficiente porque expande apenas os nós que estão no caminho da solução.  Estão certos apenas os itens ', 1),
	(7, 'Uma empresa realizou uma avaliação de desempenho de um sistema web. Nessa avaliação, foram determinados o desvio padrão e a média do tempo de resposta do referido sistema, tendo como base 10 consultas realizadas. Constatou-se que o tempo de resposta do sistema web possui distribuição normal. Para um nível de confiança de 95%, identificou-se o intervalo de confiança para a média do tempo de resposta das consultas. Com relação a essa avaliação de desempenho, julgue os itens abaixo.  I Com a medição do tempo de resposta do sistema para 10 consultas adicionais, é possível que a média e o desvio padrão do tempo de resposta para o conjunto das 20 consultas aumente ou diminua.  II Com a medição do tempo de resposta do sistema para 15 consultas adicionais, com nível de confiança de 95%, o intervalo de confiança para o conjunto das 25 consultas é maior que o intervalo de confiança para o conjunto das 10 consultas iniciais.  III Na medição do tempo de resposta das 10 consultas iniciais, o intervalo de confiança com nível de confiança de 99% é maior que o intervalo de confiança com nível de confiança de 95%.  Assinale a opção correta. ', 1),
	(8, 'Modems são dispositivos capazes de converter um sinal digital em um sinal analógico e vice-versa. No processo de modulação, para representar o sinal digital, o modem pode manipular as características de uma onda portadora (amplitude, frequência e fase), derivando diferentes técnicas de modulação, por exemplo: chaveamento da amplitude (ASK), chaveamento da frequência (FSK) e chaveamento da fase (PSK). Com relação a técnicas de modulação, julgue os itens a seguir.  I A modulação ASK é suscetível a ruídos.  II A modulação FSK possui maior imunidade a ruídos quando comparada à modulação ASK.  III Na modulação PSK, a fase da portadora é modificada durante o intervalo de sinalização.  IV Existem técnicas híbridas de modulação digital que modificam tanto a amplitude quanto a fase da portadora. V As diversas técnicas de modulação transmitem, no mínimo, um único bit e, no máximo, 2 bits, por intervalo de sinalização.  Estão certos apenas os itens ', 1),
	(9, 'Compiladores de linguagens de programação traduzem programas-fonte, em uma linguagem de entrada, para programas-objeto, em uma linguagem de saída. Durante o processo de tradução, o compilador deve verificar se as sentenças do programa-fonte estão sintaticamente corretas. Esse processo de análise sintática pode ser realizado construindo-se uma árvore de análise segundo duas principais abordagens: top-down, quando a árvore é investigada da raiz às folhas; ou bottom-up, das folhas à raiz. Acerca desse assunto, julgue os itens seguintes.  I A análise top-down é adequada quando a linguagem de entrada é definida por uma gramática recursiva à esquerda.  II Independentemente da abordagem adotada, top-down ou bottom-up, o analisador sintático utiliza informações resultantes da análise léxica.  III Se os programas em uma linguagem podem ser analisados tanto em abordagem top-down como em bottom-up, a gramática dessa linguagem é ambígua.  IV A análise bottom-up utiliza ações comumente conhecidas como deslocamentos e reduções sobre as sentenças do programa-fonte.  Estão certos apenas os itens ', 1),
	(10, 'Uma arquitetura de rede é usualmente organizada em um conjunto de camadas e protocolos com o propósito de estruturar o hardware e o software de comunicação. Como exemplos, têm-se as arquiteturas OSI e TCP/IP. A arquitetura TCP/IP, adotada na Internet, é um exemplo concreto de tecnologia de interconexão de redes e sistemas heterogêneos usada em escala global. Com relação à arquitetura TCP/IP, assinale a opção correta. ', 1),
	(11, 'Considere que a correlação linear entre o número de erros de código de programação (Y) e o respectivo tamanho de um programa (X), em número de linhas de código, seja igual a 0,7. A variável aleatória Y segue uma distribuição Normal com média e desvio padrão iguais a 0,1 erro de código, enquanto que a variável X segue uma distribuição Normal com média 15 e desvio padrão 5 linhas de código. A reta de regressão linear é uma esperança condicional na forma E(Y|X = x) = ax – 0,11, em que x > 10 é um dado valor para o tamanho do programa e a é o coeficiente angular da reta de regressão. Nessa situação, para um programa cujo tamanho é x = 20, pela reta de regressão linear, qual é o número esperado de erros de código de programação?', 1),
	(12, 'Redes locais sem fio que utilizam tecnologia IEEE 802.11, comumente referenciada como Wi-Fi, estão se tornando cada vez mais populares. Julgue os itens abaixo, relativos a essa tecnologia.  I Computadores em redes IEEE 802.11 podem-se comunicar por dois modos básicos: usando uma infraestrutura coordenada por pontos de acesso à rede (access points — AP), ou no modo ad hoc, em que cada computador troca informações diretamente com os demais.  II Para poder transmitir por meio de um ponto de acesso, uma interface de rede deve realizar um procedimento de associação, que inclui o conhecimento de um campo identificador (service set identifier — SSI).  III Um mecanismo de detecção de colisão durante a transmissão indica a necessidade de retransmissão e evita o envio de mensagens de confirmação.  IV Um mecanismo de requisição para transmissão (request to send — RTS) e de liberação para transmissão (clear to send — CTS) pode ser usado para evitar colisões. V O protocolo WEP (wired equivalent privacy) impede que interfaces não-autorizadas recebam sinais propagados pelo meio.  Estão certos apenas os itens ', 1),
	(13, 'Ao se realizar o acesso a um servidor WWW usando o protocolo HTTPS, uma sessão SSL é estabelecida sobre a conexão TCP, entre o programa navegador do usuário e o processo servidor. Para tanto, usam-se mecanismos baseados em criptografia simétrica e assimétrica para prover serviços de segurança. Em relação ao acesso HTTP, sem SSL, que serviços de segurança são providos para o usuário? ', 1),
	(14, 'No processo de pesquisa binária em um vetor ordenado, os números máximos de comparações necessárias para se determinar se um elemento faz parte de vetores com tamanhos 50, 1.000 e 300 são, respectivamente, iguais a ', 1),
	(15, 'Acerca de paradigmas de linguagens de programação, julgue os itens a seguir.  I Linguagens procedurais facilitam a legibilidade e a documentação do software.  II Linguagens declarativas facilitam o desenvolvimento de sistemas de apoio à decisão. III Linguagens funcionais facilitam a definição de requisitos e a decomposição funcional.  IV Linguagens estruturadas promovem o forte acoplamento entre dados e funções.  V Linguagens orientadas a objeto permitem reduzir custos de desenvolvimento e manutenção.  Estão certos apenas os itens ', 1),
	(16, 'O método de alocação de espaço de disco utilizado para armazenamento de informações em um sistema de arquivos determina o desempenho desse sistema. Com relação a esse assunto, julgue os itens seguintes.  I A alocação contígua é um método adequado para sistemas em que inserções e remoções de arquivos são frequentes.  II Na alocação indexada, o tamanho máximo de um arquivo depende do número de bits utilizados para representar um índice e do tamanho dos blocos de índices.  III Na alocação encadeada, o tamanho máximo de um arquivo depende do tamanho dos blocos de dados.  Assinale a opção correta. ', 1),
	(17, 'No famoso jogo da Torre de Hanoi, é dada uma torre com discos de raios diferentes, empilhados por tamanho decrescente em um dos três pinos dados, como ilustra a figura acima. O objetivo do jogo é transportar-se toda a torre para um dos outros pinos, de acordo com as seguintes regras: apenas um disco pode ser deslocado por vez, e, em todo instante, todos os discos precisam estar em um dos três pinos; além disso, em nenhum momento, um disco pode ser colocado sobre um disco de raio menor que o dele; é claro que o terceiro pino pode ser usado como local temporário para os discos. Imaginando que se tenha uma situação em que a torre inicial tenha um conjunto de 5 discos, qual o número mínimo de movimentações de discos que deverão ser realizadas para se atingir o objetivo do jogo? ', 1),
	(18, 'O Processo Unificado (RUP – rational unified process) é um moderno processo de desenvolvimento de software constituído de quatro fases. Assinale a opção que apresenta as quatro fases do RUP, na ordem em que elas devem ser executadas. ', 1),
	(19, 'Requisitos de um sistema são frequentemente classificados como funcionais, não-funcionais e de domínio. Qual a definição que melhor descreve requisitos não-funcionais? ', 1),
	(20, 'Um estudo recente realizado pela Associação Brasileira das Empresas de Software (ABES) e a Business Software Alliance (BSA) mostra uma redução na pirataria de software no mundo e no Brasil, de 1994 a 2002. Com relação a esse assunto, julgue os itens a seguir.  I A redução da pirataria de software no contexto brasileiro traz benefícios para a criação de empregos, aumento da arrecadação de impostos e aumento no faturamento da economia.  II A reprodução de software original ou autorizado para fins de segurança ou backup é também considerada pirataria de software.  III As iniciativas antipirataria devem incluir ações de conscientização, educação e atuação direta sobre os contraventores.  IV A pirataria de software é uma atividade criminosa, contudo não há no Brasil, ainda, legislação específica que regulamente essa questão. Estão certos apenas os itens ', 1),
	(21, 'O problema da parada para máquinas de Turing, ou simplesmente problema da parada, pode ser assim descrito: determinar, para quaisquer máquina de Turing M e palavra w, se M irá eventualmente parar com entrada w.  Mais informalmente, o mesmo problema também pode ser assim descrito: dados um algoritmo e uma entrada finita, decidir se o algoritmo  termina ou se executará indefinidamente. Para o problema da parada', 1),
	(22, 'Suponha que seja necessário desenvolver uma ferramenta que apresente o endereço IP dos múltiplos roteadores, salto a salto, que compõem o caminho do hospedeiro em que a ferramenta é executada até um determinado destino (segundo seu endereço IP), assim como o round-trip time até cada roteador. Tal ferramenta precisa funcionar na Internet atual, sem demandar mudanças em roteadores nem a introdução de novos protocolos. Considerando o problema acima, qual dos seguintes protocolos representaria a melhor (mais simples e eficiente) solução? ', 1),
	(23, 'Um navegador Web executa em um hospedeiro A, em uma rede de uma organização, e acessa uma página localizada de um servidor Web em um hospedeiro B, situado em outra rede na Internet. A rede em que A se situa conta com um servidor DNS local. Um profissional deseja fazer uma lista com a sequência de protocolos empregados e comparar com o resultado apresentado por uma ferramenta de monitoramento executada no hospedeiro A. A lista assume que  todas as tabelas com informações temporárias e caches estão vazias;  o hospedeiro cliente está configurado com o endereço IP do servidor DNS local. Qual das sequências a seguir representa a ordem em que mensagens, segmentos e pacotes serão observados em um meio físico ao serem enviados pelo hospedeiro A? ', 1),
	(24, 'Um vendedor de artigos de pesca obteve com um amigo o código executável (já compilado) de um programa que gerencia vendas e faz o controle de estoque, com o intuito de usá-lo em sua loja. Segundo o seu amigo, o referido programa foi compilado em seu sistema computacional pessoal (sistema A) e funciona corretamente. O vendedor constatou que o programa excecutável também funciona corretamente no sistema computacional de sua loja (sistema B). Considerando a situação relatada, analise as afirmações a seguir.  I. Os computadores poderiam ter quantidades diferentes de núcleos (cores).  II. As chamadas ao sistema (system call) do sistema operacional no sistema A devem ser compatíveis com as do sistema B.  III. O conjunto de instruções do sistema A poderia ser diferente do conjunto de instruções do sistema B.  IV. Se os registradores do sistema A forem de 64 bits, os registradores do sistema B poderiam ser de 32 bits.  É correto o que se afirma em ', 1),
	(25, 'Uma equipe está realizando testes com base nos códigos-fonte de um sistema. Os testes envolvem a verificação de diversos componentes individualmente, bem como das interfaces entre os componentes. No contexto apresentado, essa equipe está realizando testes em nível de :', 1),
	(26, 'No desenvolvimento de um software que analisa bases de DNA, representadas pelas letras A, C, G, T, utilizou-se as estruturas de dados: pilha e fi la. Considere que, se uma sequência representa uma pilha, o topo é o elemento mais à esquerda; e se uma sequência representa uma fi la, a sua frente é o elemento mais à esquerda. Analise o seguinte cenário: “a sequência inicial fi cou armazenada na primeira estrutura de dados na seguinte ordem: (A,G,T,C,A,G,T,T). Cada elemento foi retirado da primeira estrutura de dados e inserido na segunda estrutura de dados, e a sequência fi cou armazenada na seguinte ordem: (T,T,G,A,C,T,G,A). Finalmente, cada elemento foi retirado da segunda estrutura de dados e inserido na terceira estrutura de dados e a sequência fi cou armazenada na seguinte ordem: (T,T,G,A,C,T,G,A)”. Qual a única sequência de estruturas de dados apresentadas a seguir pode ter sido usada no cenário descrito acima? ', 1),
	(27, 'Algoritmos criados para resolver um mesmo problema podem diferir de forma drástica quanto a sua eficiência. Para evitar este fato, são utilizadas técnicas algorítmicas, isto é, conjunto de técnicas que compreendem os métodos de codificação de algoritmos de forma a salientar sua complexidade, levando-se em conta a forma pela qual determinado algoritmo chega à solução desejada. Considerando os diferentes paradigmas e técnicas de projeto de algoritmos, analise as afirmações abaixo.  I. A técnica de tentativa e erro (backtracking) efetua uma escolha ótima local, na esperança de obter uma solução ótima global.  II. A técnica de divisão e conquista pode ser dividida em três etapas: dividir a instância do problema em duas ou mais instâncias menores; resolver as instâncias menores recursivamente; obter a solução para as instâncias originais (maiores) por meio da combinação dessas soluções.  III. A técnica de programação dinâmica decompõe o processo em um número finito de subtarefas parciais que devem ser exploradas exaustivamente.  IV. O uso de heurísticas (ou algoritmos aproximados) é caracterizado pela ação de um procedimento chamar a si próprio, direta ou indiretamente.  É correto apenas o que se afirma em ', 1),
	(28, 'Uma antiga empresa de desenvolvimento de software resolveu atualizar toda sua infraestrutura computacional adquirindo um sistema operacional multitarefa, processadores multi-core (múltiplos núcleos) e o uso de uma linguagem de programação com suporte a threads. O sistema operacional multitarefa de um computador é capaz de executar vários processos (programas) em paralelo. Considerando esses processos implementados com mais de uma thread (multi-threads), analise as afirmações abaixo.  I. Os ciclos de vida de processos e threads são idênticos.  II. Threads de diferentes processos compartilham memória.  III. Somente processadores multi-core são capazes de executar programas multi-threads.  IV. Em sistemas operacionais multitarefa, threads podem migrar de um processo para outro.  É correto apenas o que se afirma em:', 1),
	(29, 'Suponha que se queira pesquisar a chave 287 em uma árvore binária de pesquisa com chaves entre 1 e 1 000. Durante uma pesquisa como essa, uma sequência de chaves é examinada. Cada sequência abaixo é uma suposta sequência de chaves examinadas em uma busca da chave 287.  I. 7, 342, 199, 201, 310, 258, 287  II. 110, 132, 133, 156, 289, 288, 287  III. 252, 266, 271, 294, 295, 289, 287  IV. 715, 112, 530, 249, 406, 234, 287  É válido apenas o que se apresenta em ', 1),
	(30, 'As filas de prioridades (heaps) são estruturas de dados importantes no projeto de algoritmos. Em especial, heaps podem ser utilizados na recuperação de informação em grandes bases de dados constituídos por textos. Basicamente, para se exibir o resultado de uma consulta, os documentos recuperados são ordenados de acordo com a relevância presumida para o usuário. Uma consulta pode recuperar milhões de documentos que certamente não serão todos examinados. Na verdade, o usuário examina os primeiros m documentos dos n recuperados, em que m é da ordem de algumas dezenas. Considerando as características dos heaps e sua aplicação no problema descrito acima, avalie as seguintes afirmações.  I. Uma vez que o heap é implementado como uma árvore binária de pesquisa essencialmente completa, o custo computacional para sua construção é O(n log n).  II. A implementação de heaps utilizando-se vetores é eficiente em tempo de execução e em espaço de armazenamento, pois o pai de um elemento armazenado na posição i se encontra armazenado na posição 2i+1.  III. O custo computacional para se recuperar de forma ordenada os m documentos mais relevantes armazenados em um heap de tamanho n é O(m log n).  IV. Determinar o documento com maior valor de relevância armazenado em um heap tem custo computacional O(1).  Está correto apenas o que se afirma em ', 1);
/*!40000 ALTER TABLE `pergunta` ENABLE KEYS */;


-- Copiando estrutura para tabela simuladoenade.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `curso` varchar(255) DEFAULT NULL,
  `materia` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_mw7fqu259ujbc08jyrlecjrm4` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.professor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;


-- Copiando estrutura para tabela simuladoenade.questionario
CREATE TABLE IF NOT EXISTS `questionario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rj0bqcb65c09wdj0yn5v94kkt` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.questionario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `questionario` DISABLE KEYS */;
INSERT INTO `questionario` (`id`, `nome`) VALUES
	(2, 'Ética'),
	(1, 'Informática');
/*!40000 ALTER TABLE `questionario` ENABLE KEYS */;


-- Copiando estrutura para tabela simuladoenade.resposta
CREATE TABLE IF NOT EXISTS `resposta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correta` bit(1) NOT NULL,
  `resposta` text,
  `pergunta_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jqt9lsfeng447vrxrfg53w3nv` (`pergunta_id`),
  CONSTRAINT `FK_jqt9lsfeng447vrxrfg53w3nv` FOREIGN KEY (`pergunta_id`) REFERENCES `pergunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.resposta: ~150 rows (aproximadamente)
/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
INSERT INTO `resposta` (`id`, `correta`, `resposta`, `pergunta_id`) VALUES
	(1, b'0', 'I. ', 1),
	(2, b'0', 'II. ', 1),
	(3, b'0', 'I e III. ', 1),
	(4, b'1', 'II e IV. ', 1),
	(5, b'0', 'III e IV.', 1),
	(6, b'0', 'Apenas um item está certo. ', 2),
	(7, b'0', 'Apenas os itens I e II estão certos. ', 2),
	(8, b'0', 'Apenas os itens III e IV estão certos. ', 2),
	(9, b'1', 'Apenas os itens I, II e III estão certos.', 2),
	(10, b'0', 'Todos os itens estão certos.', 2),
	(11, b'1', 'compiladores ', 3),
	(12, b'0', 'interpretadores ', 3),
	(13, b'0', 'tradutores híbridos ', 3),
	(14, b'0', 'macroprocessadores ', 3),
	(15, b'0', 'interpretadores de macroinstruções', 3),
	(16, b'0', 'na passagem de permissão em anel ', 4),
	(17, b'0', 'na ordenação com contenção ', 4),
	(18, b'0', 'na ordenação sem contenção ', 4),
	(19, b'1', 'na contenção com detecção de colisão ', 4),
	(20, b'0', 'na arbitragem centralizada', 4),
	(21, b'0', 'Bluetooth, WiFi e WiMax ', 5),
	(22, b'0', 'CDMA, GSM, TDMA ', 5),
	(23, b'0', '3G, WAP e ZigBee ', 5),
	(24, b'1', 'CDMA, FDMA e TDMA ', 5),
	(25, b'0', 'CCMP, TKIP e WEP', 5),
	(26, b'0', 'I e II. ', 6),
	(27, b'0', 'I e III. ', 6),
	(28, b'1', 'I e IV. ', 6),
	(29, b'0', 'II e IV. ', 6),
	(30, b'0', 'III e IV.', 6),
	(31, b'0', 'Apenas um item está certo. ', 7),
	(32, b'0', 'Apenas os itens I e II estão certos. ', 7),
	(33, b'1', 'Apenas os itens I e III estão certos. ', 7),
	(34, b'0', 'Apenas os itens II e III estão certos. ', 7),
	(35, b'0', 'Todos os itens estão certos.', 7),
	(36, b'1', 'I, II e IV. ', 8),
	(37, b'0', 'I, II e V. ', 8),
	(38, b'0', 'I, III e IV. ', 8),
	(39, b'0', 'II, III e V. ', 8),
	(40, b'0', 'III, IV e V.', 8),
	(41, b'0', 'I e II. ', 9),
	(42, b'0', 'I e III. ', 9),
	(43, b'1', 'II e IV. ', 9),
	(44, b'0', 'I, III e IV. ', 9),
	(45, b'0', 'II, III e IV.', 9),
	(46, b'0', 'A camada de interface de rede, também denominada intrarede, adota o conceito de portas para identificar os dispositivos da rede física. Cada porta é associada à interface de rede do dispositivo e os quadros enviados transportam o número das portas para identificar os dispositivos de origem e de destino. ', 10),
	(47, b'1', 'A camada de rede, também denominada inter-rede, adota endereços IP para identificar as redes e seus dispositivos. Para interconectar redes físicas que adotam diferentes tamanhos máximos de quadros, a camada de rede adota os conceitos de fragmentação e remontagem de datagramas. ', 10),
	(48, b'0', 'A camada de transporte é responsável pelo processo de roteamento de datagramas. Nesse processo, a camada de transporte deve selecionar os caminhos ou rotas que os datagramas devem seguir entre os dispositivos de origem e de destino, passando assim através das várias redes interconectadas. ', 10),
	(49, b'0', 'A camada de aplicação é composta por um conjunto de protocolos, que são implementados pelos processos executados nos dispositivos. Cada protocolo de aplicação deve especificar a interface gráfica ou textual oferecida pelo respectivo processo para permitir a interação com os usuários da aplicação. ', 10),
	(50, b'0', 'A arquitetura TCP/IP é uma implementação concreta da arquitetura conceitual OSI. Portanto, a arquitetura TCP/IP é também estruturada em 7 camadas, que são as camadas: física, de enlace, de rede, de transporte, de sessão, de apresentação e de aplicação.', 10),
	(51, b'0', '0,10 ', 11),
	(52, b'0', '0,12 ', 11),
	(53, b'1', '0,17 ', 11),
	(54, b'0', '0,20 ', 11),
	(55, b'0', '0,22', 11),
	(56, b'1', 'I, II e IV.', 12),
	(57, b'0', 'I, III e V. ', 12),
	(58, b'0', 'I, IV e V. ', 12),
	(59, b'0', 'II, III e IV. ', 12),
	(60, b'0', 'II, III e V.', 12),
	(61, b'0', 'autenticação do servidor e controle de acesso do cliente .', 13),
	(62, b'0', 'autenticação do cliente e controle da velocidade de transmissão .', 13),
	(63, b'0', 'autenticação da rede e proteção contra vírus .', 13),
	(64, b'1', 'autenticação do servidor e confidencialidade das transmissões .', 13),
	(65, b'0', 'autenticação do cliente e temporização das ações executadas.', 13),
	(66, b'0', '5, 100 e 30. ', 14),
	(67, b'1', '6, 10 e 9. ', 14),
	(68, b'0', '8, 31 e 18. ', 14),
	(69, b'0', '10, 100 e 30.', 14),
	(70, b'0', '25, 500 e 150.', 14),
	(71, b'0', 'I e II. ', 15),
	(72, b'0', 'I e IV. ', 15),
	(73, b'0', 'II e III', 15),
	(74, b'1', 'III e V. ', 15),
	(75, b'0', 'IV e V. ', 15),
	(76, b'1', 'Apenas um item está certo. ', 16),
	(77, b'0', 'Apenas os itens I e II estão certos. ', 16),
	(78, b'0', 'Apenas os itens I e III estão certos. ', 16),
	(79, b'0', 'Apenas os itens II e III estão certos. ', 16),
	(80, b'0', 'Todos os itens estão certos.', 16),
	(81, b'0', '25 ', 17),
	(82, b'0', '28', 17),
	(83, b'1', '31', 17),
	(84, b'0', '34', 17),
	(85, b'0', '38', 17),
	(86, b'0', 'concepção, elaboração, construção, teste ', 18),
	(87, b'0', 'elaboração, transição, concepção, construção ', 18),
	(88, b'0', 'elaboração, concepção, teste, transição ', 18),
	(89, b'0', 'elaboração, concepção, transição, construção ', 18),
	(90, b'1', 'concepção, elaboração, construção, transição', 18),
	(91, b'0', 'São ferramentas automatizadas de apoio ao processo de desenvolvimento de sistemas. ', 19),
	(92, b'0', 'São requisitos que descrevem o que o sistema deve fazer, como deve reagir a determinadas entradas e como deve comportar-se em situações particulares. ', 19),
	(93, b'0', 'São requisitos que derivam do domínio da aplicação e que refletem características e restrições desse domínio. ', 19),
	(94, b'1', 'São requisitos que não estão diretamente relacionados com as funções específicas do sistema. ', 19),
	(95, b'0', 'São requisitos que especificam como deve ser testada uma parte do sistema, incluindo-se as entradas, os resultados esperados e as condições sob as quais os testes devem ocorrer. ', 19),
	(96, b'0', 'I e II. ', 20),
	(97, b'1', 'I e III. ', 20),
	(98, b'0', 'II e III. ', 20),
	(99, b'0', 'II e IV. ', 20),
	(100, b'0', 'III e IV', 20),
	(101, b'0', 'existe algoritmo exato de tempo de execução polinomial para solucioná-lo.  ', 21),
	(102, b'0', 'existe algoritmo exato de tempo de execução exponencial para solucioná-lo.  ', 21),
	(103, b'1', 'não existe algoritmo que o solucione, não importa quanto tempo seja disponibilizado.  ', 21),
	(104, b'0', 'não existe algoritmo exato, mas existe algoritmo de aproximação de tempo de execução polinomial que o soluciona, fornecendo respostas aproximadas.  ', 21),
	(105, b'0', 'não existe algoritmo exato, mas existe algoritmo de aproximação de tempo de execução exponencial que o soluciona, fornecendo respostas aproximadas ', 21),
	(106, b'0', 'IP: Internet Protocol. ', 22),
	(107, b'0', 'UDP: User Datagram Protocol. ', 22),
	(108, b'0', 'TCP: Transmission Control Protocol. ', 22),
	(109, b'1', 'ICMP: Internet Control Message Protocol. ', 22),
	(110, b'0', 'DHCP: Dynamic Host Confi guration Protocol. ', 22),
	(111, b'1', 'ARP, DNS/UDP/IP, TCP/IP e HTTP/TCP/IP. ', 23),
	(112, b'0', 'ARP, DNS/UDP/IP, HTTP/TCP/IP e TCP/IP. ', 23),
	(113, b'0', 'DNS/UDP/IP, ARP, HTTP/TCP/IP e TCP/IP. ', 23),
	(114, b'0', 'DNS/UDP/IP, ARP, TCP/IP e HTTP/TCP/IP. ', 23),
	(115, b'0', 'HTTP/TCP/IP, TCP/IP, DNS/UDP/IP e ARP.', 23),
	(116, b'0', 'III, apenas. ', 24),
	(117, b'1', 'I e II, apenas. ', 24),
	(118, b'0', 'III e IV, apenas.', 24),
	(119, b'0', 'I, II e IV, apenas. ', 24),
	(120, b'0', 'I, II, III e IV.', 24),
	(121, b'0', 'unidade. ', 25),
	(122, b'0', 'aceitação. ', 25),
	(123, b'0', 'sistema e aceitação. ', 25),
	(124, b'0', 'integração e sistema. ', 25),
	(125, b'1', 'unidade e integração.', 25),
	(126, b'1', 'Fila - Pilha - Fila. ', 26),
	(127, b'0', 'Fila - Fila - Pilha. ', 26),
	(128, b'0', 'Fila - Pilha - Pilha. ', 26),
	(129, b'0', 'Pilha - Fila - Pilha. ', 26),
	(130, b'0', 'Pilha - Pilha - Pilha.', 26),
	(131, b'0', 'I. ', 27),
	(132, b'1', 'II. ', 27),
	(133, b'0', 'I e IV. ', 27),
	(134, b'0', 'II e III. ', 27),
	(135, b'0', 'III e IV', 27),
	(136, b'1', 'I. ', 28),
	(137, b'0', 'II. ', 28),
	(138, b'0', 'I e III. ', 28),
	(139, b'0', 'I e IV. ', 28),
	(140, b'0', 'II e IV', 28),
	(141, b'0', 'I. ', 29),
	(142, b'0', 'III. ', 29),
	(143, b'1', 'I e II. ', 29),
	(144, b'0', 'II e IV. ', 29),
	(145, b'0', 'III e IV', 29),
	(146, b'0', 'I e II. ', 30),
	(147, b'0', 'II e III. ', 30),
	(148, b'1', 'III e IV. ', 30),
	(149, b'0', 'I, II e IV. ', 30),
	(150, b'0', 'I, III e IV.', 30);
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;


-- Copiando estrutura para tabela simuladoenade.resultados
CREATE TABLE IF NOT EXISTS `resultados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) DEFAULT NULL,
  `pontuacao` float NOT NULL,
  `aluno_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g7uv9vn10mdbv0255bqyts7x2` (`aluno_id`),
  CONSTRAINT `FK_g7uv9vn10mdbv0255bqyts7x2` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.resultados: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
INSERT INTO `resultados` (`id`, `data`, `pontuacao`, `aluno_id`) VALUES
	(1, '09/06/2015', 2.33333, 2);
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;


-- Copiando estrutura para tabela simuladoenade.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) DEFAULT NULL,
  `data_nascimento` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mlc38vvtx4vwuxelt6dhvq3kx` (`email`,`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela simuladoenade.user: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `cpf`, `data_nascimento`, `email`, `nome`, `senha`, `sexo`) VALUES
	(2, '05854916746', '1988-11-18', 'paulo.salum@hotmail.com', 'Paulo Magno Rodrigues Salum', 'Pmagnus22', 'M'),
	(4, '05854916746', '1988-11-18', 'paulo.salum@outlook.com', 'Paulo Magno Rodrigues Salum', 'Pmagnus22', 'M');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
