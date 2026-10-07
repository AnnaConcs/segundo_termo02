-- Active: 1788351693696@@127.0.0.1@3306@smartcoffee_dml_bruno
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Anna Júlia Concolato
-- Turma: Devs Data: 07/10/2026
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dql;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
select * from cliente;
-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
select nome, cidade, email from cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade AS Cidade
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT * FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
select nome, preco 
from produto
order by preco desc
limit 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
select nome, preco 
from produto
where preco BETWEEN 8.00 and 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
select nome, cidade
from cliente
where cidade IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
select nome, preco
from produto
where nome LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
select nome, cidade
from cliente
where telefone IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
select * from pedido
where status = 'FINALIZADO' and valor_total > 20.00
order by valor_total desc;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
select count (*) as total_produtos from produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
select min(preco) as menor_preco, max(preco) as maior_preco, avg(preco) as preco_medio
from produto;

-- 13. Informe quantos clientes existem em cada cidade.
select cidade, count(*) as qtde_clientes
from cliente
group by cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.


-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.


-- 17. Liste cada produto acompanhado do nome de sua categoria.


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.


-- 20. Liste apenas os clientes que nunca fizeram pedidos.


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta: