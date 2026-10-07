-- Active: 1788351693696@@127.0.0.1@3306@smartcoffee_dml_bruno
insert into cliente (nome,email,telefone,cidade,ativo) values 
('Edson Wladimir', 'edson@email.com', '1999998881762', 'Paris', true);

--Exemplo de estrutura simples de select
--select coluna
--from tabela;

--ex 1: select para consultar todas as colunas
select * from cliente;
-- ex 2: consultando por colunas
select nome, email from cliente;

-- ex3: inserindo apelido nas colunas -- alias
select nome AS cliente from cliente;

select nome AS cliente, telefone AS contato, ativo AS status from cliente;
select nome, preco, preco * 0.90 AS preco_Promocional from produto;

-- EX 4: DISTINCT - ELIMINAR REPETIÇÕES
SELECT cidade FROM cliente;

SELECT DISTINCT cidade AS Cidade
FROM cliente;
-- SEM DISTINCT O ITEM IRÁ APARECER VÁRIAS VEZES
-- COM DISTINCT O ITEM IRÁ APARECER UMA VEZ

-- EX 5: FILTRO EM REGISTROS
SELECT nome, preco 
FROM produto
WHERE preco > 10
-- RETORNA VALORES ACIMA DE 10 REAIS EM SEUS PREÇOS

SELECT nome, preco
FROM produto
WHERE ativo = TRUE
-- retorna produtos ativos



SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;
-- retorna pedidos acima de determinado valor

--operadores de comparação
-- = igual
-- <> ou != diferente
-- > maior que
-- >= maior ou igual
-- < menor que 
-- <= menor ou igual

-- ex6: uso de and, or e not
-- and - todas as condicões precisam ser verdadeiras 

select nome, preco 
from produto
where preco >= 8.00 and preco <=20.00;

-- or - pelo menos uma condição verdadeira
select nome, cidade
from cliente
where cidade = 'Limeira' or cidade = 'Piracicaba';

-- not - negar não trazer resultado que foi apresentado
select nome, cidade
from cliente
where not cidade = 'Limeira';

-- juntos - and e or
select nome, cidade, ativo as STATUS
from cliente
where ativo = true 
and (cidade = 'Limeira' or cidade = 'Americana');

-- ex 7: pesquisando por intervalos - between
select nome, preco 
from produto
where preco BETWEEN 8.00 and 15.00;

select id_pedido, data_pedido, valor_total
from pedido 
where data_pedido BETWEEN ''