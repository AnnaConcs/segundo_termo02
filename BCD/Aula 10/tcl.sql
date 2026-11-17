-- tcl - transações e integridade referencial
-- transação resolve problemas de procedimentos, mas não resolve problemas de integridade referencial
-- sem transação: parte pode permanecer gravada
-- com transação: pode confirmar tudo ou desfazer tudo

-- conceitos iniciais 
-- transação é um conjunto de operações
start TRANSACTION;
insert ...
update ...
insert ...
select ...
commit;

-- sequencia
-- inicio - operações - validação - commit - ROLLBACK

-- ex 1: confirmar as alterações dentro da transação
start TRANSACTION;
update produto
set preco = 9.50 
where id_produto = 1;
commit;

select * from produto;

-- ex 2: rollback - desfaz as alterações ainda não confirmadas
start transaction;
update produto
set preco = 5000.00
where id_produto = 1;
rollback;

-- ex 3: savepoint - criar um ponto para registrar uma etapa da transação
start TRANSACTION;
update produto
set preco = preco * 1.05
where id_categoria = 1;

savepoint reajuste_cafes;

update produto
set preco = preco * 1.50
where id_categoria = 1;

rollback to savepoint reajuste_cafes;
commit;
select * from produto;

-- ex 4: remove o SAVEPOINT
release savepoint reajuste_cafes;
 --transação não substitui constraint
 -- transação: controla se um conjunto de operações será confirmado ou desfeito
 -- constraint: impede que determinamos estados inválidos ejam aceitos

 --ex 5: atualizar estoque com valores negativos
 constraint ck_estoque_quantidade
 check (quantidade >= 0);

--  ex 6: integridade referencial
constraint fk_pedido_cliente foreign key (id_cliente) references cliente (id_cliente)
-- definir uma chave estrangeira
-- a fk impede que o pedido aponte para um cliente inexistente.

-- ex 7: on delete 
-- restric: bloqueia exclusão com dependentes
-- cascade: exclui dependentes
-- set null: remove referência 
constraint fk_item_pedido foreign key (id_pedido) references pedido (id_pedido) on delete cascade;
-- cascade não é a melhor opção pois ele exclui cliente e todos os pedidos relacionados e apaga um histórico criado

-- ex8: exclusão física e lõgica
-- física:
delete from produto
where id_produto = 10;
--lógico:
update produto
set ativo = FALSE
where id_produto = 10;

-- TABELA EXTRA ADICIONAL AO NOSSO BANCO DE DADOS
-- TABELA ESTOQUE
CREATE TABLE ESTOQUE(
    ID_ESTOQUE INT AUTO_INCREMENT,
    ID_PRODUTO INT NOT NULL,
    QUANTIDADE INT NOT NULL DEFAULT 0,
    -- DOCUMENTAÇÃO E ORGANIZAÇÃO DOS ATRIBUTOS
    CONSTRAINT PK_ESTOQUE PRIMARY KEY (ID_ESTOQUE),
    CONSTRAINT UQ_ESTOQUE_PRODUTO UNIQUE (ID_PRODUTO),
    CONSTRAINT CK_ESTOQUE_QUANTIDADE CHECK (QUANTIDADE >=0),
    CONSTRAINT FK_ESTOQUE_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES
    PRODUTO (ID_PRODUTO) ON UPDATE CASCADE ON DELETE RESTRICT
);

insert into estoque (id_produto, quantidade) values (7,50),(8,10); AffectedRows;
select * from produto;
