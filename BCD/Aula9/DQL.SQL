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
where data_pedido BETWEEN '2026-09-01 00:00:00' and '2026-09-30 23:59;59';


-- ex:8 in com várias possibilidades
select nome,cidade
from cliente
where cidade in ('Limeira', 'Americana', 'Piracicaba');

select nome, cidade
from cliente 
where cidade not in ('Limeira','Campinas');

 --ex9: exemplo com textos ou pesquisar por textos - LIKE
 -- coringas 
 -- % vários caracteres
 -- _exatamente um caracter 

SELECT nome
FROM produto
WHERE nome LIKE 'Café%'
-- RETORNAR PRODUTOS QUE POSSUEM A PALAVRA CAFÉ E QUE COMEÇAM COM ELA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate%';
-- RETORNAR PRODUTOS QUE POSSUEM A PALAVRA CHOCOLATE

SELECT nome
FROM produto
WHERE nome LIKE '%Silva';
-- RETORNAR NOMES QUE TERMINAM COM SILVA

SELECT nome 
FROM produto
WHERE nome LIKE '_afé%';

-- EX 10: NULL - AUSÊNCIA DE VALOR
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- ex 11: order  by - ordenar resultados
-- asc significa crescente 
--desc significa decrescente

select nome, preco 
from produto
ORDER BY preco ASC;

select nome, preco 
from produto
order by preco desc;

select cidade, nome 
from cliente
order by cidade asc, nome desc;

-- ex 12: limit - limitando a quantidade de linha 
select nome, preco 
from produto
order by preco desc
limit 8;

select nome, preco 
from produto
order by nome 
limit 8 offset 8;

-- ex 13: calculo de colunas
select nome, preco, preco * 1.10 AS preco_atualizado
from produto;

select id_item, quantidade, preco_unitario, quantidade * preco_unitario as total_compra from item_pedido;

-- ex 14: funções para consulta
-- textos
select upper(nome) as nome_cliente, lower(email) as email from cliente;

select concat(nome, ' - ', cidade) AS cliente_Cidade from cliente;

--números
select nome, preco, round(preco * 0.90, 2) AS preco_desconto from produto;

--datas
select id_pedido, data_pedido, date(data_pedido) as datas, day(data_pedido) as dia, month (data_pedido) as mês, year(data_pedido) as ano from pedido;

-- substituindo o null no resultado
select nome, COALESCE(telefone, 'não informado') AS contato from cliente;

-- ex 15: funções de agregação - sum, avg, min, max, count
-- count - contar quantidade de registros
-- sum - soma de valores
-- avg - média de valores
-- min - menor valor 
-- max - maior valor 

select count (*) as total_cliente from cliente;
-- resultado de quantidade de clientes

select avg(preco) as media_precos
from produto;
-- media do valor dos produtos

select min(preco) as promocao, max(preco) as reajuste, avg(preco) as media_precos from produto;
-- resumo de preços

select sum(valor_total) as faturamento_mensal 
from pedido
where status = 'ABERTO'
-- TOTAL DE PEDIDOS FINALIZADOS

--ex 16: group by - agrupar dados
select cidade, count(*) as qtde_cidades
from cliente
group by cidade;
-- consulta por grupos de cidades

select id_categoria,count(*) qtde_produtos
from produto
group by id_categoria;
-- quantidade de produtos por categoria 

--ex 17: having - filtro por grupos 
select cidade, count(*) as quantidades_clientes
from cliente
group by cidade
having count(*)  >= 2;

-- ex 18: consulta completa 
select colunas
from tabela
where condicao
group by colunas_agrupar
having condicao
order by colunas
limit quantidade;
-- dica para seguir em ordem lógica para uma consulta parcial ou completa
-------------------------------------------------------------------------