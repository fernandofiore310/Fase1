### Volta semana que vem
perguntas 2 e 3 de Segunda 12/10
O G3 com desempate apenas no ROW_NUMBER
A G5 com CTE
O cabecalho da H4
Two Sum em O(n), com a ideia vista no video e escrito sozinho
26 e 49 LeetCode

### Por que não dá para usar função de janela no WHERE? A resposta é a mesma da pergunta do apelido.
Nao se usa funcao de janela em um WHERE, pois funcoes de janela sao usadas no SELECT, que é executado depois do WHERE na hierarquia do sql. Logo, o where nao tera essa referencia e portanto nao pode acontecer.

### Quando você usa uma lista e quando usa um set? O set é mutável? E o que precisa ser imutável num set?
Usa-se lista quando se quer percorrer dados, mapear dados por posicao, percorrer cada dado, entre outros. O set por outro lado, eh usado apenas para leitura de dados, uma vez que ele salva a posicao de cada dado na memoria, oferecendo mais velocidade. Em um set, voce pode adicionar novos dados e remove-los. A unica coisa que eh imutavel em um set eh a posicao de um dado dentro dele, diferente de listas.

### O que o bisect_left devolve, e por que existe a checagem posicao < len(lista)?
O bisect_left deevolve o indice i que um numero n teria caso fosse adicionado a uma lista ordenada l. No caso, ele sera adicionado o mais a esquerda possivel. Pois, caso a posicao retronada pelo bisect_left for menor que o len(lista), isso significa que o numero n usado na funcao esta dentro da lista, algo que naquele exercicio em particular, nao ia acontecer.

### Dê um exemplo de WHERE que roda sem erro e dá a resposta errada, usando os números da base.
Um exemplo eh quando voce filtra pelo Where, dados que eram para ser filtrados pos agrupamento. No caso da base loja.db, quando se quer filtrar clientes com pedidos acima de 300 reais, caso se use o WHERE, vao surgir apenas dois pedidos, o com id 5 e com id 14. No entanto, sabemos que eles nao sao os unicos, visto que um pedido pode ter mais de um produto. Entao o certo eh agrupar por pedido com o group by, e filtrar o valor dos pedidos com o Having. Nesse caso, irao aparecer a quantidade certa de pedidos: 5, 7, 9, 11, 14 (ids).