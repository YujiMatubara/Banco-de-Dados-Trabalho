--Query 1
-- Selecionar médias de todos os cursos de um determinado tema que possuam pelo menos 50 avaliações ordenadas de maior para menor.
-- (ou seja, queremos selecionar os cursos mais bem avaliados de cada tema) 
Select titulo, SOMA_AVALIACAO/QTD_AVALIACAO as Media_Curso 
from Curso join Assunto on Curso.tema = Assunto.tema
where Curso.QTD_AVALIACAO >= 50
group by(curso.titulo, curso.tema, SOMA_AVALIACAO/QTD_AVALIACAO)
order by(SOMA_AVALIACAO/QTD_AVALIACAO) DESC;

-- Query 2
-- Selecionar de todos os usuários seu email, nome, número de cursos cursados, 
-- número de cursos concluídos e número de conquistas de cada tipo (estatísticas dos usuários)



-- Query  3
-- Selecionar a quantidade de perguntas de todos os quizes de determinado nível de um mesmo tema/subtema (perguntas agrupadas por nível de cada tema)

--internamente contabilizar todas as questões por ID
-- com a tabela de respostas juntar com os temas, subtemas e nivel para ordenação
select Q1.ID, Q1.TEMA, Q1.SUB_TEMA, Q1.NIVEL, Q2.NQUESTIONS
from QUIZ Q1 join (
    select Q.ID, count(*) as NQUESTIONS
    from QUIZ_PERGUNTAS QP join QUIZ Q
        on QP.ID = Q.ID
    group by
        Q.ID) Q2
    on Q1.ID = Q2.ID
order by Q1.TEMA, Q1.SUB_TEMA, Q1.NIVEL;

-- Query 4
-- Selecionar todos os palestrantes que deram os cursos mais bem avaliados de determinado tema (selecionar os melhores palestrantes de cada área) 



-- Query 5
-- Fazer ranking entre amigos com base na quantidade de conquistas ordenadas por conquistas de nível alto para baixo (tipo placar de medalhas das olimpíadas) 



