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

select count (nome) as total_produtos
from produto;

-- part II - relacionamento entre tabelas - joins
-- join - junção de tabelas
-- ex 19: pedidos com nome do cliente 

-- inner join - retorna registros que possuem correspondências entre tabelas
select p.id_pedido, p.data_pedido, c.nome as cliente, p.valor_total
from pedido as p
inner join cliente as c
on C.id_cliente = P.id_cliente;

--OBS: Relacione o cliente cujo id_cliente é igual ap id_cliente gravado no pedido
-- p e c são apelidos ou aliases para deixar mais curtas e legíveis

-- left join - mantém todos os registros da tebela da esquerda mesmo quando não possui correspondência na tabela da direita
-- ex 20: todos os clientes, inclusive quem nunca comprou ou quem nunca realizou pedido
select c.nome, p.id_pedido, p.data_pedido
from cliente as c
left join pedido as P
on p.id_cliente = c.id_cliente
order by c.nome;

-- ex 21: clientes sem pedidos
select c.id_cliente, c.nome
from cliente as c
left join pedido as p
on p.id_cliente = c.id_cliente
where p.id_cliente is null;

-- join com três tabelas
-- ex 22: itens de pediddo com nome do produto
select p.id_pedido , pr.nome as produto, ip.quantidade, ip.preco_unitario,
ip.quantidade * ip.preco_unitario as subtotal
from pedido as p
inner join item_pedido as ip
on ip.id_pedido = p.id_pedido
inner join produto as pr
on pr.id_produto = ip.id_produto
order by p.id_pedido;

-- ex 23 - agregação + joins
-- quantidade de produtos por categoria
select ca.nome as categoria, count(pr.id_produto) as qtde_produtos
from categoria as ca
inner join produto as pr
on pr.id_categoria = ca.id_categoria
group by ca.id_categoria, ca.nome
order by qtde_produtos desc;

-- ex 24: total comprado por cliente
select c.nome as cliente, count(p.id_pedido)as qtde_pedidos, sum(p.valor_total) as total_comprado
from cliente as c
inner join pedido as p
on p.id_cliente = c.id_cliente
where p.status = 'FINALIZADOS'
group by c.id_cliente, c.nome
order by total_comprado desc;

-- RELATÓRIO COMPLETO DO PEDIDO
-- EX 25: COMBINAR VÁRIAS TABELAS EM UMA CONSULTA
select p.id_pedido, date_format(p.data_pedido, '%d %m %Y %H: %i') as data, c.nome as cliente, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario as subtotal
from pedido as p 
inner join cliente as c
on c.id_cliente = p.id_cliente
inner join item_pedido as IP
on ip.id_pedido = p.id_cliente
inner join produto as pr
on pr.id_produto = ip.id_produto
order by p.id_pedido, pr.nome;

-- obs: padrão de formatação de data no Brasil
-- date_format(p.data_pedido, '%d %m %Y %H: %i')

criando classificações
ex 26 - case - permite construir uma classificação baseada em regras

select nome,preco,
CASE 
    WHEN preco < 8.00 THEN 'Econômico'
    WHEN preco <= 15.00 THEN 'Intermediário'  
    ELSE  'Premium'
END AS classificação
FROM produto
ORDER BY preco;

-- SUBCONSULTA
-- é uma consulta dentro de outra consulta
-- ex 27: produtos acima do preço médio
select nome, preco 
from produto
where preco > (select avg(preco)
from produto
)
order by preco desc;

--demosntração completa e final
-- passo 1 - visualizar produtos 
select * from produto;
-- passo 2- selecionar somente o necessário
select nome, preco from produto;
-- passo 3 - filtro
select nome, preco from produto
where preco >= 10;
-- passo 4 - ordenar informações
select nome, preco from produto
where preco >= 10.00
order by preco desc;
-- passo 5 - mostrar categoria
select pr.nome as produto, ca.nome as categoria, pr.preco 
from produto as pr 
inner join categoria as ca
on ca.id_categoria = PR.id_categoria
where pr.preco >= 10.00
order by pr.preco desc;
--passo 6 - pergunta gerenciual
select ca.nome as categoria, count(pr.id_produto) as produtos, round(avg
(pr.preco),2) as preco_médio
from categoria as CA
inner join produto as pr
on pr.id_categoria = ca.id_categoria
group by ca.id_categoria, ca.nome
order by preco_médio desc;
