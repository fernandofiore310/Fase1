Critério de saída: você escreve uma query com janela sem consultar; resolve conflito de merge sem pânico; explica a complexidade da sua própria solução.

### Query de janela sem consulta
Aqui, passou parcialmente. 
O objetivo era escrever a seguinte query:
Para a temporada regular de 2025, cada time e cada jogo, em ordem de data, mostre:
a data;
se o time venceu (1 ou 0);
as vitórias acumuladas até aquele jogo;
os dias desde o jogo anterior do time.

Consegui escrever tudo, sem problemas. O unico problema que nao consegui resolver foi os dias desde o jogo anterior. Na minha cabeca, eu precisaria usar alguma funcao que nao vi.
Pensei em usar o SBSTR para pegar a parte da data que queria. No entanto, nao sabia como subtrai-las como datas normais e tambem nao sabia como pegar a data anterior. Pensei em usar o between e filtrar para pegar apenas a row anterior.

### Resolver conflito do merge
Aqui, passou. Resolvi tudo via terminal. Usei o nano para editar o arquivo conflitante e dei um merge --continue.

### Complexidade de funcoes
Aqui acredito que passou tambem. Consegui, acredito eu, explicar a complexidade correta das funcoes print_results e load_games.

