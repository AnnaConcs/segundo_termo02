-- Active: 1788351693696@@127.0.0.1@3306@smartcoffe_dml_anna
-- SmartCoffe base de dados - dml
-- execute sempre que quiser restaurar a aula

drop database if exists SmartCoffe_dml_anna;
create database SmartCoffe_dml_anna;
use SmartCoffe_dml_anna;

create table cliente (
    id_cliente int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(120) unique,
    telefone varchar(20),
    cidade varchar(60) not null,
    ativo boolean not null default true
);

create table categoria (
    id_categoria int primary key auto_increment,
    nome varchar(60) not null unique
);

create table produto(
    id_produto int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    ativo boolean not null default true,
    id_categoria int not null,
    constraint fk_produto_categoria foreign key (id_categoria) references categoria(id_categoria)
);

create table pedido (
    id_pedido int primary key auto_increment,
    data_pedido datetime not null,
    status enum('ABERTO','PREPARANDO','FINALIZANDO','CANCELADO') not null,
    valor_total decimal(10,2) not null default 0.00,
    id_cliente int not null,
    constraint fk_pedido_cliente foreign key (id_cliente) references cliente(id_cliente)
);

create table item_pedido(
    id_item int primary key auto_increment,
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null,
    preco_unitario decimal(10,2) not null,
    observacao varchar(150),
    constraint fk_item_pedido foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_item_produto foreign key (id_produto) references produto(id_produto)
);

create table forma_pagamento (
    id_forma_pagamento int primary key auto_increment,
    descricao varchar(40) not null unique
);

create table pagamento (
    id_pagamento int primary key auto_increment,
    id_pedido int not null,
    id_forma_pagamento int not null,
    valor decimal(10,2) not null,
    data_pagamento datetime,
    constraint fk_pagamento_pedido foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_pagamento_forma foreign key (id_forma_pagamento) references forma_pagamento(id_forma_pagamento)
);

-- DADOS INICIAIS 
insert into cliente (nome, email, telefone, cidade, ativo) VALUES
('Anna', 'concolato@gmail.com', '1999999999', 'Limeira', TRUE),
('Bia', 'santana@gmail.com', '1999999889', 'Piracicaba', TRUE),
('Heitor', 'oliveira@gmail.com', '1999977799', 'Campinas', TRUE),
('Vanessa', 'familia@gmail.com', '1999966699', 'Sumare', TRUE),
('Luiz', 'voltaarodar@gmail.com', '1999955599', 'Sao Paulo', TRUE),
('Olga', 'matriarca@gmail.com', '1999944499', 'Araras', TRUE),
('Manoel', 'patriarca@gmail.com', '1999933399', 'Minas Gerais', TRUE),
('Lorena', 'advogada@gmail.com', '1999922299', 'Mogi Guacu', TRUE),
('Arthur', 'lutador@gmail.com', '1999911199', 'Mogi Mirim', TRUE),
('Gabby', 'estrangeira@gmail.com', '1999900099', 'Mogi das Cruzes', TRUE);

insert into categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Doces'), ('Salgados'), ('Combos');


-- select * from cliente;

insert into produto (nome, preco, ativo, id_categoria) VALUES
('Café Duplo', 10.00, true, 1),
('Café com Leite', 9.50, true, 1), ('Cappucino', 13.00, true, 1),
('Mocha Chocolate', 15.50, true, 1), ('Cold Brew', 14.00, true, 2),
('Frappé de Chocolate', 18.00, true, 2), ('Suco de Laranja', 11.00, true, 2),
('Brownie', 9.00, true, 3), ('Cheesecake', 14.50, true, 3),
('Cookie de Chocolate', 7.50, true, 3), ('Pão de Quijo', 6.50, true, 4),
('Croissant', 12.00, true, 4), ('Sanduíche Natural', 16.00, true, 4),
('Combo Café + Pão de Queijo', 12.50, true, 5),
('Combo Cappucino + Brownie', 20.00, true, 5), ('Torta Especial', 22.00, true, 3);

insert into pedido (data_pedido, status, valor_total, id_cliente) VALUES
('2026-09-01 08:15:00', 'ABERTO', 16.00, 1),
('2026-10-02 08:16:00', 'PREPARANDO', 26.00, 2),
('2026-11-03 08:17:00', 'FINALIZANDO', 18.00, 3),
('2026-11-04 08:18:00', 'CANCELADO', 35.50,4),
(NOW(), 'ABERTO', 0.00, 10);

set @pedido = last_insert_id();

select @pedido;

insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1,1,1,7.00,null),(1,9,1,9.00,null),(2,4,2,13.00,'Sem canela'),
(3,7,1,18.00,null),(4,5,1,15.50,null),(4,2,1,20.00,null);

insert into forma_pagamento (descricao) VALUES
('Dinheiro'), ('PIX'), ('Cartão de Crédito'), ('Cartão de Débito');

insert into pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
()
