-- Active: 1788351693696@@127.0.0.1@3306@biblioteca_som2_anna
create database biblioteca_som2_anna

use biblioteca_som2_anna

CREATE TABLE usuario (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(120) NOT NULL unique,
TELEFONE VARCHAR(20),
ativo BOOLEAN DEFAULT TRUE
);

create table livro (
id_livro int AUTO_INCREMENT PRIMARY KEY,
titulo varchar(150) not null,
autor varchar(120) not null,
isbn varchar(13) not null unique,
ano_publicacao int,
quantidade_disponivel int default 0,
 check (quantidade_disponivel >= 0)
);

create table emprestimo (
id_emprestimo int AUTO_INCREMENT primary key,
data_emprestimo datetime default CURRENT_TIMESTAMP,
data_prevista date not null,
data_devolucao date,
status_emprestimo varchar(20) default'ABERTO',
 check (status_emprestimo >= 'ABERTO'),
id_usuario int not null,
 constraint fk_usuario foreign key (id_usuario) references usuario (id_usuario),
id_livro int not null,
constraint fk_livro foreign key (id_livro) references livro(id_livro)
);

ALTER TABLE livro ADD editora VARCHAR(100);

INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Ana Silva', 'ana@email.com', '19999990001', TRUE),
('Bruno Souza', 'bruno@email.com', '19999990002', TRUE),
('Diego Santos', 'diego@email.com', '19999990004', TRUE),
('Henrique Costa', 'henrique@email.com', NULL, true);

insert into livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES
('Melhor do que no filmes','Lynn Painter', '1458247589', '2020','3'),
('PS ainda amo você','Jenny Han', '1458247586', '2017', '4'),
('1984','George Owell', '1458247588', '1940', '2'),
('Amor e gelato','Sthephanie Garber', '1458247587', '2018','5'),
('Sitio do PicaPau','Monteiro Lobato', '1458247582', '2019', '6'),
('Turma da Mõnica','Maurício de Souza', '1458247581', '2016', '7');

insert into emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista,
data_devolucao, status_emprestimo) values
('1', '1', '2026-09-02 08:19:00', '2026-10-02', '2026-05-02', 'ABERTO'),
('2', '2', '2026-09-01 08:20:00', '2026-11-02', '2026-06-02', 'ABERTO'),
('3', '3', '2026-09-03 08:15:00', '2026-12-02', '2026-07-02', 'ABERTO');

select * from livro

UPDATE usuario
SET telefone = '19999897865'
WHERE id_usuario = 2;

update livro
set quantidade_disponivel = quantidade_disponivel + 2
where id_livro =  1;


