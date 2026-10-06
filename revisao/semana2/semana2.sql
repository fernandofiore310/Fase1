-- F5
-- Tempo: Nos 15 min. 
-- Esperado (na mão, antes de rodar): Igual o SAIDAS_ESPERADAS.md. Media do Bruno deve ser (1280/3=426,67)
-- Conferência: bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

WITH valores_pedidos AS (
SELECT p.id, p.cliente_id, SUM(i.quantidade*i.preco_unitario) valor_pedido
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
GROUP BY p.id
),
media_pedidos AS (
SELECT c.id, c.nome, ROUND(AVG(valor_pedido), 2) media_cliente
FROM valores_pedidos
JOIN clientes c ON valores_pedidos.cliente_id=c.id
GROUP BY c.id
)
SELECT p.id, m.nome, p.valor_pedido, m.media_cliente
FROM valores_pedidos p
JOIN media_pedidos m ON p.cliente_id=m.id
WHERE p.valor_pedido > m.media_cliente
;

-- G5
-- Tempo: 10min
-- Esperado (na mão, antes de rodar): conferir no saida esperada
-- Conferência: bateu.
-- Consulta: Conferida rapida na aula do gemini diferenca entre partition by e order by dentro da janela.
-- (explicação, quando o exercício pedir)

SELECT 
SUBSTR(p.data, 1, 7) mes,
SUM(i.quantidade*i.preco_unitario) receita_mes,
SUM(SUM(i.quantidade*i.preco_unitario)) OVER (
    -- PARTITION BY SUBSTR(p.data, 1, 7)
    ORDER BY SUBSTR(p.data, 1, 7)
) AS receita_acumulada
FROM itens i 
JOIN pedidos p ON i.pedido_id=p.id
GROUP BY SUBSTR(p.data, 1, 7)
;

-- G4
-- Tempo: 5min15s
-- Esperado (na mão, antes de rodar): conferir no saida esperada
-- Conferência: bateu.
-- Consulta: Nenhuma.
-- (explicação, quando o exercício pedir)

SELECT 
pr.categoria, 
pr.nome, 
SUM(i.preco_unitario*i.quantidade) receita_produto,
RANK() OVER (
    PARTITION BY pr.categoria
    ORDER BY SUM(i.preco_unitario*i.quantidade) DESC
) AS posicao
FROM itens i
JOIN produtos pr ON i.produto_id=pr.id
GROUP BY pr.id 
ORDER BY pr.categoria
;
