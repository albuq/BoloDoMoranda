-- Database Section
-- ________________ 

--create database BoloDoMoranda;
--drop schema public cascade;
--create schema public;

-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table BOLO (
     ID_bolo SERIAL not null,
     Nome varchar(100) not null,
     Sabor varchar(50) not null,
     Mensagem varchar(50),
     Descricao varchar(300),
     Ingredientes varchar(500) not null,
     Imagem varchar(200)[] not null,
     preço_kg money not null,
     primary key (ID_bolo));

create table BOLO_FESTA (
     ID_bolo SERIAL not null,
     primary key (ID_bolo));

create table BOLO_TRADICIONAL (
     ID_bolo SERIAL not null,
     primary key (ID_bolo));

create table CLIENTE (
     CPF numeric(11) not null,
     Nome varchar(100) not null,
     Telefone numeric(10) not null,
     Email varchar(100) not null,
     Username varchar(50) not null,
     Senha varchar(20) not null,
     ID_END integer,
     primary key (CPF, username));

create table realiza(
     CPF bigint not null,
     Data_Cadastro date not null,
     ID_venda int not null,
     primary key(CPF));

create table ENDERECO (
     ID_END SERIAL not null,
     Logradouro varchar(100) not null,
     Numero integer not null,
     Complemento varchar(20),
     Bairro varchar(30) not null,
     Cidade varchar(50) not null,
     Estado varchar(20) not null,
     Pais varchar(30) not null,
     CEP numeric(8) not null,
     primary key (ID_END));

create table INFO_NUTRICIONAIS (
     ID_bolo integer not null,
     valor_energetico integer not null,
     carboidratos integer not null,
     proteinas integer not null,
     gorduras_totais integer not null,
     gorduras_saturadas integer not null,
     gorduras_trans integer not null,
     fibra_alimentar integer not null,
     sodio integer not null,
     primary key (ID_bolo));

create table REF_INFO_NUTRICIONAIS (
     valor_energetico integer not null,
     carboidratos integer not null,
     proteinas integer not null,
     gorduras_totais integer not null,
     gorduras_saturadas integer not null,
     fibra_alimentar integer not null,
     sodio integer not null);

create table PGTO_BOLETO (
     ID_pgto SERIAL not null,
     Data_Vencimento date not null,
     Numero_Boleto bigint not null,
     primary key (ID_pgto));

create table avalia (
     ID_bolo integer not null,
     CPF bigint not null,
     Nota numeric not null,
     Comentario varchar(140),
     primary key (ID_bolo, CPF));

create table FORMA_PGTO (
     ID_pgto SERIAL not null,
     ID_venda integer not null,
     primary key (ID_pgto),
     unique (ID_venda));


create table constitue (
     ID_bolo integer not null,
     ID_venda integer not null,
     porcao numeric not null,
     primary key (ID_bolo, ID_venda));

CREATE TYPE periodo_entrega AS ENUM ('manha', 'tarde', 'noite');

create table entrega (
     ID_ent SERIAL not null,
     ID_END integer not null,
     Age_Data_Agendada date not null,
     Age_Periodo_Agendado periodo_entrega not null,
     ID_venda integer not null,
     primary key (ID_ent),
     unique (ID_END));

create table PGTO_CARTAO (
     ID_pgto integer not null,
     Numero_Cartao numeric(16) not null,
     Nome_Titular varchar(100) not null,
     Cod_Seguranca numeric(4) not null,
     Val_Mes_Validade integer not null, --integer pq date seria desnecessario
     Val_Ano_Validade integer not null,
     Par_Qtd_Parcela integer not null,
     Par_Valor_Parcela money not null,
     primary key (ID_pgto));


create table VENDA (
     ID_venda SERIAL not null,
     Data_Confirmacao date,
     Valor_Total money not null,
     Pgto_Conf boolean not null,
     Empacotamento_Conf boolean not null,
     Despache_Conf boolean not null,
     Entrega_Conf boolean not null,
     primary key (ID_venda));


-- Index Section
-- _____________ 

create unique index ID_avalia_IND
     on avalia (ID_bolo, CPF);

create index REF_avali_CLIEN_IND
     on avalia (CPF);

create unique index ID_BOLO_IND
     on BOLO (ID_bolo);

create unique index ID_BOLO__BOLO_1_IND
     on BOLO_FESTA (ID_bolo);

create unique index ID_BOLO__BOLO_IND
     on BOLO_TRADICIONAL (ID_bolo);

create unique index ID_CLIENTE_IND
     on CLIENTE (CPF);

create unique index SID_CLIENTE_IND
     on CLIENTE (Username);

create index EQU_CLIEN_ENDER_IND
     on CLIENTE (ID_END);

create unique index ID_constitue_IND
     on constitue (ID_bolo, ID_venda);

create index REF_const_VENDA_IND
     on constitue (ID_venda);

create unique index ID_ENDERECO_IND
     on ENDERECO (ID_END);

create unique index ID_FORMA_PGTO_IND
     on FORMA_PGTO (ID_pgto);

create unique index SID_FORMA_VENDA_IND
     on FORMA_PGTO (ID_venda);

create unique index ID_INFO__compo_IND
     on INFO_NUTRICIONAIS (ID_bolo);

create unique index ID_entrega_IND
     on entrega (ID_ent);

create index REF_entre_VENDA_IND
     on entrega (ID_venda);

create unique index SID_entre_ENDER_IND
     on entrega (ID_END);

create unique index ID_PGTO__FORMA_1_IND
     on PGTO_BOLETO (ID_pgto);

create unique index ID_PGTO__FORMA_IND
     on PGTO_CARTAO (ID_pgto);

create index REF_reali_VENDA_IND
     on realiza (ID_venda);

create unique index ID_reali_CLIEN_IND
     on realiza (CPF);

create unique index ID_VENDA_IND
     on VENDA (ID_venda);

-- Constraints Section
-- ___________________ 


alter table avalia add constraint REF_avali_CLIEN_FK
     foreign key (CPF)
     references CLIENTE(CPF);

alter table avalia add constraint REF_avali_BOLO
     foreign key (ID_bolo)
     references BOLO;

alter table BOLO_FESTA add constraint ID_BOLO__BOLO_3_FK
     foreign key (ID_bolo)
     references BOLO;

alter table BOLO_TRADICIONAL add constraint ID_BOLO__BOLO_FK
     foreign key (ID_bolo)
     references BOLO; 

alter table CLIENTE add constraint EQU_CLIEN_ENDER_FK
     foreign key (ID_END)
     references ENDERECO;


alter table constitue add constraint REF_const_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table constitue add constraint EQU_const_BOLO
     foreign key (ID_bolo)
     references BOLO;

alter table FORMA_PGTO add constraint SID_FORMA_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table entrega add constraint REF_entre_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table entrega add constraint SID_entre_ENDER_FK
     foreign key (ID_END)
     references ENDERECO;

alter table PGTO_BOLETO add constraint ID_PGTO__FORMA_1_FK
     foreign key (ID_pgto)
     references FORMA_PGTO;

alter table PGTO_CARTAO add constraint ID_PGTO__FORMA_FK
     foreign key (ID_pgto)
     references FORMA_PGTO;

alter table realiza add constraint REF_reali_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table realiza add constraint ID_reali_CLIEN_FK
     foreign key (CPF)
     references CLIENTE(CPF);



