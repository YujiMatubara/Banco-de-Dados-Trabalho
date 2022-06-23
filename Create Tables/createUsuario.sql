create table USUARIO (
    
    --Atributos
    ID number generated always as identity,
    EMAIL varchar2(255) not null,
    NOME varchar2(100) not null,
    NIVEL_DE_PRIVILEGIO char default '0' not null,
    NIVEL_DE_CONQUISTA number(4) default 0 not null,
    
    --Constraints básicas
    constraint EMAIL_UNIQUE unique(EMAIL),
    constraint PK_USUARIO primary key(ID),
    
    --Constraints de checagem
    constraint NIVEL_PRIV_CONSTRAINT check (NIVEL_DE_PRIVILEGIO in ('1', '0'))
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
    constraint FK_CURSO foreign key(TEMA, SUB_TEMA) references ASSUNTO(TEMA, SUB_TEMA),
    
    --Constraints de checagem
    constraint CK_NRO_AULAS check(NRO_AULAS > 0),
    constraint CK_PRECO check(PRECO >= 0)
);

CREATE TABLE ASSUNTO (
    TEMA VARCHAR2(50),
    SUB_TEMA VARCHAR2(50),
    
    CONSTRAINT PK_ASSUNTO PRIMARY KEY (TEMA, SUB_TEMA),
    CONSTRAINT CK_ASSUNTO CHECK (TEMA <> SUB_TEMA)
);

CREATE TABLE CONQUISTAS (
   
    --Atributos
    NOME VARCHAR2(30),
    NIVEL VARCHAR2(8),
    
    --Contraints básicas
    CONSTRAINT PK_CONQUISTAS PRIMARY KEY (NOME),
    
    --Constraints de checagem
    CONSTRAINT CK_NIVEL_CONQUISTA CHECK (UPPER(NIVEL) IN ('BRONZE', 'PRATA', 'OURO', 'PLATINA', 'DIAMANTE'))
);

CREATE TABLE CONQUISTA_REQUISITO (
    
    --Atributos
    NOME VARCHAR2(30),
    DESCRICAO_REQUISITO VARCHAR2(500),
    
    --Contraints básicas
    CONSTRAINT PK_CONQUISTA_REQUISITO PRIMARY KEY (NOME, DESCRICAO_REQUISITO),
    CONSTRAINT FK_NOME_CONQUISTA_REQUISITO FOREIGN KEY (NOME) REFERENCES CONQUISTAS (NOME) ON DELETE CASCADE
); 

-- on delete cascade pq não faz sentido desbloquear uma conquista sem um usuário ou conquista específica associado a ela
 CREATE TABLE DESBLOQUEIA_CONQUISTA (
    
     --Atributos
     NOME_CONQUISTA VARCHAR2(30),
    USUARIO NUMBER,
    
    --Constraints básicas
    CONSTRAINT PK_DESBLOQUEIA_CONQUISTA PRIMARY KEY (NOME_CONQUISTA, USUARIO),
    CONSTRAINT FK_NOME_CONQUISTA_DESBLOQUEIA_CONQUISTA FOREIGN KEY (NOME_CONQUISTA) REFERENCES CONQUISTAS (NOME) ON DELETE CASCADE,
    CONSTRAINT FK_USUARIO_DESBLOQUEIA_CONQUISTA FOREIGN KEY (USUARIO) REFERENCES USUARIO (ID) ON DELETE CASCADE
 );
 
  CREATE TABLE ATUALIZA_PALESTRANTE (
      
    --Atributos
    CURADOR NUMBER,
    PALESTRANTE NUMBER, 
    DATA_HORA_ATUALIZACAO DATE,
    
    --Constraints básicas  
    CONSTRAINT PK_ATUALIZA_PALESTRANTE PRIMARY KEY (CURADOR, PALESTRANTE, DATA_HORA_ATUALIZACAO),
    CONSTRAINT FK_CURADOR_ATUALIZA_PALESTRANTE FOREIGN KEY (CURADOR) REFERENCES CURADOR (ID),
    CONSTRAINT FK_PALESTRANTE_ATUALIZA_PALESTRANTE FOREIGN KEY (PALESTRANTE) REFERENCES PALESTRANTE (ID)
 );

create table CURSO_MIDIA (
    
    --Atributos
    CURSO number,
    MIDIA varchar2(64),
    
    --Constraints básicas
    constraint PK_CURSO_MIDIA primary key (CURSO, MIDIA),
    constraint FK_CURSO_MIDIA foreign key (CURSO) references CURSO(ID)
        on delete cascade
);

create table CURSO_LINK (
    
    --Atributos
    CURSO number,
    URL varchar2(2048),
    PLATAFORMA varchar2(50) not null,
    
    --Constraints básicas
    constraint PK_CURSO_LINK primary key (CURSO, URL),
    constraint FK_CURSO_LINK foreign key (CURSO) references CURSO(ID)
        on delete cascade,
    constraint UNIQUE_CURSO_LINK_URL unique(URL)
);

create table AMIZADE (
    
    --Atributos
    USUARIO number,
    AMIGO number,
    DATA_INICIO_AMIZADE date default sysdate not null,
    
    --Constraints básicas
    constraint PK_AMIZADE primary key(USUARIO, AMIGO),
    constraint FK_AMIZADE_USUARIO foreign key (USUARIO) references USUARIO(ID)
        on delete cascade,
    constraint FK_AMIZADE_AMIGO foreign key (AMIGO) references USUARIO(ID)
        on delete cascade
);

create table SUPORTE (
    
    --Atributos
    USUARIO number,
    DATA_HORA date,
    MENSAGEM varchar2(4000) not null,
    RESPOSTA varchar2(4000),
    
    --Constraints básicas
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
    
    --Constraints básicas
    constraint PK_CURSA primary key(USUARIO, CURSO),
    constraint FK_CURSA_USUARIO foreign key(USUARIO) references USUARIO,
    constraint FK_CURSA_CURSO foreign key(CURSO) references CURSO,
    
    --Constraint de checagens
    constraint CK_PROGRESSO check (PROGRESSO = 'PLANEJADO' OR PROGRESSO = 'EM ANDAMENTO' OR PROGRESSO = 'CONCLUIDO' OR PROGRESSO = 'ABANDONADO'),
    constraint CK_AVALIACAO check (AVALIACAO >= 0 AND AVALIACAO <= 5)
    
);

create table PALESTRANTE (
    
    --Atributos
    ID number generated always as identity,
    NOME varchar2(100) not null,
    
    --Constraints básicas
    constraint PK_PALESTRANTE primary key(ID)
);

create table PALESTRANTE_ESPECIALIZACAO (
    PALESTRANTE number,
    ESPECIALIZACAO varchar2(50),
    
    --Constraints básicas
    constraint PK_PALESTRANTE_ESPECIALIZACAO primary key(PALESTRANTE, ESPECIALIZACAO),
    constraint FK_PALESTRANTE_ESPECIALIZACAO foreign key(PALESTRANTE) references PALESTRANTE(ID)
);

create table MINISTRA(
    
    --Atributos
    CURSO number,
    PALESTRANTE number,
    
    --Constraints básicas
    constraint PK_MINISTRA primary key(CURSO, PALESTRANTE),
    constraint FK_MINISTRA_CURSO foreign key(CURSO) references CURSO,
    constraint FK_MINISTRA_PALESTRANTE foreign key(PALESTRANTE) references PALESTRANTE

);

create table CURADOR(
    
    --Atributos
    ID number,
    
    --Constraints básicas
    constraint PK_CURADOR primary key(ID),
    constraint FK_CURADOR foreign key(ID) references USUARIO
)

create table ATUALIZA_CURSO(

    --Atributos
    CURADOR number,
    CURSO number,
    DATA_HORA_ATUALIZACAO date,
    
    --Contraints básicas
    constraint PK_ATUALIZA_CURSO primary key(CURADOR, CURSO, DATA_HORA_ATUALIZACAO)
);

create table QUIZ (
    ID number generated always as identity,
    NIVEL varchar2(8),
    TEMA varchar2(50),
    SUB_TEMA varchar2(50),
        
    constraint PK_QUIZ primary key (ID),
    constraint SK_QUIZ unique(NIVEL, TEMA, SUB_TEMA),
    constraint FK_QUIZ_ASSUNTO foreign key (TEMA, SUB_TEMA) references ASSUNTO(TEMA, SUB_TEMA),

    constraint CK_NIVEL_QUIZ check (NIVEL in ('BRONZE', 'PRATA', 'OURO', 'PLATINA', 'DIAMANTE'))
);

create table THREAD (
    ID number generated always as identity,
    TITULO varchar2(100) not null,
    CURSO number not null,
    ASSUNTO varchar2(4000) not null,
    USUARIO number not null,
    
    --Contraint básicas
    constraint PK_THREAD primary key(ID),
    constraint SK_THREAD unique(TITULO, CURSO),
    constraint FK_THREAD_CURSO foreign key(CURSO) references CURSO(ID) ON DELETE CASCADE,
    constraint FK_THREAD_USUARIO foreign key(USUARIO) references USUARIO(ID)
);

insert into USUARIO (EMAIL, NOME) values (
    'teste@gmail.com',
    'Teste Da Silva'
);

insert into PALESTRANTE (NOME) values (
    'El Teste Madrigal'
);

commit;
