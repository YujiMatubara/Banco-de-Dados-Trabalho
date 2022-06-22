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

insert into USUARIO (EMAIL, NOME) values (
    'teste@gmail.com',
    'Teste Da Silva'
);

commit
