create database if not exists castello_relacionamentos_ta;
use castello_relacionamentos_ta;

create table cliente (
    id_cliente int auto_increment primary key,
    nome_cliente varchar(100) not null
);

create table pedido (
    id_pedido int auto_increment primary key,
    id_cliente int not null,
    data_pedido date not null,
    valor_total decimal(10,2) not null,
    foreign key (id_cliente) references clientes(id_cliente)
);

create table estoque (
    id_estoque int auto_increment primary key,
    id_produto int not null unique,
    quantidade int not null,
    foreign key (id_produto) references produtos(id_produto)
);

create table produtos (
    id_produto int auto_increment primary key,
    nome_produto varchar(100) not null,
    preco decimal(10,2) not null
);

select * from estoque;
select * from produtos;

insert into produtos (nome_produto, preco) VALUES
('produto A', 10.00),
('produto B', 20.00),
('produto C', 30.00);

--desafios cardinalidades
--questão 1
--categoria  possui    produto
--1,1                    1,n

--questão 2
--funcionario  registra    pedidos
--1,1                        1,n

--questão 3
--fornecedor  comercializa    produtos
--1,n                          --1,n

--questão 4
--cliente      reservsa    mesa
--1,1                       0,n

--questão 5
--pedido     possui    itens
--1,n                    1,1
