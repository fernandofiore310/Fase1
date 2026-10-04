DROP INDEX IF EXISTS idx_cliente_id;

-- H1
-- Tempo: 14min34s
-- Esperado (na mão, antes de rodar): Vacilei e nao vi que tinha que fazer algo antes de rodar.
-- Conferência:
-- Consulta: Olhei o resumo/aula que pedi para o Gemini fazer sobre indices e tirei duvidas de erros com o ChatGPT.
-- O que mudou foi que antes, o sql ia atras do c.id com um search, e em seguida, ia fazer um scan da tabela pedidos para achar o cliente_id necessario.
-- No entanto, quando adicionei o indice, o sql nao precisou mais fazer o scan, e fez um search direto.

EXPLAIN QUERY PLAN
SELECT 
c.id, 
p.id, 
p.data
FROM clientes c
JOIN pedidos p ON c.id=p.cliente_id
WHERE c.id = 2
;

CREATE INDEX IF NOT EXISTS idx_cliente_id ON pedidos(cliente_id);

EXPLAIN QUERY PLAN 
SELECT 
c.id, 
p.id, 
p.data
FROM clientes c
JOIN pedidos p ON c.id=p.cliente_id
WHERE c.id = 2
;

-- H2
-- Tempo: 3min12s
-- Esperado (na mão, antes de rodar): Acho que vai ser SEARCH.
-- Conferência: 
-- Consulta: Aula do Gemini.
-- Porque o SQLite, assim como outras ferramentas de base de dados, cria um indice automaticamente para colunas marcadas como PRIMARY KEY.

EXPLAIN QUERY PLAN
SELECT  
id, 
data
FROM pedidos
WHERE id = 5
;

-- H3
-- Tempo: 8min34s
-- Esperado (na mão, antes de rodar): Acho que vai ser SEARCH para as duas, visto que ambas formam a primary key.
-- Conferência: 
-- Consulta: nenhuma.
-- Confesso que ainda nao entendi. Vi que ele busca o pedido_id por SEARCH usando um index, e usa SCAN no produto_id, mas realmente nao entendi porque.
-- Alem disso, nao entendi porque o sql faz um SCAN usando esse Covering index. Na minha cabeca, SCAN era usado justamente a ausencia de index

EXPLAIN QUERY PLAN
SELECT  
pedido_id, 
produto_id
FROM itens
WHERE pedido_id = 1
;

EXPLAIN QUERY PLAN
SELECT  
pedido_id, 
produto_id
FROM itens
WHERE produto_id = 6
;

-- H4
-- Tempo: 3min40s
-- Esperado (na mão, antes de rodar): Acho que vai ser SEARCH para as duas, visto que ambas formam a primary key.
-- Conferência: Aula do Gemini.
-- Consulta: nenhuma.

-- As que mais aparecem sao as primary keys, e as cliente_id, pedido_id e produto_id.
-- Eu nao criaria index, visto que a nossa base eh muito pequena. No entanto, caso fosse em uma empresa real, eu indexaria essas colunas, mesmo sabendo do custo adicional que um INSERT ou do fato da base aumentar de tamanho. Isso otimizaria muito as buscas de dados e os filtros que sao muito usados.

DROP INDEX IF EXISTS idx_cliente_id;