-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Clientes (
id_cliente int primary key auto_increment PRIMARY KEY,
nome_cliente varchar(60)
)

CREATE TABLE Pedidos (
id_pedidos int primary key auto_increment PRIMARY KEY,
quantidade int not null,
id_cliente int primary key auto_increment,
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
)

CREATE TABLE Produtos+Estoques (
id_produtos int primary key auto_increment,
nome_produto varchar(100),
id_estoque int primary key auto_increment,
valor decimal 10,2,
PRIMARY KEY(id_produtos,id_estoque)
)

CREATE TABLE fornecedor (
id_fornecedor int primary key auto_increment PRIMARY KEY,
razao social varchar(100)
)

CREATE TABLE produto (
id_produto int primary key auto_increment PRIMARY KEY,
nome_produto varchar(100)
)

CREATE TABLE item_produto (
id_produto int,
id_fornecedor int,
Campo_1 int auto_increment primary key PRIMARY KEY,
Campo_2 Número(4)
)

