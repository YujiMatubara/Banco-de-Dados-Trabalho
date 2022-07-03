---Questão 3
---internamente contabilizar todas as questões po ID
---com a tabela de respostas juntar com os temas, subtemas e nivel para ordenação
select Q1.ID, Q1.TEMA, Q1.SUB_TEMA, Q1.NIVEL, Q2.NQUESTIONS
from QUIZ Q1 join (
    select Q.ID, count(*) as NQUESTIONS
    from QUIZ_PERGUNTAS QP join QUIZ Q
        on QP.ID = Q.ID
    group by
        Q.ID) Q2
    on Q1.ID = Q2.ID
order by Q1.TEMA, Q1.SUB_TEMA, Q1.NIVEL;
