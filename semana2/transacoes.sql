-- T1
-- Tempo: 19min26s
-- Esperado: O pedido nao deve continuar la apos o rollback
-- Conferência: bateu
-- Consulta: Gemini e a aula que ele gerou.
-- (explicação, quando o exercício pedir)

BEGIN TRANSACTION;

INSERT INTO pedidos VALUES 
(15,7,'2026-08-29');

SELECT *
FROM pedidos
WHERE cliente_id=7
;

ROLLBACK;

SELECT *
FROM pedidos
WHERE cliente_id=7
;

-- T2
-- Tempo: 6min34s
-- Esperado: 
-- Conferência: bateu
-- Consulta: Gemini e a aula que ele gerou.
-- (explicação, quando o exercício pedir)

BEGIN TRANSACTION;

INSERT INTO pedidos VALUES 
(15,7,'2026-08-29');
INSERT INTO itens VALUES
(15, 3, 1, 120),
(15, 5, 2, 70);

SELECT *
FROM itens
WHERE pedido_id=15
;

COMMIT;

SELECT *
FROM itens
WHERE pedido_id=15
;

-- T3
-- Tempo: 6min1s
-- Esperado: 
-- Conferência: bateu
-- Consulta: Gemini e a aula que ele gerou.
-- O problema seria que a base teria ficado com um pedido novo, no entanto, esse pedido nao teria seu item.
-- Logo, a base ficaria completamente incompleta, visto que falaria que um pedido foi feito, no entanto esse pedido nao teria nem produto, nem preco.

BEGIN TRANSACTION;

INSERT INTO pedidos VALUES
(16,7,'2026-08-31')
;

INSERT INTO itens VALUES
(16, 1, 1, 80),
(16, 1, 2, 80);

-- Runtime error: UNIQUE constraint failed: itens.pedido_id, itens.produto_id (19)

SELECT *
FROM pedidos
WHERE id=16
;

ROLLBACK;

SELECT *
FROM pedidos
WHERE id=16
;