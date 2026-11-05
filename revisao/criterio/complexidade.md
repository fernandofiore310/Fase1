## Função print_result()

### A complexidade em O, dizendo o que é cada letra.

A funcao print_result é O(c*l + l), onde:
    - c: número de colunas que a query resultante tem
    - l: número de linhas que a query resultante tem

### Quais laços geram cada fator
O primeiro laço, que percorre a lista de colunas, gera esse fator c. E o laço dentro desse laço, que percorre as linhas, gera o fator c*l.
O '+ l' é gerado pelo laço que printa linha por linha, e mais uma vez, percorre as tuplas de cada linha dentro da lista de tuplas.

## Função load_games()

### A complexidade em O, dizendo o que é cada letra.
A complexidade da funcao é O(c*g), onde:
    - c: é o numero de "paginas" que vao vir da API baseada em onde o cursor está apontando. Esse numero seria equivalente ao total de jogos que tiveram em uma temporada (ou temporadas, dependendo da busca do usuario) dividido pelo numero de jgoos que vem por pagina de busca.
    - g: É o número de jogos que vem por página resultante de dados. No nosso caso, como estamos usando p per_page como 100, g=100

### Quais laços geram cada fator
O while c is not None gera o fator c, e o for g in games gera o fator g.

### O que domina o tempo na prática na load_games
Na teoria, considerando a temporada 25-26 (2025) para facilitar, a quantidade de tempo gasta para coletar todos os dados e carrega-los na base de dados nao seria muito grande, visto que teriamos cerca de 1322 jogos, com 100 jogos por pagina/requisicao para API. Logo, seriam feitas cerca de 14 consultas apenas.
Se por exemplo, quisessemos pegar os jogos de duas temporadas, o fator c ia aumentar, visto que teriamos mais jogos, e portanto mais paginas. Como g eh fixo nesse caso, seria uma mudanca linear. E se pararmos pra pensar, quando g diminui por exemplo, consequentemente c aumenta, o que mantem o mesmo nivel de complexidade.
No entanto, na pratica, o que realmente consome tempo nessa parte, eh o limite de requisicoes que tenho por usar o plano gratuito da API. Isso me permite com que eu faca 5 requisicoes por minuto.
Logo, se tenho 14 consultas para fazer, esse limite acaba adicionando cerca de 3 minutos a mais para carregar os jogos, comparando com o caso que esse limite nao existe.
Logo, esse limite de requisicoes eh, o que na pratica, domina o tempo.