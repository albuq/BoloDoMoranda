-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 9.2.0              
-- * Generator date: Oct 16 2014              
-- * Generation date: Thu Jun 16 16:41:26 2016 
-- * LUN file: C:\Users\Barbara\Dropbox\9037585\5 sem\IHC\EP\BoloMoranda.lun 
-- * Schema: Relacional/SQL 
-- ********************************************* 


-- Database Section
-- ________________ 

create database Relacional;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table BOLO (
     ID_bolo char(1) not null,
     Nome varchar(100) not null,
     Sabor varchar(50) not null,
     Mensagem char(1) not null,
     Descricao varchar(300) not null,
     Igredientes varchar(500) not null,
     constraint ID_BOLO_ID primary key (ID_bolo));

create table BOLO_PASTA (
     ID_bolo char(1) not null,
     constraint ID_BOLO__BOLO_3_ID primary key (ID_bolo));

create table BOLO_CASAMENTO (
     ID_bolo char(1) not null,
     constraint ID_BOLO__BOLO_2_ID primary key (ID_bolo));

create table BOLO_TRADICIONAL (
     ID_bolo char(1) not null,
     constraint ID_BOLO__BOLO_1_ID primary key (ID_bolo));

create table CLIENTE (
     CPF numeric(11) not null,
     Nome varchar(100) not null,
     Telefone numeric(10) not null,
     Email varchar(100) not null,
     Username varchar(50) not null,
     Senha varchar(20) not null,
     ID_venda numeric(3) not null,
     ID_END numeric(10) not null,
     constraint ID_CLIENTE_ID primary key (CPF));

create table ENDERECO (
     ID_END -- Sequence attribute not implemented -- not null,
     Logradouro varchar(100) not null,
     Numero numeric(2) not null,
     Complemento varchar(20) not null,
     Bairro varchar(30) not null,
     Cidade varchar(50) not null,
     Estado varchar(20) not null,
     Pais varchar(30) not null,
     CEP numeric(8) not null,
     constraint ID_ENDERECO_ID primary key (ID_END));

create table INFO_NUTRICIONAIS (
     ID_bolo char(1) not null,
     constraint ID_INFO__compo_ID primary key (ID_bolo));

create table PGTO_BOLETO (
     ID_pgto numeric(3) not null,
     Data_Vencimento date not null,
     Numero_Boleto numeric(3) not null,
     constraint ID_PGTO__FORMA_1_ID primary key (ID_pgto));

create table avalia (
     ID_bolo char(1) not null,
     CPF numeric(11) not null,
     Nota numeric(2,2) not null,
     Comentario varchar(140) not null,
     constraint ID_avalia_ID primary key (ID_bolo, CPF));

create table FORMA_PGTO (
     ID_pgto numeric(3) not null,
     ID_venda numeric(3) not null,
     constraint ID_FORMA_PGTO_ID primary key (ID_pgto),
     constraint SID_FORMA_VENDA_ID unique (ID_venda));

create table BOLO_CHA (
     ID_bolo char(1) not null,
     constraint ID_BOLO__BOLO_ID primary key (ID_bolo));

create table Carboidratos (
     ID_bolo char(1) not null,
     Carboidratos numeric(2) not null,
     constraint ID_Carboidratos_ID primary key (ID_bolo, Carboidratos));

create table compoe (
     ID_bolo char(1) not null,
     porcao numeric(2,2) not null,
     constraint ID_compo_BOLO_ID primary key (ID_bolo));

create table constitue (
     ID_bolo char(1) not null,
     ID_venda numeric(3) not null,
     porcao numeric(2,2) not null,
     preco numeric(3,2) not null,
     constraint ID_constitue_ID primary key (ID_bolo, ID_venda));

create table entrega (
     ID_ent -- Sequence attribute not implemented -- not null,
     ID_END numeric(10) not null,
     Age_Data_Agendada date not null,
     Age_Periodo_Agendado varchar(5) not null,
     ID_venda numeric(3) not null,
     constraint ID_entrega_ID primary key (ID_ent),
     constraint SID_entre_ENDER_ID unique (ID_END));

create table Fibra_Alimentar (
     ID_bolo char(1) not null,
     Fibra_Alimentar numeric(2) not null,
     constraint ID_Fibra_Alimentar_ID primary key (ID_bolo, Fibra_Alimentar));

create table Gorduras_Saturadas (
     ID_bolo char(1) not null,
     Gorduras_Saturadas numeric(2) not null,
     constraint ID_Gorduras_Saturadas_ID primary key (ID_bolo, Gorduras_Saturadas));

create table Gorduras_Totais (
     ID_bolo char(1) not null,
     Gorduras_Totais numeric(2) not null,
     constraint ID_Gorduras_Totais_ID primary key (ID_bolo, Gorduras_Totais));

create table Gorduras_Trans (
     ID_bolo char(1) not null,
     Gorduras_Trans numeric(2) not null,
     constraint ID_Gorduras_Trans_ID primary key (ID_bolo, Gorduras_Trans));

create table Imagem (
     ID_bolo char(1) not null,
     Imagem varchar(200) not null,
     constraint ID_Imagem_ID primary key (ID_bolo, Imagem));

create table PGTO_CARTAO (
     ID_pgto numeric(3) not null,
     Numero_Cartao numeric(16) not null,
     Nome_Titular varchar(100) not null,
     Cod_Seguranca numeric(4) not null,
     Val_Mes_Validade date not null,
     Val_Ano_Validade date not null,
     Par_Qtd_Parcela numeric(1) not null,
     Par_Valor_Parcela numeric(3,2) not null,
     constraint ID_PGTO__FORMA_ID primary key (ID_pgto));

create table Proteinas (
     ID_bolo char(1) not null,
     Proteinas numeric(2) not null,
     constraint ID_Proteinas_ID primary key (ID_bolo, Proteinas));

create table Sodio (
     ID_bolo char(1) not null,
     Sodio numeric(2) not null,
     constraint ID_Sodio_ID primary key (ID_bolo, Sodio));

create table Valor_Energetico (
     ID_bolo char(1) not null,
     Valor_Energetico numeric(2) not null,
     constraint ID_Valor_Energetico_ID primary key (ID_bolo, Valor_Energetico));

create table VENDA (
     ID_venda numeric(3) not null,
     Data_Cadastro date not null,
     Data_Confirmacao char(1) not null,
     Valor_Total numeric(1) not null,
     Pgto_Conf char not null,
     Empacotamento_Conf char not null,
     Despache_Conf char not null,
     Entrega_Conf char not null,
     constraint ID_VENDA_ID primary key (ID_venda));


-- Constraints Section
-- ___________________ 

alter table BOLO add constraint ID_BOLO_CHK
     check(exists(select * from Imagem
                  where Imagem.ID_bolo = ID_bolo)); 

alter table BOLO add constraint ID_BOLO_CHK
     check(exists(select * from compoe
                  where compoe.ID_bolo = ID_bolo)); 

alter table BOLO add constraint ID_BOLO_CHK
     check(exists(select * from constitue
                  where constitue.ID_bolo = ID_bolo)); 

alter table BOLO_PASTA add constraint ID_BOLO__BOLO_3_FK
     foreign key (ID_bolo)
     references BOLO;

alter table BOLO_CASAMENTO add constraint ID_BOLO__BOLO_2_FK
     foreign key (ID_bolo)
     references BOLO;

alter table BOLO_TRADICIONAL add constraint ID_BOLO__BOLO_1_FK
     foreign key (ID_bolo)
     references BOLO;

alter table CLIENTE add constraint REF_CLIEN_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table CLIENTE add constraint EQU_CLIEN_ENDER_FK
     foreign key (ID_END)
     references ENDERECO;

alter table ENDERECO add constraint ID_ENDERECO_CHK
     check(exists(select * from CLIENTE
                  where CLIENTE.ID_END = ID_END)); 

alter table ENDERECO add constraint ID_ENDERECO_CHK
     check(exists(select * from entrega
                  where entrega.ID_END = ID_END)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Carboidratos
                  where Carboidratos.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Fibra_Alimentar
                  where Fibra_Alimentar.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Gorduras_Trans
                  where Gorduras_Trans.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Gorduras_Totais
                  where Gorduras_Totais.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Gorduras_Saturadas
                  where Gorduras_Saturadas.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Proteinas
                  where Proteinas.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Sodio
                  where Sodio.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_CHK
     check(exists(select * from Valor_Energetico
                  where Valor_Energetico.ID_bolo = ID_bolo)); 

alter table INFO_NUTRICIONAIS add constraint ID_INFO__compo_FK
     foreign key (ID_bolo)
     references compoe;

alter table PGTO_BOLETO add constraint ID_PGTO__FORMA_1_FK
     foreign key (ID_pgto)
     references FORMA_PGTO;

alter table avalia add constraint REF_avali_CLIEN_FK
     foreign key (CPF)
     references CLIENTE;

alter table avalia add constraint REF_avali_BOLO
     foreign key (ID_bolo)
     references BOLO;

alter table FORMA_PGTO add constraint SID_FORMA_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table BOLO_CHA add constraint ID_BOLO__BOLO_FK
     foreign key (ID_bolo)
     references BOLO;

alter table Carboidratos add constraint EQU_Carbo_INFO_
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table compoe add constraint ID_compo_BOLO_CHK
     check(exists(select * from INFO_NUTRICIONAIS
                  where INFO_NUTRICIONAIS.ID_bolo = ID_bolo)); 

alter table compoe add constraint ID_compo_BOLO_FK
     foreign key (ID_bolo)
     references BOLO;

alter table constitue add constraint REF_const_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table constitue add constraint EQU_const_BOLO
     foreign key (ID_bolo)
     references BOLO;

alter table entrega add constraint REF_entre_VENDA_FK
     foreign key (ID_venda)
     references VENDA;

alter table entrega add constraint SID_entre_ENDER_FK
     foreign key (ID_END)
     references ENDERECO;

alter table Fibra_Alimentar add constraint EQU_Fibra_INFO_
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table Gorduras_Saturadas add constraint EQU_Gordu_INFO__2
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table Gorduras_Totais add constraint EQU_Gordu_INFO__1
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table Gorduras_Trans add constraint EQU_Gordu_INFO_
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table Imagem add constraint EQU_Image_BOLO
     foreign key (ID_bolo)
     references BOLO;

alter table PGTO_CARTAO add constraint ID_PGTO__FORMA_FK
     foreign key (ID_pgto)
     references FORMA_PGTO;

alter table Proteinas add constraint EQU_Prote_INFO_
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table Sodio add constraint EQU_Sodio_INFO_
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table Valor_Energetico add constraint EQU_Valor_INFO_
     foreign key (ID_bolo)
     references INFO_NUTRICIONAIS;

alter table VENDA add constraint ID_VENDA_CHK
     check(exists(select * from FORMA_PGTO
                  where FORMA_PGTO.ID_venda = ID_venda)); 


-- Index Section
-- _____________ 

create unique index ID_BOLO_IND
     on BOLO (ID_bolo);

create unique index ID_BOLO__BOLO_3_IND
     on BOLO_PASTA (ID_bolo);

create unique index ID_BOLO__BOLO_2_IND
     on BOLO_CASAMENTO (ID_bolo);

create unique index ID_BOLO__BOLO_1_IND
     on BOLO_TRADICIONAL (ID_bolo);

create unique index ID_CLIENTE_IND
     on CLIENTE (CPF);

create index REF_CLIEN_VENDA_IND
     on CLIENTE (ID_venda);

create index EQU_CLIEN_ENDER_IND
     on CLIENTE (ID_END);

create unique index ID_ENDERECO_IND
     on ENDERECO (ID_END);

create unique index ID_INFO__compo_IND
     on INFO_NUTRICIONAIS (ID_bolo);

create unique index ID_PGTO__FORMA_1_IND
     on PGTO_BOLETO (ID_pgto);

create unique index ID_avalia_IND
     on avalia (ID_bolo, CPF);

create index REF_avali_CLIEN_IND
     on avalia (CPF);

create unique index ID_FORMA_PGTO_IND
     on FORMA_PGTO (ID_pgto);

create unique index SID_FORMA_VENDA_IND
     on FORMA_PGTO (ID_venda);

create unique index ID_BOLO__BOLO_IND
     on BOLO_CHA (ID_bolo);

create unique index ID_Carboidratos_IND
     on Carboidratos (ID_bolo, Carboidratos);

create unique index ID_compo_BOLO_IND
     on compoe (ID_bolo);

create unique index ID_constitue_IND
     on constitue (ID_bolo, ID_venda);

create index REF_const_VENDA_IND
     on constitue (ID_venda);

create unique index ID_entrega_IND
     on entrega (ID_ent);

create index REF_entre_VENDA_IND
     on entrega (ID_venda);

create unique index SID_entre_ENDER_IND
     on entrega (ID_END);

create unique index ID_Fibra_Alimentar_IND
     on Fibra_Alimentar (ID_bolo, Fibra_Alimentar);

create unique index ID_Gorduras_Saturadas_IND
     on Gorduras_Saturadas (ID_bolo, Gorduras_Saturadas);

create unique index ID_Gorduras_Totais_IND
     on Gorduras_Totais (ID_bolo, Gorduras_Totais);

create unique index ID_Gorduras_Trans_IND
     on Gorduras_Trans (ID_bolo, Gorduras_Trans);

create unique index ID_Imagem_IND
     on Imagem (ID_bolo, Imagem);

create unique index ID_PGTO__FORMA_IND
     on PGTO_CARTAO (ID_pgto);

create unique index ID_Proteinas_IND
     on Proteinas (ID_bolo, Proteinas);

create unique index ID_Sodio_IND
     on Sodio (ID_bolo, Sodio);

create unique index ID_Valor_Energetico_IND
     on Valor_Energetico (ID_bolo, Valor_Energetico);

create unique index ID_VENDA_IND
     on VENDA (ID_venda);

