create table USUARIO (
    ID number generated always as identity,
    EMAIL varchar2(255) not null,
    NOME varchar2(100) not null,
    NIVEL_DE_PRIVILEGIO char default '0' not null,
    NIVEL_DE_CONQUISTA number(4) default 0 not null,
    
    constraint NIVEL_PRIV_CONSTRAINT check (NIVEL_DE_PRIVILEGIO in ('1', '0')),
    constraint EMAIL_UNIQUE unique(EMAIL),
    constraint PK_USUARIO primary key(ID)
);

CREATE TABLE ASSUNTO (
    TEMA VARCHAR2(50),
    SUB_TEMA VARCHAR2(50),
    
    CONSTRAINT PK_ASSUNTO PRIMARY KEY (TEMA, SUB_TEMA)
);

CREATE TABLE CONQUISTAS (
    NOME VARCHAR2(30),
    NIVEL VARCHAR2(8),
    
    CONSTRAINT PK_CONQUISTAS PRIMARY KEY (NOME),
    CONSTRAINT CK_NIVEL_CONQUISTA CHECK (UPPER(NIVEL) IN ('BRONZE', 'PRATA', 'OURO', 'PLATINA', 'DIAMANTE'))
);

CREATE TABLE CONQUISTA_REQUISITO (
    NOME VARCHAR2(30),
    DESCRICAO_REQUISITO VARCHAR2(500),
    
    CONSTRAINT PK_CONQUISTA_REQUISITO PRIMARY KEY (NOME, DESCRICAO_REQUISITO),
    CONSTRAINT FK_NOME_CONQUISTA_REQUISITO FOREIGN KEY (NOME) REFERENCES CONQUISTAS (NOME) ON DELETE CASCADE
); 

create table CURSO (
    ID number generated always as identity,
    TITULO varchar2(100) not null,
    DATA_LANCAMENTO date not null,
    TEMA varchar2(50) not null,
    SUB_TEMA varchar2(50) not null,
    PRECO number(5) default 0,
    NRO_AULAS number(4),
    IDIOMA varchar2(20),
    DURACAO varchar2(50),
    SOMA_AVALIACAO number(7) default 0,
    QTD_AVALIACAO number(7) default 0,
    
    --Constraints básicas
    constraint PK_CURSO primary key(ID),
    constraint SK_CURSO unique(TITULO, DATA_LANCAMENTO),
    constraint FK_CURSO foreign key(TEMA, SUB_TEMA) references ASSUNTO,
    
    --Constraints de checagem
    constraint CK_NRO_AULAS check(NRO_AULAS > 0),
    constraint CK_PRECO check(PRECO >= 0)
);

insert into USUARIO (EMAIL, NOME) values (
    'teste@gmail.com',
    'Teste Da Silva'
);

create table AMIZADE (
    USUARIO number,
    AMIGO number,
    DATA_INICIO_AMIZADE date default sysdate not null,
    
    constraint PK_AMIZADE primary key(USUARIO, AMIGO),
    constraint FK_AMIZADE_USUARIO foreign key (USUARIO) references USUARIO(ID)
        on delete cascade,
    constraint FK_AMIZADE_AMIGO foreign key (AMIGO) references USUARIO(ID)
        on delete cascade
);

create table SUPORTE (
    USUARIO number,
    DATA_HORA date,
    MENSAGEM varchar2(4000) not null,
    RESPOSTA varchar2(4000),
    
    constraint PK_SUPORTE primary key (USUARIO, DATA_HORA),
    constraint FK_SUPORTE_USUARIO foreign key (USUARIO) references USUARIO(ID)
);

create table CURSA(
    
    --Atributos
    USUARIO number,
    CURSO number,
    PROGRESSO varchar2(13) not null,
    AVALIACAO number(1),
    COMENTARIO varchar2(180),
    ANOTACOES_PESSOAIS varchar2(1000),
    
    --Contraints básicas
    constraint PK_CURSA primary key(USUARIO, CURSO),
    constraint FK_CURSA_USUARIO foreign key(USUARIO) references USUARIO,
    constraint FK_CURSA_CURSO foreign key(CURSO) references CURSO,
    
    --Constraint de checagens
    constraint CK_PROGRESSO check (PROGRESSO = 'PLANEJADO' OR PROGRESSO = 'EM ANDAMENTO' OR PROGRESSO = 'CONCLUIDO' OR PROGRESSO = 'ABANDONADO'),
    constraint CK_AVALIACAO check (AVALIACAO >= 0 AND AVALIACAO <= 5)
    
);

commit;
