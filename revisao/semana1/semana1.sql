-- B3
-- Receita Ana: 850
-- Feito em 4min39s
SELECT c.nome, SUM(i.quantidade*i.preco_unitario) valor_gasto
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
JOIN clientes c ON p.cliente_id=c.id
GROUP BY c.id
ORDER BY valor_gasto DESC
;

-- C2
-- 5, 7, 9, 11 e 14
-- 4min41s
SELECT p.id, SUM(i.quantidade*i.preco_unitario) valor_do_pedido
FROM itens i
JOIN pedidos p ON i.pedido_id = p.id
GROUP BY p.id
HAVING SUM(i.quantidade*i.preco_unitario) > 300
;

-- D2
-- Receita Maio: 770
-- 4min4s
SELECT SUBSTR(p.data, 1, 7) mes, SUM(i.quantidade*i.preco_unitario) receita
FROM itens i
JOIN pedidos p ON i.pedido_id = p.id
GROUP BY SUBSTR(p.data, 1, 7)
ORDER BY mes
;