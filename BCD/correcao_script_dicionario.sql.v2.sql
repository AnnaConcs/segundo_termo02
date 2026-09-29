-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE pagamentos+pedidos (
valor_pago int not null unique,
cliente vauchar(60) not null,
pedido vauchar(60) not null,
id_pagamento int auto_increment primary key,
data_hora_pagamento vauchar(60) not null,
status_pagamento vauchar(60) not null,
data_pedido vauchar(60) not null,
validade int not null unique,
forma_de_pagamento vauchar(60) not null,
valor int not null unique,
id_pedidos int auto_increment primary key,
data_hora vauchar(60) not null,
status vauchar(60) not null,
id_delivery int,
PRIMARY KEY(id_pagamento,id_pedidos)
)

CREATE TABLE estoque (
produto vauchar(60) not null,
quantidade_disponivel int not null unique,
unidade_medida int not null unique,
data_validade int not null unique,
id_insumo int auto_increment primary key PRIMARY KEY,
nome_insumo vauchar(60) not null,
quantidade_atual int not null unique,
quantidade_minima int not null unique
)

CREATE TABLE delivery (
endereco_entrega vauchar(60) not null,
status_entrega vauchar(60) not null,
data_hora_chegada vauchar(60) not null,
pedido vauchar(60) not null,
id_delivery int auto_increment primary key PRIMARY KEY,
taxa_entrega vauchar(60) not null,
data_hora_saida vauchar(60) not null
)

CREATE TABLE clientes+programa de fidelidade (
telefone vauchar(60) not null,
email vauchar(60) not null,
nome vauchar(60) not null,
id_clientes int auto increment primary key,
cpf int not null unique,
data_cadastro vauchar(60) not null,
nome_programa vauchar(60) not null,
pontos_acumulados int not null unique,
nivel vauchar(60) not null,
-- Erro: nome do campo duplicado nesta tabela!
data_cadastro vauchar(60) not null,
id_fidelidade int auto_increment primary key,
saldo_pontos vauchar(60) not null,
data_ultima_atualizacao vauchar(60) not null,
PRIMARY KEY(id_clientes,id_fidelidade)
)

CREATE TABLE produtos (
nome_produto vauchar(60) not null,
preco int,
categoria vauchar(60) not null,
quantidade int,
id_produtos int auto_increment primary key PRIMARY KEY,
nome int not null unique,
descricao vauchar(60) not null,
preco_unitario int unique
)

CREATE TABLE funcionarios (
nome vauchar(60) not null,
cargo vauchar(60) not null,
telefone vauchar(60) not null,
salario int,
id_funcionarios int auto_increment primary key PRIMARY KEY,
data_admissao vauchar(60) not null,
cpf int not null unique
)

CREATE TABLE forma_pagamento (
cartao int not null unique,
pix int not null unique,
debito int not null unique,
credito int not null unique,
dinheiro int not null unique
)

CREATE TABLE tipo_pedido (
presencial vauchar(60) not null,
delivery vauchar(60) not null
)

CREATE TABLE entrega (
id_delivery int ,
id_funcionarios int ,
FOREIGN KEY(id_delivery) REFERENCES delivery (id_delivery),
FOREIGN KEY(id_funcionarios) REFERENCES funcionarios (id_funcionarios)
)

CREATE TABLE Relação_2+Ficha_tecnica (
Ficha_Tecnica int auto_increment primary key PRIMARY KEY,
quantidade_gasta Texto(1),
id_insumo int,
id_produtos int,
FOREIGN KEY(id_insumo) REFERENCES estoque (id_insumo),
FOREIGN KEY(id_produtos) REFERENCES produtos (id_produtos)
)

CREATE TABLE realiza (
id_pagamento int ,
id_pedidos int ,
id_clientes int ,
id_fidelidade int,
FOREIGN KEY(id_pagamento) REFERENCES pagamentos+pedidos (id_pagamento,id_pedidos),
FOREIGN KEY(id_clientes) REFERENCES clientes+programa de fidelidade (id_clientes,id_fidelidade)
)

CREATE TABLE Atende (
id_pagamento int ,
id_pedidos int,
id_funcionarios int ,
FOREIGN KEY(id_pagamentos) REFERENCES pagamentos+pedidos (id_pagamento,id_pedidos),
FOREIGN KEY(id_funcionarios) REFERENCES funcionarios (id_funcionarios)
)

CREATE TABLE contem (
id_produtos int ,
id_pagamento int ,
id_pedidos int ,
FOREIGN KEY(id_produtos) REFERENCES produtos (id_produtos),
FOREIGN KEY(id_pagamentos) REFERENCES pagamentos+pedidos (id_pagamento,id_pedidos)
)

ALTER TABLE pagamentos+pedidos ADD FOREIGN KEY(id_delivery) REFERENCES delivery (id_delivery)
ALTER TABLE Atende ADD FOREIGN KEY(id-pagamentos) REFERENCES Atende ()
