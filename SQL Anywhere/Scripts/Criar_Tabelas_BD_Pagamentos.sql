create table CONDI��ESPAGAMENTO
(
   IDCONDI��O           INTEGER                         constraint PK_CONDI��ESPAGAMENTO primary key,
   DESCRI��O            VARCHAR(50)                    not null,
   PRAZOPAGAMENTO       integer                        not null
)

create table CONTASBALAN�O
(
   N�MEROCONTA          INTEGER                         constraint PK_CONTASBALAN�O primary key,
   DESCRI��O            VARCHAR(50)                    not null
)

create table FORNECEDORES
(
   IDFORNECEDOR         INTEGER                         constraint PK_FORNECEDORES primary key,
   NOME                 VARCHAR(50)                    not null,
   ENDERE�O             VARCHAR(50),
   LOCALIDADE           VARCHAR(50)                    not null,
   C�DIGOPOSTAL         VARCHAR(20)                    not null,
   TELEFONE             VARCHAR(50),
   PNONECONTACTO        VARCHAR(50),
   �NOMECONTACTO        VARCHAR(50),
   CONDI��OPAGAMENTOPREDEFINIDA INTEGER                not null constraint FK_FORNECED_CONDI��ES references CONDI��ESPAGAMENTO (IDCONDI��O),
   CONTABALAN�OPREDEFINIDA INTEGER                     not null constraint FK_FORNECED_CONTASBALAN�O references CONTASBALAN�O (N�MEROCONTA)
)

create table FACTURAS  
(
   IDFACTURA            INTEGER                         constraint PK_FACTURAS primary key,
   IDFORNECEDOR         INTEGER                         constraint FK_FACTURAS_FK_FACTUR_FORNECED references FORNECEDORES (IDFORNECEDOR),
   N�MEROFACTURA        VARCHAR(50)                    not null,
   DATAFACTURA          DATE                            not null,
   TOTALFACTURA         decimal (8,2)                     not null,
   PAGAMENTO            decimal (8,2)                     not null,
   CR�DITO              decimal(8,2)                     not null,
   CONDI��OPAGAMENTO    INTEGER                         not null,
   DATAVENCIMENTOFACTURA DATE                           not null,
   DATAPAGAMENTO        DATE
)

create table ITENSFACTURA
(
   IDFACTURA            INTEGER                         not null,
   SEQUENCIAITEM        integer                        not null,
   CONTABALAN�O         INTEGER                         not null,
   MONTANTEITEM         decimal(8,2)                     not null,
   DESCRI��OITEM        VARCHAR(100)                   not null,
   constraint PK_ITENSFACTURA primary key (IDFACTURA, SEQUENCIAITEM),
   constraint FK_ITENSFAC_FACTURAS foreign key (IDFACTURA) references FACTURAS (IDFACTURA),
   constraint FK_ITENSFAC_CONTASBALAN�O foreign key (CONTABALAN�O) references CONTASBALAN�O (N�MEROCONTA)
)
