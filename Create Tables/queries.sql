--Query 1
-- Selecionar médias de todos os cursos de um determinado tema que possuam pelo menos 50 avaliações ordenadas de maior para menor.
-- (ou seja, queremos selecionar os cursos mais bem avaliados de cada tema) 
SELECT titulo, SOMA_AVALIACAO/QTD_AVALIACAO AS Media_Curso 
FROM Curso JOIN Assunto ON Curso.tema = Assunto.tema
WHERE Curso.QTD_AVALIACAO >= 50
GROUP BY(curso.titulo, curso.tema, SOMA_AVALIACAO/QTD_AVALIACAO)
ORDER BY(SOMA_AVALIACAO/QTD_AVALIACAO) DESC;

-- Query 2
-- Selecionar de todos os usuários seu email, nome, número de cursos cursados, 
-- número de cursos concluídos e número de conquistas de cada tipo (estatísticas dos usuários)



-- Query  3
-- Selecionar a quantidade de perguntas de todos os quizes de determinado nível de um mesmo tema/subtema (perguntas agrupadas por nível de cada tema)

--internamente contabilizar todas as questões por ID
-- com a tabela de respostas juntar com os temas, subtemas e nivel para ordenação
SELECT Q1.ID, Q1.TEMA, Q1.SUB_TEMA, Q1.NIVEL, Q2.NQUESTIONS
FROM QUIZ Q1 JOIN (
    SELECT Q.ID, COUNT(*) AS NQUESTIONS
    FROM QUIZ_PERGUNTAS QP JOIN QUIZ Q
        ON QP.ID = Q.ID
    GROUP BY
        Q.ID) Q2
    ON Q1.ID = Q2.ID
ORDER BY Q1.TEMA, Q1.SUB_TEMA, Q1.NIVEL;

-- Query 4
-- Selecionar todos os palestrantes que deram os cursos mais bem avaliados de determinado tema (selecionar os melhores palestrantes de cada área) 
SELECT DISTINCT P.NOME
FROM PALESTRANTE P 
INNER JOIN MINISTRA M ON P.ID = M.PALESTRANTE
INNER JOIN CURSO C ON M.CURSO = C.ID
WHERE C.TEMA = 'X'
ORDER BY C.SOMA_AVALIACAO / C.QTD_AVALIACAO DESC;

-- Query 5
-- Fazer ranking entre amigos com base na quantidade de conquistas ordenadas por conquistas de nível alto para baixo (tipo placar de medalhas das olimpíadas) 



