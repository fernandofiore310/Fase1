-- Exercicio 1 - Feito em 6min3s

sqlite> SELECT nome, preco FROM produtos
   ...> WHERE preco > 100 AND categoria = 'Treino'
   ...> ORDER BY preco DESC
   ...> ;

-- Minha Saida
Snorkel frontal|180.0
Pé de pato|150.0
Prancha de treino|120.0

-- Saída correta
**1**
| nome | preco |
|---|---|
| Snorkel frontal | 180 |
| Pé de pato | 150 |
| Prancha de treino | 120 |

-- Exercicio 2 - Estourou os 10 minutos

-- Minha ultima tentativa
sqlite> SELECT categoria, COUNT(id), AVG(preco) FROM produtos
   ...> GROUP BY categoria
   ...> ;

-- Minha Saida
Acessórios|3|48.3333333333333
Química|3|126.666666666667
Treino|4|130.0

-- Saida correta
| categoria | qtd | preco_medio |
|---|---|---|
| Acessórios | 3 | 48.33 |
| Química | 3 | 126.67 |
| Treino | 4 | 130.0 |

-- Exercicio 3 - Feito em 5min26s

-- Minha ultima tentativa
 SELECT cidade, COUNT(id) FROM clientes
   ...> GROUP BY cidade
   ...> ORDER BY cidade
   ...> ;

-- Minha Saida
Campinas|2
Santos|2
Sorocaba|1
São Paulo|3

-- Saida correta
| cidade | clientes |
|---|---|
| Campinas | 2 |
| Santos | 2 |
| São Paulo | 3 |

-- Exercicio 4 - Estourou os 10 minutos

-- Minha ultima tentativa
SELECT pedidos.id, clientes.nome, pedidos.data FROM pedidos, clientes
   ...> WHERE clientes.id = pedidos.cliente_id
   ...> ORDER BY pedidos.id
   ...> ;

-- Minha Saida
1|Ana|2026-05-03
2|Bruno|2026-05-10
3|Carla|2026-05-21
4|Ana|2026-06-02
5|Diego|2026-06-15
6|Elisa|2026-06-28
7|Ana|2026-07-04
8|Bruno|2026-07-12
9|Fábio|2026-07-19
10|Carla|2026-07-30
11|Diego|2026-08-05
12|Ana|2026-08-11
13|Elisa|2026-08-20
14|Bruno|2026-08-27

-- Saida correta
| id | cliente | data | total |
|---|---|---|---|
| 1 | Ana | 2026-05-03 | 200 |
| 2 | Bruno | 2026-05-10 | 300 |
| 3 | Carla | 2026-05-21 | 270 |
| 4 | Ana | 2026-06-02 | 90 |
| 5 | Diego | 2026-06-15 | 670 |
| 6 | Elisa | 2026-06-28 | 70 |
| 7 | Ana | 2026-07-04 | 380 |
| 8 | Bruno | 2026-07-12 | 80 |
| 9 | Fábio | 2026-07-19 | 440 |
| 10 | Carla | 2026-07-30 | 80 |
| 11 | Diego | 2026-08-05 | 390 |
| 12 | Ana | 2026-08-11 | 180 |
| 13 | Elisa | 2026-08-20 | 200 |
| 14 | Bruno | 2026-08-27 | 900 |

-- Exercicio 5 - Feito em 5min30s

-- Minha ultima tentativa
sqlite> SELECT clientes.nome FROM clientes
   ...> WHERE clientes.id NOT IN (SELECT cliente_id FROM pedidos)
   ...> ;

-- Minha Saida
Gabi
Hugo

-- Saida correta
| nome |
|---|
| Gabi |
| Hugo |

-- Exercicio 6 - Estourou os 10 minutos

-- Minha ultima tentativa
sqlite> SELECT pedidos.id, itens.quantidade * itens.preco_unitario FROM pedidos, itens
   ...> WHERE pedidos.id IN (SELECT DISTINCT itens.pedido_id FROM itens)
   ...> ;
1|160.0
1|40.0
1|300.0
1|120.0
1|150.0
1|90.0
1|600.0
1|70.0
1|70.0
1|300.0
1|80.0
1|45.0
1|35.0
1|300.0
1|140.0
1|80.0
1|300.0
1|90.0
1|180.0
1|120.0
1|80.0
1|900.0
2|160.0
2|40.0
2|300.0
2|120.0
2|150.0
2|90.0
2|600.0
2|70.0
2|70.0
2|300.0
2|80.0
2|45.0
2|35.0
2|300.0
2|140.0
2|80.0
2|300.0
2|90.0
2|180.0
2|120.0
2|80.0
2|900.0
3|160.0
3|40.0
3|300.0
3|120.0
3|150.0
3|90.0
3|600.0
3|70.0
3|70.0
3|300.0
3|80.0
3|45.0
3|35.0
3|300.0
3|140.0
3|80.0
3|300.0
3|90.0
3|180.0
3|120.0
3|80.0
3|900.0
4|160.0
4|40.0
4|300.0
4|120.0
4|150.0
4|90.0
4|600.0
4|70.0
4|70.0
4|300.0
4|80.0
4|45.0
4|35.0
4|300.0
4|140.0
4|80.0
4|300.0
4|90.0
4|180.0
4|120.0
4|80.0
4|900.0
5|160.0
5|40.0
5|300.0
5|120.0
5|150.0
5|90.0
5|600.0
5|70.0
5|70.0
5|300.0
5|80.0
5|45.0
5|35.0
5|300.0
5|140.0
5|80.0
5|300.0
5|90.0
5|180.0
5|120.0
5|80.0
5|900.0
6|160.0
6|40.0
6|300.0
6|120.0
6|150.0
6|90.0
6|600.0
6|70.0
6|70.0
6|300.0
6|80.0
6|45.0
6|35.0
6|300.0
6|140.0
6|80.0
6|300.0
6|90.0
6|180.0
6|120.0
6|80.0
6|900.0
7|160.0
7|40.0
7|300.0
7|120.0
7|150.0
7|90.0
7|600.0
7|70.0
7|70.0
7|300.0
7|80.0
7|45.0
7|35.0
7|300.0
7|140.0
7|80.0
7|300.0
7|90.0
7|180.0
7|120.0
7|80.0
7|900.0
8|160.0
8|40.0
8|300.0
8|120.0
8|150.0
8|90.0
8|600.0
8|70.0
8|70.0
8|300.0
8|80.0
8|45.0
8|35.0
8|300.0
8|140.0
8|80.0
8|300.0
8|90.0
8|180.0
8|120.0
8|80.0
8|900.0
9|160.0
9|40.0
9|300.0
9|120.0
9|150.0
9|90.0
9|600.0
9|70.0
9|70.0
9|300.0
9|80.0
9|45.0
9|35.0
9|300.0
9|140.0
9|80.0
9|300.0
9|90.0
9|180.0
9|120.0
9|80.0
9|900.0
10|160.0
10|40.0
10|300.0
10|120.0
10|150.0
10|90.0
10|600.0
10|70.0
10|70.0
10|300.0
10|80.0
10|45.0
10|35.0
10|300.0
10|140.0
10|80.0
10|300.0
10|90.0
10|180.0
10|120.0
10|80.0
10|900.0
11|160.0
11|40.0
11|300.0
11|120.0
11|150.0
11|90.0
11|600.0
11|70.0
11|70.0
11|300.0
11|80.0
11|45.0
11|35.0
11|300.0
11|140.0
11|80.0
11|300.0
11|90.0
11|180.0
11|120.0
11|80.0
11|900.0
12|160.0
12|40.0
12|300.0
12|120.0
12|150.0
12|90.0
12|600.0
12|70.0
12|70.0
12|300.0
12|80.0
12|45.0
12|35.0
12|300.0
12|140.0
12|80.0
12|300.0
12|90.0
12|180.0
12|120.0
12|80.0
12|900.0
13|160.0
13|40.0
13|300.0
13|120.0
13|150.0
13|90.0
13|600.0
13|70.0
13|70.0
13|300.0
13|80.0
13|45.0
13|35.0
13|300.0
13|140.0
13|80.0
13|300.0
13|90.0
13|180.0
13|120.0
13|80.0
13|900.0
14|160.0
14|40.0
14|300.0
14|120.0
14|150.0
14|90.0
14|600.0
14|70.0
14|70.0
14|300.0
14|80.0
14|45.0
14|35.0
14|300.0
14|140.0
14|80.0
14|300.0
14|90.0
14|180.0
14|120.0
14|80.0
14|900.0
sqlite> SELECT pedidos.id, itens.quantidade * itens.preco_unitario FROM pedidos, itens
   ...> WHERE pedidos.id IN (SELECT DISTINCT itens.pedido_id FROM itens)
   ...> GROUP BY pedidos.id
   ...> ;
1|160.0
2|160.0
3|160.0
4|160.0
5|160.0
6|160.0
7|160.0
8|160.0
9|160.0
10|160.0
11|160.0
12|160.0
13|160.0
14|160.0

-- Saida correta
| pedido | cliente | valor | media_cliente |
|---|---|---|---|
| 3 | Carla | 270 | 175.0 |
| 5 | Diego | 670 | 530.0 |
| 7 | Ana | 380 | 212.5 |
| 13 | Elisa | 200 | 135.0 |
| 14 | Bruno | 900 | 426.67 |


-- Exercicio 7
-- Sinceramente, nao sei muito por onde comecar. Eu nao sei se escolho o produto da tabela produto ou da tabela itens.
-- Alem disso, como foi visto no exercicio anterior, eu nao sei muito bem como calcular as receitas ainda sem pelo menos repetir ela paracada outra coisa que estou listando.
-- Nao lembro muito como poderia ordenar cada valor de receita


-- Exercicio 8
-- Realmente nao sei como fazer. 
-- Teria que dar um jeito de pegar cada data de pedidos, separar o mes, e ordenar a tabela resultante por esse valor.
-- Novamente, assim como nos outros exercicios, eu teria problemas em como calcular essa recieta, visto que ela vem na tabela itens, e teria que meio que unir com os valores em outras tabelas.