-- Active: 1794917657685@@127.0.0.1@3308@biblioteca_senai_anna
-- Estrutura inicial
drop database if exists biblioteca_senai_Anna;

create database if not exists biblioteca_senai_Anna;

use biblioteca_senai_Anna;
---------------------------------------------------------------------------------------------

-- fase 1 - DDL
create table usuario (
    id_usuario int auto_increment,
    nome varchar(100) not null,
    email varchar(120) not null unique,
    telefone varchar(20),
    ativo boolean default true,
    constraint pk_id_usuario primary key (id_usuario),
    constraint uq_email unique (email)
);

create table livro (
id_livro int AUTO_INCREMENT,
titulo varchar(150) not null,
autor varchar(120) not null,
isbn varchar(13) not null unique,
ano_publicacao int,
quantidade_disponivel int default 0,
 check (quantidade_disponivel >= 0),
 constraint pk_livro primary key (id_livro),
 constraint uq_isbn unique (isbn)
);

create table emprestimo (
id_emprestimo int AUTO_INCREMENT,
data_emprestimo datetime default CURRENT_TIMESTAMP,
data_prevista date not null,
data_devolucao date,
status_emprestimo varchar(20) default'ABERTO',
 check (status_emprestimo in ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
id_usuario int not null,
 constraint fk_usuario foreign key (id_usuario) references usuario (id_usuario),
id_livro int not null,
constraint fk_livro foreign key (id_livro) references livro(id_livro),
constraint pk_emprestimo primary key (id_emprestimo)
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    ID_LIVRO INT NOT NULL,
    CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID_CATEGORIA),
    CONSTRAINT UQ_CATEGORIA_NOME UNIQUE (NOME),
    CONSTRAINT FK_CATEGORIA_LIVRO FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO (ID_LIVRO)
);


ALTER TABLE LIVRO ADD EDITORA VARCHAR(100);

-- FASE 2 - DML

INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('BRUNO', 'BRUNO@EMAIL.COM', '12345487', TRUE),
('CLARICE', 'CLARICE@EMAIL.COM', '12345467', TRUE);

INSERT INTO LIVRO (TITULO, AUTOR, ISBN, ANO_PUBLICACAO,
QUANTIDADE_DISPONIVEL) VALUES
('HARRY POTTER', 'J.K ROWLING', '1234567897', 1997, 30);

INSERT INTO CATEGORIA (NOME, ID_LIVRO) VALUES
('FANTASIA', 1)

UPDATE usuario
set telefone = '000000'
where id_usuario = 2;

UPDATE LIVRO
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ANO_PUBLICACAO >= 1990;

INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('TEMPORARIO', 'TEMPORARIO@EMAIL.COM', NULL, TRUE);

SELECT * FROM USUARIO;

DELETE FROM USUARIO
WHERE ID_USUARIO = 2;
-- A CHAVE ESTRANGEIRA ESTÁ RESTRINGINDO A EXCLUSÃO DO USUÁRIO

INSERT INTO EMPRESTIMO (DATA_EMPRESTIMO, DATA_PREVISTA,
DATA_DEVOLUCAO, STATUS_EMPRESTIMO, ID_USUARIO, ID_LIVRO) VALUES
(NOW(), '2026-11-17', NULL, 'ABERTO', 1, 1);

--SFASE 3 - DQl
SELECT TITULO, AUTOR, QUANTIDADE_DISPONIVEL FROM LIVRO;

SELECT TITULO, AUTOR FROM LIVRO
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL DESC;

SELECT TITULO, AUTOR FROM LIVRO
WHERE TITULO LIKE '%HARRY%';

SELECT TITULO, AUTOR, ANO_PUBLICACAO FROM LIVRO
WHERE ANO_PUBLICACAO BETWEEN 1990 AND 2025;

SELECT COUNT(*) AS QUANTIDADE,
SUM(QUANTIDADE_DISPONIVEL) AS SOMA,
AVG(QUANTIDADE_DISPONIVEL) AS MEDIA,
MAX(QUANTIDADE_DISPONIVEL) AS MAXIMO,
MIN(QUANTIDADE_DISPONIVEL) AS MINIMO
FROM LIVRO;