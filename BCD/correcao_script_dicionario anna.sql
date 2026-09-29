-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
create database correcao_script_dicionario.anna;


CREATE TABLE pagamentos (
valor_pago int not null unique,
cliente varchar(60) not null,
pedido varchar(60) not null,
id_pagamento int auto_increment primary key,
data_hora_pagamento varchar(60) not null,
status_pagamento varchar(60) not null,
forma_de_pagamento varchar(60) not null,
id_delivery int,
PRIMARY KEY(id_pagamento,id_pedidos)
);

create table pedidos (
id_pedidos int auto_increment primary key,
data_hora varchar(60) not null,
validade varchar(60) not null,
forma_de_pagamento varchar(30) not null,
valor int not null unique,
status varchar(60) not null,
data_pedido varchar(60) not null,
tipo_pedido varchar(60) not null,
presencial varchar(60) not null,
delivery varchar(60) not null
);

CREATE TABLE estoque (
produto varchar(60) not null,
quantidade_disponivel int not null unique,
unidade_medida int not null unique,
data_validade int not null unique,
id_insumo int auto_increment primary key PRIMARY KEY,
nome_insumo varchar(60) not null,
quantidade_atual int not null unique,
quantidade_minima int not null unique
);

CREATE TABLE delivery (
endereco_entrega varchar(60) not null,
status_entrega varchar(60) not null,
data_hora_chegada varchar(60) not null,
pedido varchar(60) not null,
id_delivery int auto_increment primary key PRIMARY KEY,
taxa_entrega varchar(60) not null,
data_hora_saida varchar(60) not null
);

CREATE TABLE clientes (
telefone varchar(60) not null,
email varchar(60) not null,
nome varchar(60) not null,
id_clientes int auto_increment primary key,
cpf int not null unique,
nome_programa varchar(60) not null,
pontos_acumulados int not null unique,
nivel varchar(60) not null,
data_cadastro varchar(60) not null,
id_fidelidade int auto_increment primary key,
saldo_pontos varchar(60) not null,
data_ultima_atualizacao varchar(60) not null,
PRIMARY KEY(id_clientes,id_fidelidade)
);

CREATE TABLE produtos (
nome_produto varchar(60) not null,
preco int,
categoria varchar(60) not null,
quantidade int,
id_produtos int auto_increment primary key PRIMARY KEY,
nome int not null unique,
descricao varchar(60) not null,
preco_unitario int unique
);

CREATE TABLE funcionarios (
nome varchar(60) not null,
cargo varchar(60) not null,
telefone varchar(60) not null,
salario int,
id_funcionarios int auto_increment primary key PRIMARY KEY,
data_admissao varchar(60) not null,
cpf int not null unique
);

CREATE TABLE forma_pagamento (
cartao int not null unique,
pix int not null unique,
debito int not null unique,
credito int not null unique,
dinheiro int not null unique
);

CREATE TABLE tipo_pedido (
presencial varchar(60) not null,
delivery varchar(60) not null
);

CREATE TABLE entrega (
id_delivery int ,
id_funcionarios int ,
FOREIGN KEY(id_delivery) REFERENCES delivery (id_delivery),
FOREIGN KEY(id_funcionarios) REFERENCES funcionarios (id_funcionarios)
);

CREATE TABLE Ficha_tecnica (
Ficha_Tecnica int auto_increment primary key PRIMARY KEY,
quantidade_gasta int not null unique,
id_insumo int,
id_produtos int,
FOREIGN KEY(id_insumo) REFERENCES estoque (id_insumo),
FOREIGN KEY(id_produtos) REFERENCES produtos (id_produtos)
);

CREATE TABLE realiza (
id_pagamento int ,
id_pedidos int ,
id_clientes int ,
id_fidelidade int,
FOREIGN KEY(id_pagamento) REFERENCES pagamentos(id_pagamento,id_pedidos),
FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes,id_fidelidade),
foreign key(id_pedidos) references pedidos(id_pedidos,id_pagamentos),
foreign key(id_programa_de_fidelidade) references programa_de_fidelidade(id_fidelidade,id_clientes)
);

CREATE TABLE Atende (
id_pagamento int ,
id_pedidos int,
id_funcionarios int ,
FOREIGN KEY(id_pagamentos) REFERENCES pagamentos (id_pagamento,id_pedidos),
FOREIGN KEY(id_funcionarios) REFERENCES funcionarios (id_funcionarios),
foreign key(id_pedidos) references pedidos (id_pedidos,id_pagamento)
);

CREATE TABLE contem (
id_produtos int ,
id_pagamento int ,
id_pedidos int ,
FOREIGN KEY(id_produtos) REFERENCES produtos (id_produtos),
FOREIGN KEY(id_pagamentos) REFERENCES pagamentos (id_pagamento,id_pedidos),
foreign key(id_pedidos) references pedidos (id_pedidos,id_pagamento)
);

