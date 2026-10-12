-- G3 com desempate
-- Tempo: Nos 15 min. 
-- Esperado (na mão, antes de rodar): Ana: 4, Bruno: 3, Carla: 2, Diego: 2, Elisa: 2, Fabio: 1 
-- Conferência: bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT c.nome, 
COUNT(p.id) n_pedidos,
ROW_NUMBER() OVER(
    ORDER BY COUNT(p.id), c.nome DESC
) AS row_number,
RANK() OVER(
    ORDER BY COUNT(p.id), c.nome DESC
) AS rank,
DENSE_RANK() OVER(
    ORDER BY COUNT(p.id), c.nome DESC
) AS dense_rank 
FROM pedidos p 
JOIN clientes c ON p.cliente_id=c.id
GROUP BY c.id
ORDER BY COUNT(p.id), c.nome DESC
;