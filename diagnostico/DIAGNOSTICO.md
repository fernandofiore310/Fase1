# Diagnóstico a frio — Fase 1 · quarta, 23/09

Tempo total: 2h15. Depois, o LOG.

## Regras

- Nenhuma consulta: nem documentação, nem busca, nem IA.
- Teto por pergunta. Se estourar, anote até onde chegou e passe para a próxima.
- Anote o tempo de cada pergunta. Cronômetro ligado, não estimativa.
- Uma query que roda sem erro **não** é uma query certa. Confira o resultado contra
  `SAIDAS-ESPERADAS.md`, mas só **depois** de dar a query por terminada. Nomes de coluna
  podem variar; linhas, valores e ordem não.
- Salve cada query num arquivo `respostas.sql`, com o tempo em comentário.

---

## Parte 1 — SQL · 90 min · teto de 10 min por pergunta

Carregar a base: `sqlite3 loja.db < loja.sql`. Se o comando `sqlite3` não existir na sua
máquina, carregar a base pelo módulo `sqlite3` do Python faz parte do diagnóstico.

Esquema: `clientes`, `produtos`, `pedidos`, `itens`. Leia o `loja.sql` antes de começar;
esse tempo não conta. O valor de um item é `quantidade * preco_unitario`.

1. Nome e preço dos produtos da categoria `Treino` com preço acima de 100, do mais caro
   ao mais barato.
2. Para cada categoria: quantidade de produtos e preço médio, arredondado a duas casas.
   Ordenar por categoria.
3. Cidades com mais de um cliente cadastrado, com a contagem. Ordenar por cidade.
4. Para cada pedido: id, nome do cliente, data e valor total. Ordenar por id.
5. Nomes dos clientes que nunca fizeram pedido.
6. Pedidos cujo valor total é maior que a média dos pedidos do próprio cliente. Mostrar
   id do pedido, nome do cliente, valor do pedido e média do cliente arredondada a duas
   casas. Ordenar por id.
7. Receita de cada produto e sua posição dentro da categoria (1 = maior receita).
   Produtos sem venda ficam de fora. Ordenar por categoria e posição.
8. Receita por mês (formato `AAAA-MM`) e receita acumulada até aquele mês. Ordenar por
   mês.

## Parte 2 — HTTP · 30 min

Use `requests`, contra a API pública do GitHub (`https://api.github.com`), sem
autenticação.

1. Buscar os dados do repositório `fernandofiore310/Fase0` e imprimir o número de
   estrelas e a data de criação.
2. Buscar um repositório que não existe. O programa não pode quebrar. Deve imprimir uma
   mensagem que diga o que aconteceu.
3. Imprimir quantas requisições ainda restam no seu limite de taxa e quando o limite
   reinicia, em horário legível.
4. Listar os repositórios públicos do usuário `torvalds`, cinco por página, e imprimir
   apenas os nomes da **segunda** página.

Registre também o que você não sabia se existia, não só o que não conseguiu fazer.

## Parte 3 — Git · 15 min

Num diretório novo, fora de qualquer repositório:

1. Criar um repositório com um arquivo de uma linha e fazer o commit.
2. Criar duas branches, alterar **a mesma linha** de forma diferente em cada uma e fazer
   o commit nas duas.
3. Fazer o merge de uma na outra, resolver o conflito e concluir.
4. Mostrar o histórico em forma de grafo.

---

## No LOG

Degrau de SQL onde você parou, tempo por pergunta, e as três coisas que mais te
surpreenderam no diagnóstico, seja por saber ou por não saber.
