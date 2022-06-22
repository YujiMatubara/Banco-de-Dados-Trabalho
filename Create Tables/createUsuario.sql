create table USUARIO (
    EMAIL varchar2(255),
    NOME varchar2(100),
    NIVEL_DE_PRIVILEGIO char default '0' not null,
    constraint NIVEL_PRIV_CONSTRAINT check (NIVEL_DE_PRIVILEGIO in ('1', '0'))

);