-- G3 com desempate
-- Tempo: Nos 15 min. 
-- Esperado (na mão, antes de rodar): Ana: 4, Bruno: 3, Carla: 2, Diego: 2, Elisa: 2, Fabio: 1 
-- Conferência: bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

-- SELECT c.nome, 
-- COUNT(p.id) n_pedidos,
-- ROW_NUMBER() OVER(
--     ORDER BY COUNT(p.id), c.nome DESC
-- ) AS row_number,
-- RANK() OVER(
--     ORDER BY COUNT(p.id), c.nome DESC
-- ) AS rank,
-- DENSE_RANK() OVER(
--     ORDER BY COUNT(p.id), c.nome DESC
-- ) AS dense_rank 
-- FROM pedidos p 
-- JOIN clientes c ON p.cliente_id=c.id
-- GROUP BY c.id
-- ORDER BY COUNT(p.id), c.nome DESC
-- ;

-- Esperado:
-- Nome | numero_pedidos | ROW_NUMBER | RANK | DENSE_RANK
-- Ana 4 1 1 1 
-- Bruno 3 2 2 2
-- Carla 2 3 3 3
-- Diego 2 4 3 3
-- Elisa 2 5 3 3
-- Fabio 1 6 6 4
-- Resultado: Bateu!

SELECT
c.nome, 
COUNT(p.id) numero_pedidos,
ROW_NUMBER() OVER(
    ORDER BY COUNT(p.id) DESC, c.nome
) AS row_number,
RANK() OVER(
    ORDER BY COUNT(p.id) DESC
) AS rank,
DENSE_RANK() OVER(
    ORDER BY COUNT(p.id) DESC
) AS dense_rank
FROM pedidos p
JOIN clientes c ON p.cliente_id=c.id
GROUP BY c.id 
ORDER BY numero_pedidos DESC, c.nome
;

-- Colocar o nome no ORDER BY do rank e do dense_rank acabaria com os empates, pois estaria criando algo que diferenciaria um cliente do outro, logo, ambas as funcoes veriam que os clientes sao diferentes nesse aspecto (no caso o nome) e nao classificariam como empate.