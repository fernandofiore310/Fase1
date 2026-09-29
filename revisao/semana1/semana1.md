## Qual a ordem de execução de um query, e o que ela explica sobre apelidos?
A ordem é a seguinte:
1. FROM e JOIN
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT e OFFSET

O que isso explica sobre apelidos é o fato de que, quando damos apelido para algo no select, nao podemos usa-lo no GROUP BY por exemplo, visto que, essa função é executada antes do SELECT, e portanto, a variável ainda não foi declarada.

## O que acontece com as linhas quando se combinam duas tabelas sem condição? Quantas saíram de pedidos com itens, e por quê?
Quando combinamos duas tabelas sem condição, basicamente, se cruza uma linha da primeira tabela com todas as linhas da segunda tabela, e isso para todas as linhas da primeira tabela. Logo, quando se combina as tabelas de pedidos com itens, vai gerar uma tabela com 14x22 linhas, isso porque, por nao ter uma condicao, o sql entende que deve juntar todas as linhas entre si.

## Qual é a diferença entre WHERE e HAVING? Dê um exemplo em que um WHERE roda sem erro e dá a resposta errada.
Ambos são filtros, no entanto, o WHERE é uma espécie de filtro inicial, aplicado a todas as linhas da primeira tabela gerada a partir de FROM e JOINs. Já o HAVING é um filtro aplicado logo após o agrupamento de linhas com GROUP BY.
Um exemplo em um uso do WHERE que não dá erro mas gera sáida, é quando por exemplo, temos mais de uma linha com uma característica em comum que queremos agrupar. Se usarmos o WHERE ao inves de HAVING nesse caso, vamos filtrar as linhas individualmente, o que pode remover algumas amostras importantes antes do agrupamento (já que o WHERE é executado antes do GROUP BY).

## Qual é a regra que o GROUP BY impõe ao SELECT, e o que o SQLite faz quando ela é violada?
O GROUP BY implica ao SELECT que ele deva selecionar dados agrupados/agregados para serem exibidos na tabela final. Isso porque, caso os dados não sejam agrupados, você terá mais de um valor para uma linha da tabela, o que faria o SQLite subir um alerta de erro. 

## Por que agrupar por id, e não por nome?
Porque é possível que existam clientes com o mesmo nome, o que pode fazer com que dois clientes distintos sejam agrupados. Em outras palavras, faz com que clientes distintos sejam tratados como a mesma coisa.
