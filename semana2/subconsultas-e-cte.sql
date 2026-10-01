-- F1
-- Tempo: 4min28s
-- Esperado (na mão, antes de rodar): Media de 104,5. Produtos de id 3, 4, 6 e 9 passam acima.
-- Conferência: bateu.
-- Consulta: nenhuma
-- (explicação, quando o exercício pedir)

SELECT id, nome
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
;

-- F2
-- Tempo: 11min28s
-- Esperado (na mão, antes de rodar): Valor medio = 4250/14 ~= 303,57
-- Conferência: bateu.
-- Consulta: nenhuma
-- A conta calculada direto no itens da outro valor, pois ela nao eh feita com os pedidos agrupados, mas sim, feita de cada subpedido (pedido de certo produto).
-- Isso faz com que a media seja calculada usando o mesmo numerador (4250), porem um denominador diferente (22).

SELECT AVG(valor_pedido)
FROM (
SELECT SUM(i.quantidade*i.preco_unitario) valor_pedido
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
GROUP BY p.id
)
;

-- F3
-- Tempo: 2min35min
-- Esperado (na mão, antes de rodar): Valor medio = 4250/14 ~= 303,57
-- Conferência: bateu.
-- Consulta: nenhuma
-- (explicação, quando o exercício pedir)

WITH receitas_pedidos AS (
SELECT SUM(i.quantidade*i.preco_unitario) valor_pedido
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
GROUP BY p.id
)
SELECT AVG(valor_pedido)
FROM receitas_pedidos
;

-- F4
-- Tempo: 29min09s
-- Esperado (na mão, antes de rodar): Pedidos de id 5, 7, 9, 11 e 14 estao acima da media.
-- Conferência: bateu.
-- Consulta: Usei o ChatGPT para me ajudar com um erro inicial que tinha dado, e em seguida, o usei para tirar mais duvidas sobre erros e para me explicar conceitos (ele nao deu resposta, apenas esclareceu).
-- (explicação, quando o exercício pedir)

WITH valores_pedidos AS (
SELECT p.id, SUM(i.quantidade*i.preco_unitario) valor_pedido
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
GROUP BY p.id
),
media_pedidos AS (
SELECT AVG(valor_pedido) media
FROM valores_pedidos
)
SELECT id
FROM valores_pedidos
WHERE valor_pedido > (
SELECT media
FROM media_pedidos
)
;

-- F5
-- Tempo: Estourou os 15 minutos de teto. (Rodei a ultima coisa com 15min22s).
-- Esperado (na mão, antes de rodar): Igual o SAIDAS_ESPERADAS.md
-- Conferência: nao bateu.
-- Consulta: Nenhuma
-- Estava construindo a minha ultima tentativa e nao consegui testa-la, pois cometi um erro de falta de atencao, entao nao consegui ver se a minha tentativa ia dar certo, ou pelo menos gerar um resultado
-- O erro de falta de atencao foi que escrevi  WITH valores_pedidos AS ( SELECT p.id, c.id cliente_id, SUM(i.quantidade*i.pre com o c.id ao inves do p.cliente_id que era o que tinha em mente. Dormi feio!
-- Documento nao vai rodar por conta desse exercicio

WITH valores_pedidos AS (
SELECT p.id, c.id cliente_id, SUM(i.quantidade*i.preco_unitario) valor_pedido
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
GROUP BY p.id
),
media_clientes AS (
SELECT c.id, c.nome, AVG(SUM(i.quantidade*i.preco_unitario)) media_cliente
FROM itens i
JOIN pedidos p ON i.pedido_id=p.id
JOIN clientes c ON p.cliente_id=c.id
GROUP BY p.id
)
SELECT v.id, m.nome, v.valor_pedido, m.media_cliente
FROM valores_pedidos v
JOIN media_clientes m ON v.cliente_id=m.id
WHERE v.valor_pedido > m.media_cliente
ORDER BY v.id DESC
;