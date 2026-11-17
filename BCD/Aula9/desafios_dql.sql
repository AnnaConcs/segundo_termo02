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
SELECT cidade, COUNT(*) AS QUANTIDADE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT (*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS FATURAMENTO_MENSAL
FROM pedido
WHERE status = 'ABERTO'

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.id_pedido, P.data_pedido, C.nome AS cliente, P.valor_total, P.status
FROM pedido AS P
INNER JOIN cliente AS C 
ON C.id_cliente = P.id_cliente

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT PR.nome AS produto, CA.nome AS categoria
FROM produto AS PR
INNER JOIN categoria AS CA 
ON CA.id_categoria = PR.id_categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
select p.id_pedido, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario as subtotal
from pedido as p 
inner join item_pedido as IP
inner join produto as pr
on pr.id_produto = ip.id_produto
order by p.id_pedido, pr.nome;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
select c.nome, p.id_pedido, p.data_pedido
from cliente as c
left join pedido as P
on p.id_cliente = c.id_cliente
order by c.nome;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
select c.id_cliente, c.nome
from cliente as c
left join pedido as p
on p.id_cliente = c.id_cliente
where p.id_cliente is null;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
select c.nome as cliente, count(p.id_pedido)as qtde_pedidos, sum(p.valor_total) as total_comprado
from cliente as c
inner join pedido as p
on p.id_cliente = c.id_cliente
where p.status = 'FINALIZADOS'
group by c.id_cliente, c.nome
order by total_comprado desc;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
select ca.nome as categoria, count(pr.id_produto) as produtos, round(avg
(pr.preco),2) as preco_médio
from categoria as CA
inner join produto as pr
on pr.id_categoria = ca.id_categoria
group by ca.id_categoria, ca.nome
order by preco_médio desc;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
select nome, preco 
from produto
where preco > (select avg(preco)
from produto
)
order by preco desc;

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
select nome,preco,
CASE 
    WHEN preco < 8.00 THEN 'Econômico'
    WHEN preco <= 15.00 THEN 'Intermediário'  
    ELSE  'Premium'
END AS classificação
FROM produto
ORDER BY preco;
-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
-- Qual é o preço médio dos produtos de acordo com sua categoria? 
-- Por que essa informação é útil?
SELECT c.nome AS categoria,
COUNT(pr.id_produto) AS produtos,
ROUND(AVG(pr.preco), 2) AS preco_medio
FROM categoria AS c
INNER JOIN produto AS pr
ON pr.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY preco_medio DESC;
-- Consulta:
SELECT c.nome AS categoria,
COUNT(pr.id_produto) AS produtos,
ROUND(AVG(pr.preco), 2) AS preco_medio
FROM categoria AS c
INNER JOIN produto AS pr
ON pr.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY preco_medio DESC;
