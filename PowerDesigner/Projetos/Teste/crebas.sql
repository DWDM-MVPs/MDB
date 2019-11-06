/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     30-09-2019 16:35:46                          */
/*==============================================================*/


drop index ALUNOS_PK;

drop table ALUNOS;

drop index DISCIPLINAS_PK;

drop table DISCIPLINAS;

drop index TEM2_FK;

drop index TEM_FK;

drop index TEM_PK;

drop table TEM;

/*==============================================================*/
/* Table: ALUNOS                                                */
/*==============================================================*/
create table ALUNOS (
   NUMERO               INT4                 not null,
   DATA_NASCIMENTO      DATE                 null,
   ANO_INCRICAO         INT4                 null,
   NOME_ALUNO           VARCHAR(100)         null,
   constraint PK_ALUNOS primary key (NUMERO)
);

/*==============================================================*/
/* Index: ALUNOS_PK                                             */
/*==============================================================*/
create unique index ALUNOS_PK on ALUNOS (
NUMERO
);

/*==============================================================*/
/* Table: DISCIPLINAS                                           */
/*==============================================================*/
create table DISCIPLINAS (
   ID                   INT4                 not null,
   NOME_DISCIPLINA      VARCHAR(250)         null,
   DESCRICAO            VARCHAR(100)         null,
   SEMESTRE             VARCHAR(30)          null,
   constraint PK_DISCIPLINAS primary key (ID)
);

/*==============================================================*/
/* Index: DISCIPLINAS_PK                                        */
/*==============================================================*/
create unique index DISCIPLINAS_PK on DISCIPLINAS (
ID
);

/*==============================================================*/
/* Table: TEM                                                   */
/*==============================================================*/
create table TEM (
   NUMERO               INT4                 not null,
   ID                   INT4                 not null,
   constraint PK_TEM primary key (NUMERO, ID)
);

/*==============================================================*/
/* Index: TEM_PK                                                */
/*==============================================================*/
create unique index TEM_PK on TEM (
NUMERO,
ID
);

/*==============================================================*/
/* Index: TEM_FK                                                */
/*==============================================================*/
create  index TEM_FK on TEM (
NUMERO
);

/*==============================================================*/
/* Index: TEM2_FK                                               */
/*==============================================================*/
create  index TEM2_FK on TEM (
ID
);

alter table TEM
   add constraint FK_TEM_TEM_ALUNOS foreign key (NUMERO)
      references ALUNOS (NUMERO)
      on delete restrict on update restrict;

alter table TEM
   add constraint FK_TEM_TEM2_DISCIPLI foreign key (ID)
      references DISCIPLINAS (ID)
      on delete restrict on update restrict;

