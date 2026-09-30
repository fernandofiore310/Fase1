-- E1
-- Tempo: 6min47s
-- Esperado (na mão, antes de rodar): Gabi deve aparecer com 0 pedidos.
-- Conferência: bateu.
-- Consulta: nenhuma
-- (explicação, quando o exercício pedir)

SELECT c.nome, COUNT(p.id) numero_pedidos
FROM clientes c
LEFT JOIN pedidos p  ON c.id= p.cliente_id
GROUP BY c.id
;

-- E2
-- Tempo: 1min46s
-- Esperado (na mão, antes de rodar): era esperado Gabi e Hugo.
-- Conferência: bateu.
-- Consulta: nenhuma
-- (explicacao quando precisar).

SELECT c.nome, COUNT(p.id) numero_pedidos
FROM clientes c
LEFT JOIN pedidos p  ON c.id= p.cliente_id
GROUP BY c.id
HAVING COUNT(p.id) == 0
;

-- E3
-- Tempo: 8min46s
-- Esperado (na mão, antes de rodar): o produto de id 10 nunca foi vendido.
-- Conferência: bateu.
-- Consulta: Olhei no SQL Bolt questao de Left Join e valores NULL.
-- (explicação, quando o exercício pedir)

SELECT pr.id, pr.nome
FROM produtos pr
LEFT JOIN itens i ON pr.id = i.produto_id
GROUP BY pr.id
HAVING SUM(i.quantidade*i.preco_unitario) IS NULL
;

-- E4
-- Tempo: 4min40s
-- Esperado (na mão, antes de rodar): Soma total de 4250
-- Conferência: bateu.
-- Consulta: Gemini para o COALESCE
-- (explicação, quando o exercício pedir)

SELECT pr.nome, COALESCE(SUM(i.quantidade*i.preco_unitario), 0) receita
FROM produtos pr
LEFT JOIN itens i ON pr.id = i.produto_id
GROUP BY pr.id
ORDER BY receita DESC
;

-- E5
-- Tempo: 2min56s
-- Esperado (na mão, antes de rodar): Sao Paulo-2, Santos-2 e Campinas-2 devem aparecer.
-- Conferência: bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT cidade, COUNT(id)
FROM clientes
GROUP BY cidade
HAVING COUNT(id) > 1
ORDER BY COUNT(id) DESC
;