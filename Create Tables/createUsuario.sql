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
    
    constraint PK_CURSO primary key(ID),
    constraint SK_CURSO unique(TITULO, DATA_LANCAMENTO),
    constraint FK_CURSO foreign key(TEMA, SUB_TEMA) references ASSUNTO
);

insert into USUARIO (EMAIL, NOME) values (
    'teste@gmail.com',
    'Teste Da Silva'
);

commit
