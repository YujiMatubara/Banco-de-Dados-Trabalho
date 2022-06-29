INSERT INTO USUARIO 
(EMAIL, NOME, NIVEL_DE_PRIVILEGIO, NIVEL_DE_CONQUISTA) 
VALUES
('yuji.matubara@usp.br', 'Lucas Yuji Matubara', 0, 1234);

INSERT INTO USUARIO 
(EMAIL, NOME, NIVEL_DE_PRIVILEGIO, NIVEL_DE_CONQUISTA) 
VALUES
('wictor@usp.br', 'Wictor Dalbosco Silva', 0, 1225);

INSERT INTO USUARIO 
(EMAIL, NOME, NIVEL_DE_PRIVILEGIO, NIVEL_DE_CONQUISTA) 
VALUES
('pedro@usp.br', 'Pedro Henrique', 1, 1231);


--------------------------------------------------------------------------------
INSERT INTO ASSUNTO
(TEMA, SUB_TEMA)
VALUES
('Matemática', 'Discreta');

INSERT INTO ASSUNTO
(TEMA, SUB_TEMA)
VALUES
('Português', 'Análise Sintática');

--------------------------------------------------------------------------------
INSERT INTO CURSO
(TITULO, DATA_LANCAMENTO, TEMA, SUB_TEMA, PRECO, NRO_AULAS, IDIOMA, DURACAO, SOMA_AVALIACAO, QTD_AVALIACAO)
VALUES
('Matemática para computeiro', TO_DATE('2020/02/02 06:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'Matemática', 'Discreta', 150.00, 34, 'português', '54 horas 30 minutos', 69, 8);

INSERT INTO CURSO
(TITULO, DATA_LANCAMENTO, TEMA, SUB_TEMA, PRECO, NRO_AULAS, IDIOMA, DURACAO, SOMA_AVALIACAO, QTD_AVALIACAO)
VALUES
('Português, ETEC, 2022, 1 Ano, 1º Semestre', TO_DATE('2020/02/02 06:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'Português', 'Análise Sintática', 0.00, 20, 'português', '33 horas 0 minutos', 18, 2);

--------------------------------------------------------------------------------
INSERT INTO CONQUISTAS
(NOME, NIVEL)
VALUES
('Conta criada', 'Bronze');

INSERT INTO CONQUISTAS
(NOME, NIVEL)
VALUES
('Email verificado', 'Bronze');

--------------------------------------------------------------------------------
INSERT INTO CONQUISTA_REQUISITO
(NOME, DESCRICAO_REQUISITO)
VALUES
('Conta criada', 'Criar uma conta nova na plataforma.');

INSERT INTO CONQUISTA_REQUISITO
(NOME, DESCRICAO_REQUISITO)
VALUES
('Email verificado', 'Verificar o e-mail da conta criada.');

--------------------------------------------------------------------------------
INSERT INTO DESBLOQUEIA_CONQUISTA
(NOME_CONQUISTA, USUARIO)
VALUES
('Conta criada', 21);

INSERT INTO DESBLOQUEIA_CONQUISTA
(NOME_CONQUISTA, USUARIO)
VALUES
('Conta criada', 22);

--------------------------------------------------------------------------------
INSERT INTO CURADOR
(ID)
VALUES
(21);

INSERT INTO CURADOR
(ID)
VALUES
(25);

--------------------------------------------------------------------------------
INSERT INTO PALESTRANTE
(NOME)
VALUES
('André Moreira Souza');

INSERT INTO PALESTRANTE
(NOME)
VALUES
('João Batista');

--------------------------------------------------------------------------------
INSERT INTO ATUALIZA_PALESTRANTE
(CURADOR, PALESTRANTE, DATA_HORA_ATUALIZACAO)
VALUES
(21, 21, TO_DATE('2020/04/14 16:24:02', 'YYYY/MM/DD HH24:MI:SS'));

INSERT INTO ATUALIZA_PALESTRANTE
(CURADOR, PALESTRANTE, DATA_HORA_ATUALIZACAO)
VALUES
(21, 22, TO_DATE('2021/03/23 18:03:15', 'YYYY/MM/DD HH24:MI:SS'));

--------------------------------------------------------------------------------
INSERT INTO QUIZ
(NIVEL, TEMA, SUB_TEMA)
VALUES
('PRATA', 'Calculo', 'Teorema do Sanduiche');

INSERT INTO QUIZ
(NIVEL, TEMA, SUB_TEMA)
VALUES
('BRONZE', 'Matemática', 'Discreta');

INSERT INTO QUIZ
(NIVEL, TEMA, SUB_TEMA)
VALUES
('PRATA', 'Matemática', 'Discreta');

--------------------------------------------------------------------------------
INSERT INTO RESPONDE_QUIZ
(USUARIO, QUIZ, PONTOS)
VALUES
(25, 3, 100);

INSERT INTO RESPONDE_QUIZ
(USUARIO, QUIZ, PONTOS)
VALUES
(27, 5, 92);

--------------------------------------------------------------------------------
INSERT INTO THREAD
(TITULO, CURSO, ASSUNTO, USUARIO)
VALUES
('Questionário', 27, 'Exercício 5', 21);

INSERT INTO THREAD
(TITULO, CURSO, ASSUNTO, USUARIO)
VALUES
('Revisão Prova', 28, 'Questão 2', 27);

--------------------------------------------------------------------------------
INSERT INTO COMENTARIO
(THREAD, USUARIO, DATA_HORA_PUBLICACAO, COMENTARIO)
VALUES
(9, 29, TO_DATE('2021/07/24 11:32:11', 'YYYY/MM/DD HH24:MI:SS'), 'Te passo a resolução na próxima aula');

INSERT INTO COMENTARIO
(THREAD, USUARIO, DATA_HORA_PUBLICACAO, COMENTARIO)
VALUES
(9, 21, TO_DATE('2021/07/24 12:22:23', 'YYYY/MM/DD HH24:MI:SS'), 'Combinado');

--------------------------------------------------------------------------------
INSERT INTO CURSO_MIDIA
(CURSO, MIDIA)
VALUES
(2, 'texto');

INSERT INTO CURSO_MIDIA
(CURSO, MIDIA)
VALUES
(2, 'vídeo');

--------------------------------------------------------------------------------
INSERT INTO CURSO_LINK
(CURSO, URL, PLATAFORMA)
VALUES
(2, 'https://pt.khanacademy.org/math/ap-calculus-ab/ab-limits-new/ab-1-8/v/squeeze-sandwich-theorem', 'Khan Academy');

INSERT INTO CURSO_LINK
(CURSO, URL, PLATAFORMA)
VALUES
(28, 'https://www.youtube.com/watch?v=7cmoWUv0ysE&ab_channel=PabloJamilk', 'Youtube');

--------------------------------------------------------------------------------
INSERT INTO AMIZADE
(USUARIO, AMIGO, DATA_INICIO_AMIZADE)
VALUES
(21, 22, TO_DATE('2020/10/13 16:52:45', 'YYYY/MM/DD HH24:MI:SS'));

INSERT INTO AMIZADE
(USUARIO, AMIGO, DATA_INICIO_AMIZADE)
VALUES
(21, 27, TO_DATE('2020/10/13 16:55:34', 'YYYY/MM/DD HH24:MI:SS'));

--------------------------------------------------------------------------------
INSERT INTO SUPORTE
(USUARIO, DATA_HORA, MENSAGEM, RESPOSTA)
VALUES
(22, TO_DATE('2022/05/21 08:55:42', 'YYYY/MM/DD HH24:MI:SS'), 'Olá', 'Olá');

INSERT INTO SUPORTE
(USUARIO, DATA_HORA, MENSAGEM, RESPOSTA)
VALUES
(22, TO_DATE('2021/11/23 18:35:29', 'YYYY/MM/DD HH24:MI:SS'), 'Preciso de ajuda!', NULL);

--------------------------------------------------------------------------------
INSERT INTO CURSA
(USUARIO, CURSO, PROGRESSO, AVALIACAO, COMENTARIO, ANOTACOES_PESSOAIS)
VALUES
(27, 2, 'EM ANDAMENTO', 0, 'Sobre a aula 1', 'O teorema do sanduiche explica como uma função que está sempre no meio de outras duas pode ter limite quando os pontos são iguais na f(x).');

INSERT INTO CURSA
(USUARIO, CURSO, PROGRESSO, AVALIACAO, COMENTARIO, ANOTACOES_PESSOAIS)
VALUES
(27, 27, 'EM ANDAMENTO', 2, 'Estudar', 'Fazer mais exercícios de combinatória.');

--------------------------------------------------------------------------------
INSERT INTO PALESTRANTE_ESPECIALIZACAO
(PALESTRANTE, ESPECIALIZACAO)
VALUES
(23, 'Bases de Dados');

INSERT INTO PALESTRANTE_ESPECIALIZACAO
(PALESTRANTE, ESPECIALIZACAO)
VALUES
(24, 'Algoritmos Avançados');

--------------------------------------------------------------------------------
INSERT INTO MINISTRA
(CURSO, PALESTRANTE)
VALUES
(27, 23);

INSERT INTO MINISTRA
(CURSO, PALESTRANTE)
VALUES
(28, 23);

--------------------------------------------------------------------------------
INSERT INTO RESPONDE_COMENTARIO
(COMENTARIO, RESPOSTA)
VALUES
(14, 15);

INSERT INTO RESPONDE_COMENTARIO
(COMENTARIO, RESPOSTA)
VALUES
(15, 14);
--------------------------------------------------------------------------------
commit;