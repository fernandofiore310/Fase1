### Volta na segunda
Questoes 6 e 8 desse arquivo. Alem de: 
G3 com desempate;
G5 reescrita com CTE;
cabeçalho da H4.

### O que o SQLite faz quando uma coluna do SELECT não está nem no GROUP BY nem dentro de uma agregação?
O SQLite vai apenas escolher o primeiro valor calculado e colocar ele como valor daquela coluna. Entao, na nossa base, caso queria calcular a receita, mas esqueca de usar o SUM, ele apenas vai colocar a primeira receita que ele calcular como valor da coluna.

### Dê um exemplo concreto, com números da base, de um WHERE que roda sem erro e dá a resposta errada.
Imagine que queremos uma query que retorne os pedidos com valor total acima de 300 reais. Caso se use o WHERE para filtrar pelo valor, ele vai rodar antes da funcao de agrupamento. E sem o agrupamento, o WHERE vai considerar apenas a parte do pedido de um produto especifico, e nao o produto inteiro. Logo, ele vai acabar tirando do resultado final pedidos que nao verdade poderiam ter valor total de mais de 300 reais.

### Em quais cláusulas um apelido do SELECT pode ser usado, e por quê?
So podem ser usadas nas clausulas de ORDER BY, LIMIT e OFFSET. Isso porque, essas clausulas sao executadas depois da execucao do SELECT pelo SQLite.

### Como ROW_NUMBER, RANK e DENSE_RANK tratam um empate?
ROW_NUMBER ignora o empate, apenas rankeia em ordem. O RANK considera o empate e realiza um salto (2o, 2o, 4o) e o DENSE_RANK considera o empate e nao realiza o salto (2o, 2o, 3o).

### O que muda num SUM() OVER (...) com e sem ORDER BY dentro do OVER?
O que muda eh que o ORDER BY vai ser responsavel por colocar um limite na soma. Logo, com ORDER BY, a soma vai ser realizada do dado inicial ate o dado que esta sendo manipulado no momento. No outro caso, ele nao vai considerar limite algum, e para todos os casos, vai fazer a soma de todos os dados, deixando o mesmo valor em todas as linhas do resultado.

### Por que não dá para usar uma função de janela no WHERE?
Nao eh possivel usar uma funcao de janela no WHERE pois (esqueci)

### Quando você usaria uma lista e quando um set? Por que não usar set sempre?
Eu usaria um set caso eu quisesse guardar dados que eu gostaria de acessar rapidamente. Ja a lista eu usaria caso quisesse guardar dados em que a ordem importa, dados repetidos e dados que eu precisasse acessar posicoes especificas. Nao se usa set sempre pois ele eh estatico. Os dados que ficam la sao imutaveis e sao apenas guardados para acesso rapido.

### O que o bisect_left devolve, e por que a checagem posicao < len(lista) existe?
(Nao deu tempo de responder, mas provavelmente nao ia conseguir responder)