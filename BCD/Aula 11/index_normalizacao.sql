-- Active: 1788351693696@@127.0.0.1@3306@smartcoffee_normalizado_anna
create database smartcoffee_normalizado_anna;

use smartcoffee_normalizado_anna;

--Tabela errada

create table pedido (
    id_pedido int primary key,
    data_pedido datetime,
    cliente_nome varchar (100),
    cliente_email varchar (120),
    cliente_cidade varchar (80),
    produto1 varchar (100),
    produto2 varchar (100),
    produto3 varchar (100),
    categoria1 varchar(80),
    categoria2 varchar(80),
    categoria3 varchar(80),
    quantidade1 int,
    quantidade2 int,
    quantidade3 int
);
-- Estrutura coreta para o bd_smartcoffee
create table cliente (
    id_cliente int auto_increment,
    email varchar(120) not null unique,
    cidade varchar(80) not null,
    constraint pk_cliente primary key (id_cliente),
    constraint uq_email unique (email)
);


create table categoria (
    id_categoria int auto_increment,
    nome varchar(80) not null unique,
    constraint pk_categoria primary key (id_categoria),
    constraint uq_nome unique(nome)
);


create table produto (
    id_produto int auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    id_categoria int not null,
    constraint pk_produto primary key (id_produto),
    constraint fk_categoria_produto foreign key (id_categoria) references categoria (id_categoria)
);


create table pedido (
    id_pedido int auto_increment,
    data_pedido datetime not null,
    id_cliente int not null,
    constraint pk_pedido primary key (id_pedido),
    constraint pk_cliente_pedido foreign key (id_cliente) references cliente (id_cliente)
);

create table item_pedido (
    id_item int auto_increment,
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null check (quantidade > 0),
    preco_unitario decimal (10,2) not null,
    constraint pk_item_pedido primary key (id_item),
    constraint fk_pedido_itemp foreign key (id_pedido) references pedido (id_pedido),
    constraint fk_produto_itemp foreign key (id_produto) references produto (id_produto)
);

create table fornecedor (
    id_fornecedor int auto_increment,
    nome varchar(100) not null,
    telefone varchar(20),
    constraint pk_fornecedor primary key (id_fornecedor)
);

create table fornecedor_produto (
    id_fprod int AUTO_INCREMENT,
    id_fornecedor int not null,
    id_produto int not null,
    preco_compra decimal (10,2) not null,
    prazo_entrega_dias int,
    constraint pk_fornecedor_produto primary key (id_fprod),
    constraint fk_fornecedor_produto foreign key (id_fornecedor) references fornecedor (id_fornecedor),
    constraint fk_produto_produto foreign key (id_produto) REFERENCES produto (id_produto)
);

drop table fornecedor_produto;

drop table pedido;

-- Fim da estrutura correta do db
--------------------------------------------------------------------------------

-- obs:
-- estrutura de normalização 1fn
-- foi identificado nos grupos repetidos como produto1, produto2 e produto3
-- a 1fn faz sentido por que um pedido pode possuirqualquer quantidade sem criar novas colunas
-- foi gerado as tabelas pedido e item_pedido para essa normalização

-- estrutura de normalização 2fn
-- os dados do cliente não pertecem ao pedido. eles descrevem o cliente. o nome da categoria também não deve ser repetido em cada produto
-- separação das tabelas cliente, produto e categoria que involve chave primárias ou chave compostas
-- em uma chave composta os atributos comuns deve depender da chave primária ou inteira

-- estrutura de normalização 3fn
-- nome_categoria que depende de id_categoria. portanto, deve estar em uma tabela
-- utilizam dependencias ou criam dependencias

-- resumo:
-- 1fn resolve grupos repetitivos 
-- 2fn remove dependencias parciais de cahves compostas
-- 3fn remove dependencias indevidas entre atibutos não-chave primárias
-- fim fo resumo de normalização
---------------------------------------
-- indexação ou index para consultas reais
-- nossas pesquisas ou consultas possam ver mais rapidas e dinamicas
-- ex a: consultar produto por nome

select * from produto
where nome = 'cappucciono';

-- criacao do index na tabela

create index isx_produto_nome on(nome);

--visualizar a criaçaõ do index
show index from produto;

-- ex b: pedidos de um cliente por data_pedido
select * from pedido
where id_cliente = 5 and data_pedido >= '2026-10-01'
order by data_pedido desc;

create index idx_pedido_cliente_data on pedido (id_cliente, data_pedido);

-- ex c: consultar itens de um pedido data_pedido
select * from item_pedido
where id_pedido = 20;

create index idx_item_pedido on pedido;
 drop index from pedido;

-- explain utilizar para buscar informações extras sobre o conteúdo de campos

explain select * from pedido
where id_cliente = 5 and data_pedido >= '2026-10-01';

-- obs final: 
-- index não corrige tabela errada 
-- modelo errado + index = modelo errado mais rápido
-- modelo correto + index justificado = estrutura consiste e acesso eficiente


insert into pedido values (1, now(),'Anna A', 'anna@email.com',
'Sao Paulo', 'Chocolate quente', 'Barca de Carne',null, 'capuccino', 'Salgado',null,1,2,null);

select * from fornecedor_produto;

--drop table pedido

create table fornecedor_produto (
    id_fornecedor int,
    id_produto int,
    nome_fornecedor varchar (100),
    telefone_fornecedor varchar(20),
    nome_produto varchar (100),
    preco_atual_produto decimal (10,2),
    preco_compra decimal(10,2),
    prazo_entrega_dias int,
    primary key (id_fornecedor, id_produto)
);

insert into fornecedor_produto values (1,1, 'Cafeteria da Nata de Sp', '1123456789','Chocolate quente', 9.00,4.10,2);