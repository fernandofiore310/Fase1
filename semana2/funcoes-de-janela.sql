-- G1
-- Tempo: 10min26s
-- Esperado (na mão, antes de rodar): O resultado deve ter o mesmo numero de linhas de itens 22 linhas. Nas linhas do pedido 1 deve aparecer 200.
-- Conferência: bateu.
-- Consulta: Olhei o resumo/aula que pedi para o Gemini fazer das secoes 1 e 2 do sqlite e a parte de funcoes de ranking, para ver como escrevia o corpo do OVER.
-- Nesse caso, nao da para usar o GROUP BY, porque o exercicio pede o valor de cada linha.
-- Logo, nao da para juntar as linhas, visto que queremos saber esse valor. Por isso, usa o OVER para mostra o total do pedido em cada uma das linhas, sem agrupar.

SELECT 
i.pedido_id, 
pr.nome, 
i.quantidade*i.preco_unitario valor_linha, 
SUM(i.quantidade*i.preco_unitario) OVER (
    PARTITION BY i.pedido_id
) AS total_pedido
FROM itens i 
JOIN produtos pr ON i.produto_id=pr.id
;

-- G2
-- Tempo: 15min3s
-- Esperado (na mão, antes de rodar): Ana recebe os numeros 1, 2, 3 e 4, nas datas 2026-05-03, 2026-05-10, 2026-07-04 e 2026-08-11 respectivamente.
-- Conferência: bateu.
-- Consulta: Olhei o resumo/aula que pedi para o Gemini fazer, para ver como sao usadas as funcoes de ranking.
-- (explicação, quando o exercício pedir)

SELECT
c.nome, 
p.id,
p.data,
ROW_NUMBER() OVER (
    PARTITION BY c.id
    ORDER BY p.data
) AS numero
FROM pedidos p
JOIN clientes c ON p.cliente_id=c.id
;

-- G3
-- Tempo: 20min29s
-- Esperado (na mão, antes de rodar):
-- Nome | numero_pedidos | ROW_NUMBER | RANK | DENSE_RANK
-- Ana 4 1 1 1 
-- Bruno 3 2 2 2
-- Carla 2 3 3 3
-- Diego 2 4 3 3
-- Elisa 2 5 3 3
-- Fabio 1 6 6 4
-- Conferência: bateu.
-- Consulta: Pedi para o Gemini me falar
-- O ROW_NUMBER atribui um numero a cada um, sem pensar em ordem alguma. O primeiro que ele ver sera o 1, o segundo o 2 e assim por diante.
-- O RANK rankeia as linhas, porem saltando, baseado numa contagem.
-- O DENSE_RANK nao salta, ele rankea, mas nao salta.

SELECT
c.nome,
COUNT(p.id) numero_pedidos,
ROW_NUMBER() OVER (
    -- PARTITION BY c.id
    ORDER BY COUNT(p.id) DESC
) AS ROW_NUMBER,
RANK() OVER (
    -- PARTITION BY c.id
    ORDER BY COUNT(p.id) DESC
) AS RANK,
DENSE_RANK() OVER (
    -- PARTITION BY c.id
    ORDER BY COUNT(p.id) DESC
) AS DENSE_RANK
FROM clientes c
JOIN pedidos p ON c.id=p.cliente_id
GROUP BY c.id
ORDER BY numero_pedidos DESC
;

-- G4
-- Tempo: 9min50s
-- Esperado (na mão, antes de rodar): conferir no saida esperada
-- Conferência: bateu.
-- Consulta: Tirei uma duvida com o Claude sobre ordenacao dos resultados, pois tinha esquecido que tinha a coluna categoria na tabela de produtos.
-- (explicação, quando o exercício pedir)

SELECT
pr.categoria,
pr.nome,
SUM(i.quantidade*i.preco_unitario) receita_produto,
RANK() OVER (
    PARTITION BY pr.categoria
    ORDER BY SUM(i.quantidade*i.preco_unitario) DESC
) AS posicao
FROM itens i
JOIN produtos pr ON i.produto_id=pr.id
GROUP BY pr.id
ORDER BY pr.categoria, posicao
;

-- G5
-- Tempo: 18min30s
-- Esperado (na mão, antes de rodar): conferir no saida esperada
-- Conferência: bateu.
-- Consulta: Tive que mandar umas duvidas para o Gemini, pois realmente estava com problemas uma hora. Ele me ajudou a resolver.
-- (explicação, quando o exercício pedir)

SELECT
SUBSTR(p.data, 1, 7) mes,
SUM(i.quantidade*i.preco_unitario) receita_mes,
SUM(SUM(i.quantidade*i.preco_unitario)) OVER (
    ORDER BY SUBSTR(p.data, 1, 7)
)
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
GROUP BY SUBSTR(p.data, 1, 7)
ORDER BY SUBSTR(p.data, 1, 7)
;
