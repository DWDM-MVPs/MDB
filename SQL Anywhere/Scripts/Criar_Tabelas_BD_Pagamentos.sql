create table CONDIÇÕESPAGAMENTO
(
   IDCONDIÇÃO           INTEGER                         constraint PK_CONDIÇÕESPAGAMENTO primary key,
   DESCRIÇÃO            VARCHAR(50)                    not null,
   PRAZOPAGAMENTO       integer                        not null
)

create table CONTASBALANÇO
(
   NÚMEROCONTA          INTEGER                         constraint PK_CONTASBALANÇO primary key,
   DESCRIÇÃO            VARCHAR(50)                    not null
)

create table FORNECEDORES
(
   IDFORNECEDOR         INTEGER                         constraint PK_FORNECEDORES primary key,
   NOME                 VARCHAR(50)                    not null,
   ENDEREÇO             VARCHAR(50),
   LOCALIDADE           VARCHAR(50)                    not null,
   CÓDIGOPOSTAL         VARCHAR(20)                    not null,
   TELEFONE             VARCHAR(50),
   PNONECONTACTO        VARCHAR(50),
   ÚNOMECONTACTO        VARCHAR(50),
   CONDIÇÃOPAGAMENTOPREDEFINIDA INTEGER                not null constraint FK_FORNECED_CONDIÇÕES references CONDIÇÕESPAGAMENTO (IDCONDIÇÃO),
   CONTABALANÇOPREDEFINIDA INTEGER                     not null constraint FK_FORNECED_CONTASBALANÇO references CONTASBALANÇO (NÚMEROCONTA)
)

create table FACTURAS  
(
   IDFACTURA            INTEGER                         constraint PK_FACTURAS primary key,
   IDFORNECEDOR         INTEGER                         constraint FK_FACTURAS_FK_FACTUR_FORNECED references FORNECEDORES (IDFORNECEDOR),
   NÚMEROFACTURA        VARCHAR(50)                    not null,
   DATAFACTURA          DATE                            not null,
   TOTALFACTURA         decimal (8,2)                     not null,
   PAGAMENTO            decimal (8,2)                     not null,
   CRÉDITO              decimal(8,2)                     not null,
   CONDIÇÃOPAGAMENTO    INTEGER                         not null,
   DATAVENCIMENTOFACTURA DATE                           not null,
   DATAPAGAMENTO        DATE
)

create table ITENSFACTURA
(
   IDFACTURA            INTEGER                         not null,
   SEQUENCIAITEM        integer                        not null,
   CONTABALANÇO         INTEGER                         not null,
   MONTANTEITEM         decimal(8,2)                     not null,
   DESCRIÇÃOITEM        VARCHAR(100)                   not null,
   constraint PK_ITENSFACTURA primary key (IDFACTURA, SEQUENCIAITEM),
   constraint FK_ITENSFAC_FACTURAS foreign key (IDFACTURA) references FACTURAS (IDFACTURA),
   constraint FK_ITENSFAC_CONTASBALANÇO foreign key (CONTABALANÇO) references CONTASBALANÇO (NÚMEROCONTA)
)
