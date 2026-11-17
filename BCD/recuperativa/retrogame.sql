-- Active: 1794917657685@@127.0.0.1@3308@recuperativa_retrogame_anna
drop database recuperativa_retrogame_anna;
drop table cliente;
create database if not exists recuperativa_retrogame_anna;

use recuperativa_retrogame_anna;

-- create table plataforma (
--     id_plataforma int auto_increment,
--     nome varchar(80) not null unique,
--     EMAIL VARCHAR(120) NOT NULL unique,
--     ativo BOOLEAN DEFAULT TRUE
--     constraint pk_id_plataforma primary key (id_plataforma),
--     constraint uq_email unique (email)
-- );

create table plataforma (
    id_plataforma int auto_increment,
    nome varchar(80) not null unique,
    constraint pk_id_plataforma primary key (id_plataforma),
    constraint uq_plataforma_nome unique (nome)
);

create table categoria (
    id_categoria int auto_increment,
    descricao varchar(80) not null,
    constraint pk_id_categoria primary key (id_categoria),
    constraint uq_plataforma_descricao unique (descricao)
);

select * from jogo

create table cliente (
    id_cliente int auto_increment,
    nome varchar(100) not null,
    email varchar(120) not null unique,
    telefone varchar (20) null,
    ativo boolean default true,
    constraint pk_id_cliente primary key (id_cliente),
    constraint uq_email unique (email)
);

create table jogo (
    id_jogo int auto_increment,
    titulo varchar(150) not null,
    codigo varchar(15) not null unique,
    ano_lancamento int not null,
    constraint pk_id_jogo primary key (id_jogo),
    quantidade_disponivel int default 0,
    check (quantidade_disponivel >= 0),
    id_plataforma int not null,
    constraint fk_plataforma foreign key (id_plataforma) references plataforma(id_plataforma),
    id_categoria int not null,
    constraint fk_categoria foreign key (id_categoria) references categoria(id_categoria)
);

create table locacao (
id_locacao int AUTO_INCREMENT,
data_retirada datetime default CURRENT_TIMESTAMP,
data_prevista date not null,
data_devolucao date null,
status_locacao varchar(20) default'ABERTA',
 check (status_locacao in ('ABERTA', 'DEVOLVIDA','ATRASADA')),
id_cliente int not null,
 constraint fk_cliente foreign key (id_cliente) references cliente (id_cliente),
id_jogo int not null,
constraint fk_jogo foreign key (id_jogo) references jogo(id_jogo),
constraint pk_locacao primary key (id_locacao)
);

ALTER TABLE jogo ADD desenvolvedora VARCHAR(100);

INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('TEMPORARIO', 'TEMPORARIO@EMAIL.COM', NULL, TRUE);
INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('TEMPORARIO2', 'TEMPORARIO@EMAIL.COM2', '45454545454545454545', TRUE);
INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('TEMPORARIO3', 'TEMPORARIO@EMAIL.COM3', '48484848484848484848', TRUE);
INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('TEMPORARIO4', 'TEMPORARIO@EMAIL.COM4', '42424243242424242424', TRUE);

INSERT INTO plataforma (nome) values 
('Xbox One'),
('Playstation 5');

INSERT INTO categoria (descricao) values 
('Terror'),
('Tiro');

insert into jogo (titulo, codigo, ano_lancamento, quantidade_disponivel, id_plataforma, id_categoria, desenvolvedora) values 
('Free Fire', 'MB-001', 2017, 4, 2, 1, '111Dots studio'),
('Clash Royale', 'MB-002', 2016, 5, 1, 2, 'supercell'),
('Final Fantasy', 'XB-001', 2016, 6, 2, 1, 'Sqaure Enix'),
('Dead Island', 'XB-002', 2023, 7, 1, 2, 'Dambuster Studios'),
('GTA5', 'PS5-001', 2013, 8, 2, 1, 'Rockstar Games'),
('Alan Wake', 'PS5-002', 2010, 9, 2, 2, 'Nextage');

select * from cliente;

insert into locacao (data_retirada, data_prevista, data_devolucao, status_locacao, id_cliente, id_jogo ) values
('2026-09-02 08:19:00', '2026-09-03', '2026-09-04', 'ABERTA', 1, 43),
('2026-09-01 08:19:00', '2026-09-05', '2026-09-06', 'ABERTA', 1, 44),
('2026-09-06 08:19:00', '2026-09-07', '2026-09-08', 'ABERTA', 2, 45);





UPDATE cliente
SET telefone = '19999897865'
WHERE id_cliente = 2;

UPDATE jogo
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ano_lancamento >= 2000;

INSERT INTO cliente (nome, email, telefone, ativo) VALUES
('Heitor Silva', 'Heitora@email.com', '19999470001', TRUE);
delete from cliente
where id_cliente = 6;

delete from cliente
where id_cliente = 1;

-- não dá para excluir pois tem uma key constraint e isso impede a exclusão.

SELECT TITULO, ano_lancamento, QUANTIDADE_DISPONIVEL FROM jogo;

SELECT TITULO, quantidade_disponivel FROM jogo
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL desc;