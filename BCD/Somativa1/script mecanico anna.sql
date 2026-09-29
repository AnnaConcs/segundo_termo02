CREATE DATABASE Script_Anna_oficina;
USE Script_Anna_oficina;
CREATE TABLE IF NOT EXISTS clientes (
ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR (14) NOT NULL UNIQUE,
NOME VARCHAR (60) NOT NULL,
NUMERO_TEL VARCHAR (15) NOT NULL,
IDADE varchar (100) not null,
EMAIL VARCHAR (60) NOT NULL
);

create table veiculos (
id_veiculos int auto_increment primary key,
potencia int not null,
valor int not null,
placa varchar (60) not null,
tempo_de_uso int not null,
qualidade varchar (60) not null,
novo varchar (20) not null,
semi_novo varchar (20) not null
);

create table marcas (
id_marcas int auto_increment primary key,
economico varchar (60) not null,
combustivel varchar (60) not null,
cor varchar (10) not null,
gasolina varchar (8) not null,
etanol varchar (6) not null, 
diesel varchar (6) not  null,
alcool varchar (6) not null,
estado_veiculo varchar (20) not null,
novo varchar (20) not null,
semi_novo varchar(20) not null,
velho varchar (20) not null,
ano_de_fabricacao year not null
);

create table modelos (
id_modelos int auto_increment primary key,
tamanho varchar (60) not null,
conforto varchar (60) not null,
pneus varchar (60) not null, 
cor varchar (20) not null,
espaco varchar (60) not null
);

create table funcionarios (
id_funcionarios int auto_increment primary key,
nome varchar (60) not null,
carga_horaria int not null,
cpf varchar (60) not null unique,
salario int not null,
meta int
);


create table servicos (
id_servicos int auto_increment primary key,
data varchar (20) not null,
fim varchar(20) not null, 
inicio varchar(20) not null,
tipo_servico varchar(60) not null,
tempo int not null,
mecanico varchar(60) not null,
trocar_pneu varchar(60) not null,
trocar_cor varchar(60) not null,
concertar varchar(60) not null,
entrega varchar(60) not null,
levar varchar(20) not null,
buscar varchar(20) not null,
valor int not null,
inicial int not null,
final int not null   
);

create table pecas (
id_pecas int auto_increment primary key,
quantidade int not null,
nome varchar (60) not null,
ano year not null,
fornecedor varchar(60) not null,
usadas varchar(20) not null,
novas varchar(60) not null,
faltando varchar(60) not null  
);

create table ordens_de_servico (
id_ordens_de_servico int auto_increment primary key,
nome_cliente varchar(60) not null,
pedido varchar(60) not null,
orcamento int not null,
valor_final int not null,
data_termino year not null 
);

create table pagamentos (
id_pagamentos int auto_increment primary key,
horario varchar(20) not null,
pedido varchar(60) not null,
data varchar (60) not null,
preco int not null,
forma_pagamento varchar (20) not null
);

create table fornecedores (
id_fornecedores int auto_increment primary key,
telefone int not null,
endereco varchar(60) not null,
email varchar(60) not null unique,
pecas varchar(60) not null,
valor int not null 
);

use script_anna_oficina