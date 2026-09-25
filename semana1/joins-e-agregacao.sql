-- A1
-- Tempo: 4min45s
-- Esperado (na mão, antes de rodar): eram esperadas 308 linhas, visto que quando se faz a combinacao apenas com o FROM, o SQL combina cada linha de uma tabela com cada linha de outra (linha vezes linha).
-- Conferência: bateu.
-- Consulta: nenhuma
-- (explicação, quando o exercício pedir)

SELECT COUNT(*) FROM pedidos, itens;

-- A2
-- Tempo: cerca de 5 minutos
-- Esperado (na mão, antes de rodar): era esperada a mesma saida da minha resposta ao exercicio 4 do diagnostico
-- Conferência: bateu.
-- Consulta: nenhuma
-- Combinar com WHERE e virgula voce esta apenas filtrando as linhas das tabelas que voce selecionou, sem junta-las
-- Quando se usa o JOIN, voce esta literalmente unindo as tabelas atraves das linhas que possuem a mesma condicao garantida pelo ON.

SELECT pedidos.id, clientes.nome, pedidos.data
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
ORDER BY pedidos.id
;

-- A3
-- Tempo: 11min16s
-- Esperado (na mão, antes de rodar): eu esperava que fosse o mesmo numero de linhas, uma vez que o enunciado pedia para listar cada linha de item. Alem disso, como a primeira linha que passei no SELECT era o pedido_id da tabela itens, sabia que ia passar exatamente todos os pedidos que estavam em itens.
-- Conferência: bateu.
-- Consulta: perguntei ao Claude se existia a possibilidade de realizar JOIN seguido de JOIN.
-- (explicação, quando o exercício pedir)

SELECT itens.pedido_id, clientes.nome, produtos.nome, itens.quantidade, (itens.quantidade*itens.preco_unitario)
FROM itens
INNER JOIN produtos ON itens.produto_id = produtos.id
INNER JOIN pedidos ON itens.pedido_id = pedidos.id
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
;

-- A4
-- Tempo: 2min52s
-- Esperado (na mão, antes de rodar): achei que so escrever o nome que eu queria do lado do nome da tabela ou da coluna nao funcionaria. Testei de primeira e funcionou.
-- Conferência: bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT i.pedido_id, c.nome, pr.nome, i.quantidade, (i.quantidade*i.preco_unitario) valor
FROM itens i
INNER JOIN produtos pr ON i.produto_id = pr.id
INNER JOIN pedidos p ON i.pedido_id = p.id
INNER JOIN clientes c ON p.cliente_id = c.id
;

-- B1
-- Tempo: 3min36s
-- Esperado (na mão, antes de rodar): quantidade de cada pedido acompanhada do id do pedido. Pedidos 1, 5 e 13 deveriam ter 2 pedidos cada.
-- Conferência: bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT pedido_id, COUNT(pedido_id) quantidade
FROM itens
GROUP BY pedido_id
;

-- B2
-- Tempo: 4min45s
-- Esperado (na mão, antes de rodar): esperava a saida do gabarito.
-- Conferência: Nao bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)
-- entregue, no tempo, porem esta errada

SELECT i.pedido_id, c.nome, p.data, (i.quantidade*i.preco_unitario) valor_total
FROM itens i
INNER JOIN pedidos p ON i.pedido_id = p.id
INNER JOIN clientes c ON p.cliente_id = c.id
GROUP BY i.pedido_id
ORDER BY i.pedido_id
;

--versao correta (feito em 5min10s)
SELECT p.id, c.nome, p.data, SUM(i.quantidade*i.preco_unitario) valor_total
FROM itens i
JOIN pedidos p ON i.pedido_id = p.id
JOIN clientes c ON p.cliente_id = c.id
GROUP BY p.id
ORDER BY p.id

-- B3
-- Tempo: 5min9s
-- Esperado (na mão, antes de rodar): Ana 850 de gasto e soma total 4250.
-- Conferência: Bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT c.nome, SUM(i.quantidade*i.preco_unitario) total_gasto
FROM itens i
INNER JOIN pedidos p ON i.pedido_id = p.id
INNER JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.id --Revisão 25/09: agrupava por nome; agora agrupa por id
ORDER BY total_gasto DESC
;

-- B4
-- Tempo: 3min12s
-- Esperado (na mão, antes de rodar): 8 unidades de Cloro vendidas.
-- Conferência: Bateu.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT pr.nome, SUM(i.quantidade) unidades_vendidas
FROM itens i
INNER JOIN produtos pr ON i.produto_id = pr.id
GROUP BY pr.id --Revisão 25/09: agrupava por nome; agora agrupa por id
ORDER BY unidades_vendidas DESC
;

-- C1
-- Tempo: 6min10s
-- Esperado (na mão, antes de rodar): -
-- Conferência: Bateu. Rodei a tabela sem o HAVING e era realmente o que calculei.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT c.nome, COUNT(p.cliente_id) numero_pedidos 
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.id --Revisão 25/09: agrupava por nome; agora agrupa por id
HAVING numero_pedidos > 2
;

-- C2
-- Tempo: 5min10s
-- Esperado (na mão, antes de rodar): -
-- Conferência: Bateu.
-- Consulta: Nenhuma
-- O WHERE eh a segunda coisa a ser rodada. Caso tente usar a variavel valor_total com o WHERE, o codigo vai quebrar, visto que a variavel valor total (SUM) ainda nao foi executada.
-- Nao faz sentido filtrar com o WHERE nesse caso, visto que quando voce pede pedidos, ja sei que vou ter que agrupar, e se agrupar, vou ter que calcular o valor total com SUM, e se uso o SUM e agrupo, quer dizer que vou ter que realizar o filtro pos agrupamento (HAVING).
-- O HAVING retorna 5 pedidos. O WHERE (usado da maneira que nao crasha) retorna 2. O WHERE faz alguns pedidos sumirem pois ele filtra antes do agrupamento. Logo, pedidos com mais de um produto, acabam tendo seu total ignorado, visto que o WHERE trabalha com cada pedido de um produto individualmente. Logo, se a receita daquele produto especifico nao for maior que 300, o WHERE descarta.

SELECT pedido_id, SUM(quantidade*preco_unitario) valor_total
FROM itens
-- WHERE quantidade*preco_unitario > 300
GROUP BY pedido_id
HAVING valor_total > 300
;

-- D1
-- Tempo: 14min5s
-- Esperado (na mão, antes de rodar): Soma das receitas 4250.
-- Conferência: Bateu. Fiz a soma das receitas na calculadora.
-- Consulta: Nenhuma
-- (explicação, quando o exercício pedir)

SELECT pr.nome, pr.categoria, SUM(i.quantidade*i.preco_unitario) receita
FROM produtos pr
JOIN itens i ON pr.id = i.produto_id
GROUP BY pr.id --Revisão 25/09: agrupava por nome; agora agrupa por id
HAVING receita > 0
ORDER BY pr.categoria
;

-- D2
-- Tempo: 7min40s
-- Esperado (na mão, antes de rodar): Soma das receitas 4250.
-- Conferência: Bateu. Fiz a soma das receitas na calculadora.
-- Consulta: Apenas documentacao do sqlite sobre o SUBSTR()
-- (explicação, quando o exercício pedir)

SELECT SUBSTR(p.data, 1, 7) mes, SUM(i.quantidade*i.preco_unitario) receita
FROM itens i
JOIN pedidos p ON i.pedido_id = p.id
GROUP BY mes
ORDER BY mes
;