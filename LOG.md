# LOG 

### 2026-09-23 — Diagnóstico de SQL e outros(1h45min)

Antes de falar sobre o diagnostico, vou falar da parte que mais consumiu meu tempo hoje: a preparacao de toda a estrutura da Fase 1.

Assim como aquilo que sempre reclamo de mim, que fico me aprofundando em teoria, hoje fiz o mesmo com o WSL. Fui atras de como funciona, diferencas de organizacao de sistemas entre Linux e Windows, raizes, caminho de usuario, disco rigido virtual no linux, ext4, chaves ssh nos repositorios git, conceitos de git e alguns conceitos de wsl a mais. E isso acabou consumindo bastante do meu tempo e disposicao. Pois consumiu grande parte da minha tarde (mais de 2 horas), o que me forcou a comecar o diagnostico as 22h.

Em relacao as conferencias que deveria fazer, que era basicamente checar se o venv e o lojas.db estavam sendo ignorados, fiz bem rapido. No entanto, esqueci de ativar o ambiente virtual antes de comecar o diagnostico.

Em seguida li o loja.sql, para entender a estrutura. Confesso que nao entendi 100% a tabela de itens. Tipo, eh como se ela fosse os pedidos, mas porque pode existir pedidos com mais de um produto, essa tabela existe (nao tenho certeza se é exatamente assim que funciona).
Alem disso, sei que a tabela itens tem duas chaves primárias, pois ela tem que "keep track" tanto de produtos, quanto pedidos, pelo mesmo motivo que falei na frase anterior.
Em relação a onde esta o valor de um item, realmente eu não sabia a resposta. Na minha cabeça, nao estava em nenhum, visto que ele tinha que ser calculado (quantidade*preco unitario).

Já aviso que, antes de falar cada questao do diagnostico, todas eu tive que revisar material na internet. Usei o link (https://www.w3schools.com/sql/) No entanto, ele ficava dando virus ao meu computador. Então, mandei esse link para o Gemini, e pedi que ele fizesse o papel desse site, exibindo as coisas que nele estavam.

1: Acredito que a primeira tenha sido "tranquila". Nao lembrava do WHERE e do ORDER BY. O site me ajudou a lembrar dessas funcoes, que me ajudaram a fazer. Mas ja adianto, nem o SELECT estou 100% confiante no seu uso. Ele basicamente representa o que sera exibido na resposta?

2: A segunda, achei no finalzinho a parte de Group by no site, que me fez lembrar a funcao e aplica-la. No entanto, como estava sem tempo, acabei nao conseguindo arredondar os numeros.

3: A terceira fiz rápido, no entanto, quando estava corrigindo, percebi que nao li o enunciado com atencao, e isso acabou me prejudicando, já que achei que era maior que 0, e nao maior que 1, o que acabou deixando os resultados diferentes.

4: Na 4, mais uma vez consultando o material, lembrei que da para selecionar as coisas de mais de um tipo de tabela. Lembro ainda, que dava para atribuir um nome mais curtos a cada tabela para facilitar a escrita de codigo, mas nao sei como fazer. Ai de resto, foi usar o where para linkar as coisas e lista-las e ordena las com o ORDER BY, que assim como os outros, lembrei do seu funcionamento atraves de consulta.

5: Durante a minha consulta com o material do gemini, lembrei que existia essa funcioanlidade IN e essa chamada de uma sub-tabela de auxilio. Ai, segui minha intuicao e consegui completar o exercicio. Assim que acabei, realizei um teste, onde escrevi um codigo que dava a tabela oposta, de modo a confirmar que era Gabi e Hugo que nao haviam realizado pedidos.

6: Aqui foi realmente a ultima que tentei fazer algo, mas sem resultado importante. Como voce pode ver, o resultado ficou gigante. Entendi que para cada id que listei, a conta do valor se repetia, so nao entendi muito por que isso acontece. Alem disso, quando tentei usar o select distinct e o group by, ele agrupou, mas so retornou o primeiro valor final calculado. Tambem nao entendi por que isso acontecei.

7 e 8: Essas duas confesso que estava muito cansado e nao tinha muita ideia de como faze-las. Coloquei um resumo do que pensei no respostas.sql para ver se conseguia pensar em algo.

Conclusao do diagnostico: Acredito que nao fui bem. Por mais que tenha ideo melhor que meu primeiro diagnostico de python, sinto que ate os exercicios que acertei, nao me senti 100% confiante e com a resposta na ponta da lingua sabe? Por isso mesmo que acho que vou precisar de uma aula para relembrar tudo isso e entender a estrutura e logica por tras do sql.


### 2026-09-24 — Joins e agregação (4h)

**O que fiz**
Comecei o dia realizando a leitura do material de sql e entendendo como cada uma das coisas funcionavam. A partir dai, as coisas comecaram a ficar mais claras na minha cabeca. Nao vou falar que sou um experto em sql, pois ainda tem chao. Mas ja melhorou. Entender a ordem de execucao ajudou bastante.
Depois parti para os exercicios. TODOS bateram, exceto o B2, onde dormi ali no calculo de receita. Na hora, tinha esquecido que cada pedido podia ter mais de um produto. Logo, quando agrupei por pedido, esqueci que cada pedido poderia ter mais de uma receita proveniente de produtos diferentes. Logo, quando rodei, nao deu erro, pareceu tudo bem, mas na verdade o sql tinha pego apenas a receita inicial (so deu certo para os pedidos que tinham um produto). Na hora que estava corrigindo percebi o erro. Nos exercicios seguintes nao cometi mais o mesmo erro. 
Nos outros exercicios, passei oparte do tempo testando coisas, mudando a forma de escrever o JOIN, "printando" algumas tabelas mais rusticas (por exemplo logo apo o JOIN) para entender a estrutura.

**Onde travei**
Falar que nao travei muito. O unico ponto foi naquela parte em que eu tinha que colocar o WHERE errado, e e u nao sabia fazer.

**O que ainda não entendo**
Nao eh que nao entendo, mas sinto que preciso "printar" mais coisas. Pois quando comeco a escrever um codigo grande, vou me perdendo no raciocinio, e as vezes na hora de agregar fica confuso. Entao sinto que preciso ir com calma, sempre vendo os resultados que me retornam.

**Sensação vs. resultado**
Acredito que fui bem.

**Pendências**
Terminar o diagnostico.


### 2026-09-25 — Teste e correcoes (2h)

**O que fiz**
Comecei pelo diagnostico. Na parte de HTTPS, foi inviavel para mim. Ja usei isso na faculdade, mas esqueci completamente como funciona. Entao, ao inves de usar os 30 minutos, usei 10 e assumi a derrota. So escrevi o que aparecia quando eu passava com o cursor em cima do requests, onde ele dava alguns exemplos de como usar.
Em seguida parti para a parte de git. A primeira parte consegui fazer bem tranquilo. Criei a pasta fora de Fase1, iniciei o ambiente git com git init, e mudei o nome da branch de master para main. Usei o touch para criar o arquivo novo e em usei o echo, nano e o cat para escrever alterar e ler os arquivos no terminal. Em seguida, criei duas branches, branch1 e branch2, pois era como tinha interpretado o enunciado (depois que me liguei que talvez o enunciado queria a main e uma outra branch), e alterei o arquivo .md que havia criado. O problema foi no git merge. Inicialmente usei o comando git merge na branch1, e deu erro. Mudei pra main e rodei git merge branch1, o que resultou em um overwrite do arquivo na main, que a apartir desse ponto, ficou com o conteudo que tinha escrito na branch1. E ai que foi o problema, pois nao gerou conflito algum, e por isso nao precisei resolver o conflito. Imagino que tenha feito coisa errada ai.
Por fim, fiz todas as correcoes, e consegui entender a questao do WHERE. Todas as correcoes eu imagino que consegui faze-las da maneira certa e entender seus motivos.
Nao tive tempo no dia para fazer a parte de LEFT JOIN.

**Onde travei**
Travei na parte de HTTPS inteira, e travei quando o git merge branch1 nao gerou conflito algum.

**O que ainda não entendo**
Nao entendo como usar o requests em python, e ate mesmo um pouquinho da teoria por tras desse conteudo.
Alem disso, a minha alteracao da resposta da pergunta 2 da leitura eu nao tenho 100% de certeza que esta correta, mas imagino eu que esteja.

**Sensação vs. resultado**
Nao fui muito bem, considerando que mal fiz a parte do HTTP e o git merge nao foi como esperado.
Pelo menos, acredito que tenha mandado melhor na parte de sql que fiz.

**Pendências**
Parte de LEFT JOIN.
Parte de HTTP do diagnostico
Completar parte do Git do diagnostico.


### 2026-09-28 — Revisão (1h)

**O que fiz**
Comecei respondendo as perguntas. Escrevi as respostas na pasta revisao/semana1. Todas as respostar fiz de cabeça, e as fiz nos 15 minutos que tinha disponível. A única que acredito que esqueci de algo pequeno, foi a primeira, que esqueci do DISTINCT. De resto acho que fui bem.
Em seguida fiz os três exercícios de sql. Fiz todos em menos de 5 minutos, e isso que no primeiro exercício, ainda usei o tempo para arrumar o sql e rodar os comandos de exibicao no terminal. Acredito que não tive problema algum nesses exercícios. Acredito que acertei os três. 

**Onde travei**
Não travei em nenhum a parte. A única coisa que fiz, foi olhar no histórico do terminal para ver o que ia dentro da função SUBSTR() para usar no exercício D2.

**O que ainda não entendo**
Do que foi visto hoje, acredito ter tudo entendido.

**Sensação vs. resultado**
Acredito que fui bem, considerando o baixo tempo e a parente falta de dúvidas.

**Pendências**
Parte de LEFT JOIN.
Parte de HTTP do diagnostico
Completar parte do Git do diagnostico.

### 2026-09-29 — Trilha de Algoritmos (2h)
Trilha de algoritmos não iniciada.

### 2026-09-30 — Quarta (3h)

**O que fiz**
Resolvi as pendências de maneira rápida. Tirei algumas duvidas com o Claude de uns pontos que não havia entendido, mas de modo geral foi rápido.
A única coisa foi a parte do git que levei mais tempo, perguntei para o Claude se eu deveria arrumar o arquivo usando nano, e ele me deu o comando para gerar o grafo.
Em seguida parti para os exercícios de Left Join.
Começando pelo E1, na minha primeira tentativa, nao apareceram nem Gabi nem Hugo, isso porque eu usei FROM pedidos LEFT JOIN clientes, ou seja, estava juntando todos os pedidos apenas com os clientes que tinham feito pedidos. Percebi isso e fiz o contrario, ou seja, FROM em clientes e LEFT JOIN com pedidos, dessa forma apareceram todos os clientes, e juntou com apenas os pedidos que tinham clientes.
O E2 fiz muito rápido, tendo feito o anterior, foi basicamente copiar as linhas e apenas colocar uma condição no HAVING ao final. Ainda por cima, tentei trocar o HAVING pelo WHERE só para ver o que acontecia (depois de já ter acertado o exercício) e deu um erro, visto que usei WHERE COUNT(p.id), o que gera erro, visto que o WHERE é usado antes de agrupar as linhas.
O E3 demorei um pouco mais pois tentei filtrar a receita fazendo um == 0. No entanto, não aparecia nada de resultado. Foi ai que coloquei a receita no SELECT e vi que não era 0, mas sim um NULL. Abri o SQLBolt e li sobre LEFT JOINS e NULL. Então, apenas alterei a condição do HAVING.
No E4 foi parecido. Usei o Gemini para me explicar o COALESCE. Deu um erro inicial pois estava nomeando o SUM de receita dentro do COALESCE, o que deu erro. Arrumei isso e deu tudo certo. Dei o ORDER BY so para testar se dava para usar o nome da variavel que criei.
O E5 fiz bem rápido, sem JOIN algum.
Em seguida parti para a parte de subconsulta e CTE.
Dentro dos 10 minutos que tinha para ler teoria e tirar dúvidas, acredito que consegui entender o que são os dois e qual a diferença entre eles. Feito isso parti para os exercícios.
Fiz o F1 sem muitos problemas, já que era uma sub consulta simples.
O F2, acabei fazendo sem problemas tambem. Deu um erro de atencao minha em que chamei uma variavel que nao tinha declarado. Arrumei isso rapidamente e deu certo.
O F3 fiz mais rapido ainda, ja que era praticamente uma adaptacao do F2.
O F4 ja levei bem mais tempo. Usei o GPT para me ajudar com erros e ele me ajudou a perceber que os CTEs devolvem tabelas. Logo, na query principal, devo trata-los como tabelas normais. Isso era algo que es nao estava pensando, e ficava chamando variaveis delas sem colocar as tabelas no FROM ou usar subconsultas. O exercicio demorou mais saiu.
O F5, achei bem confuso usando o CTE. Tentei fazer dois e JOIN eles na query principal, mas acabei nao conseguindo testar isso por conta do tempo teto que tinha nesse exercicio. Esses exercicios mais complexos acabam ficando muito confusos devido a quantidade enorme de linhas e informacao. Tambem, nem me esforcei em arredondar para duas casas decimais. Era o menor dos meus problemas.

**Onde travei**
Não diria que travei, mas realmente levei bastante tempo no F4 e F5 quebrando a cabeça em como escrever o código, quais variávei colocar no SELECT, se eu deveria JOIN as CTEs, entre outros.

**O que ainda não entendo**
Não entendo ainda como interpretar um grafo do git. Olhe como ficou meu grafo do exercicio que estava como pendencia:
*   4767367 (HEAD -> main) Conflito arrumado
|\  
| * 0af118b (branch2) Mudanca teste
| * 0ee5e66 Alteracao no teste.md
* | 5378d6b (branch1) Saroba!
|/  
* 8ca381f Commit inicial
Não sei ler isso e não sei dizer se está como o esperado.
Não é que não entendo, mas queria saber como fica uma tabela apos um LEFT JOIN. Fiquei curioso para saber como ficam as linhas que não tem correlação com outra.
Não entendi a intenção do Claude quando ele disse "A diferença entre COUNT(*) e COUNT(coluna) é o assunto do exercício.", uma vez que nem pensei em usar o COUNT(*) no exercício (deveria ter pensado?).
Também, não lembro se cheguei a completar o exercício 6. Mas se consegui, em algum outro dia da Fase1, tenho certeza que eh mais fácil do que usando CTE e subconsulta.

**Sensação vs. resultado**
Tirando o F4 e F5, acredito que fui bem. Esses dois exercícios me deixaram meio confuso.Tive que pensar bastante e parar para ver o que estava escrevendo varias vezes. Eles me pegaram hoje.

**Pendências**
Parte de HTTP do diagnostico

### 2026-10-01 — Quinta (4h)

**O que fiz**
Comecei fazendo o exercicio F5 novamente. Primeiro, dessa vez, escrevi as queries de cada um dos CTEs que eu pretendi usar antes, de modo que eu analisasse os resultados e saber o que saia deles. A query de pedidos com seus respectivos valores estava certa (conferi fazendo conta), assim como a de media de clientes, onde para testar, calculei a media de Bruno, que dava 320 por pedido (ele fez os pedidos 2, 8 e 14, que calculei a media da seguinte maneira: (300+45+35+900)/4=320. Pensando agora, deveria ter dividido por 3 nao?) e estava batendo com o resultado da minha query.
O problema foi que quando juntei tudo, o meu resultado estava bem diferente da saida esperada, mas nao pelos valores (esses estavam batendo), mas pelas medias, que estavam bem diferentes. Fiquei sem tempo para ver o que aconteceu, considerando que ja tinha usado os 25 minutos.
Em seguida, parti para os testes rapidos, onde usei um pouco mais dos 10 minutos necessarios (mais porque estava usando o terminal para rodar o primeiro, o que consumiu bastante tempo. Depois percebi que era bem mais rapido fazer no arquivo direto). Mas ainda sim, acabei ficando com algumas duvidas, que vou esclarecer na outra parte desse log.
Em seguida, peguei a pagina do sqlite.org e mandei para o Gemini, e pedi para ele fazer uma aula/resumo para mim dos topicos 1, 2 e funcoes de ranking. Li isso e parti para os exercicios.
O G1, consegui entender como faze-lo e porque usar a funcao de janela. Olhei o resumo do gemini para pegar como escrever o corpo da funcao. Mas de resto desenrolei.
O G2, acabei tendo que entender um pouco mais sobre o partition. Li a aual do gemini, e vi que teria que "partir" por cliente, visto que queria rankear os pedidos de CADA cliente.
O G3 que levei mais tempo. Isso porque eu estava tentanto usar o PARTITION, quando na verdade nao precisava. Estava saindo um resultado estranho, e entao pedi para o Gemini me explicar como que eu saberia o que colocar no PARTITION e o que colocar no ORDER BY. O partition voce coloca o que voce quer "agrupar" e no order o que voce quer rankear/ordenar dentro desse agrupamento feito pelo partition. Foi ai que eu me liguei. Nao precisava usar partition, visto que queria rankear todos os clientes e nao as coisas dentro de cada cliente (sei que nao era o caso, mas estava partindo por id de clientes antes de perceber isso). Entao, tendo comentado as linhas com partition, rodei, porem estava invertido. Fabio estava com os numeros que Ana deveria estar e vice versa para todos os outros clientes. Foi ai que percebi que tinha que colocar um DESC nos order by dentro das janelas.
O G4 eu tinha a ideia de como fazer. Entao nao foi muito dificil executar. O unico ponto foi que esqueci que existia essa coluna categoria de produtos, e elembrei depois de consultar o Claude. Mas de resto, sem problemas.
O G5 ja achei mais dificl. Isso porque fiquei quebrando a cabeca em como fazer uma receita acumulada. Nao tinha trabalhado com janela com sum e order by, entao na minha cabeca foi bem estranho para entender como funciona essa receita acumulada. Tive que tirar duvidas com o Gemini para conseguir fazer.
Nao fiz o G6

**Onde travei**
Unica parte que travei foi na receita acumulada do G5, que tive que mandar o que tinha escrito para o Gemini e entender porque nao estava dando o mesmo resultado do saida-esperada.md.

**O que ainda não entendo**
Não entendi porque Gabi apareceu com 1 quando usei o COUNT(*).
Tambem nao entendi porque o nome do Hugo sumiu da resposta quando tirei o GROUP BY da query. Primeiramente tinha trocado o HAVING pelo WHERE IS NULL, mantendo o GROUP BY, e apareceu Gabi e Hugo no resultado. No entanto, quando tirei o GROUP BY, Hugo sumiu da resposta.
Estou pegando a manha do partition e do order by nas janelas. Conteudo novo para mim. Nunca tinha visto isso de janelas.
Nao entendi como o order by dentro da janela com uma funcao sum faz com que a soma seja acumulada. Nao entendi tambe m porque o exercicio so funcionou depois de um sum dentro de um sum.

**Sensação vs. resultado**
Tirando a demora no F5 e o G5, acredito que fui bem, considerando que nunca tinha visto esse conteudo na minha vida.

**Pendências**
Parte de HTTP do diagnostico
Ex F5

### 2026-10-03 — Sabado (2h)

**O que fiz**
Comecei pelo README.md do repositório da Fase0. A questão foi que rodei os comandos e imagino que tenha dado certo, visto que o arquivo python rodou e o de testes tambem, com os testes em verde.
Em seguida, parti para a parte de mypy, onde pedi para o gemini me passar o que eu deveria colocar no pyproject.toml, e em seguida, o comando para roda-lo. Assim que rodei, vi os 13 erros e fui arrumando eles. No fim, arrumei todos e o mypy roda liso.
Em seguida, mandei o conteudo de complexidade e de indices para o Gemini e pedi uma aula detalhada com exemplos. Pelos 15 minutos que eu tinha, fiquei tentando entender a materia, e entao, parti para os exercicios. 
Primeira coisa que gostaria de falar sobre os exercicios foi uma confusao que o Claude fez: primeiro, ele me passou a funcao EXPLAIN com parenteses, que na real, nao existem, e tambem, no primeiro exercicio, quando criei o indice e deixei o DROP no final do arquivo, ele nao estava apagando o indice, logo estava saindo a pesquisa como SEARCH nos dois casos. O que fiz para dar o resultado esperado foi jogar o DROP como a primeira linha do arquivo. Ai apareceu um SCAN e um SEARCH.
Mas, em relacao aos 4 exercicios, eu fiz todos e tudo esta documentado no arquivo .sql deles. Quero saber se as minhas explicacoes naqueles exercicios estao boas. Assim como mencionei la tambem, tive uma dificuldade para entender a questao do H3.
Os exercicios de complexidade eu fiz todos. Pedi ajuda para o chat, pois eu nao lembrava o que eram sets, e tambem nao sabia usar a funcao do time que o enunciado pedia, alem da funcao de busca binaria.

**Onde travei**
A unica parte que eu diria que travei foi na H3, na hora de escrever a explicacao. Como mencionei no exercicio, nao entendi porque um eh SEARCH e outro SCAN, alem do fato de um fazer SCAN com indice, que para mim nao era possivel existir algo assim.

**O que ainda não entendo**
Ainda nao entendo muito bem essa questao de ambiente virtual. Tipo, estava trabalhando nesse repositorio ate agora sem ativa-lo. E uma coisa que eu nao sei tbm sobre o assunto eh quando rodar o comando python3 -m venv venv. O que esse comando faz? Rodo ele apenas uma vez? quando nao usei o repositorio, ou quando ainda nao criei o ambiente? Por exemplo, clonei o Fase0 e tive que rodar isso. Mas na minha cabeca o ambiente ja estava criado no repositorio. Ou eh por conta do gitignore que tenho que rodar isso?
Entendi os indices, mas ainda nao sei muito bem quando perceber que certa coluna precisa de um indice.
Nao entendi a questao da primary key de itens e seu indice. E tambem nao entendi aquele SCAN com um COVERING INDEX do produto_id. Na minha cabeca o SCAN nao usava Index algum.
Por fim, tambem nao entendi aquela pergunta de quando escolher lista, set ou busca binaria. Tipo entendo toda a questao da complexidade envolvida. Mas essa pergunta eh relacionada a quantidade de dados que vou manipular com um algoritmo. Alem disso, se listas sao tao ineficientes, porque se usam elas e nao sempre usar sets por exemplo?

**Sensação vs. resultado**
Fui ok hoje. Consegui os exercicios, mas fiquei com certas duvidas

**Pendências**
Ex F5

### 2026-10-04 — Domingo (3h)

**O que fiz**
Comecei pelo resumo de transacoes e sqlite em python que pedi para o gemini fazer. Dessa vez respondi as perguntas que tinham que ser respondidas. Acabei levando cerca de 10 minutos a mais do que o esperado, mas foi tranquilo.
Em seguida, parti para os exercicios de transacoes em sql puro. O primeiro acabei demorando mais, pois estava tentando entender como funcionava o esquema de escrever transacoes em sql direto. Fiquei lendo, entendendo e conversando com o Gemini para tirar duvidas sobre o tema. Mas acredito que conseguir fazer os exercicios. Entendi que a transacao so vai executar tudo se todas as linhas estiverem corretas, caso contrario nao executa. Entendi o commit, que salva no banco e termina a transacao, e o rollback, que desfaz as mudancas e termina a transacao.
Nos exercicios de sql em python, como se pode observar, levei bastante tempo, principalmente no primeiro. Isso porque estava tentando entender tudo para conseguir fazer o exercicio sozinho. Entao, junto com o Gemini e a documentacao do sqlite3, tive que entender o que era isso de memoria e como usar o executescript(). Fui atras de como executar uma instrucao, ler os resultados de queries e como escrever de maneira correta uma busca usando o placeholder. Fiz os 4 exercicios.
Por fim, escolhi a api e li parte da documentacao dela.

**Onde travei**
Hoje, acredito que nao travei em nada. Consegui fazer as coisas, e fui tirando duvidas com o Gemini sobre conteudo.

**O que ainda não entendo**
Nao entendi muito bem ainda a questao do arquivo .db. Tipo entendo que ele eh a base de dados, mas quando perguntei ao Gemini porque eu nao poderia abrir a conexao com ele ao inves do arquivo .sql,eu entendi que era para nao alterar nada nesse arquivo. No entanto, na minha cabeca, a base de dados eh algo que precisa estar sempre sendo alterado. 
Queria entender um pouco melhor na pratica o que eh o cursor e a conexao. Por que teria que me conectar com uma base de dados, que esta baixada no disco da minha maquina?
Queria entender porque em alguns casos, tipo na doc do sqlite usam res = cursor.execute() e depois usam o res.fetchall(). Nos exercicios eu nao usei assim e funcionou. Alem disso, no ex4, quando usei mais de um execute, nao sabia se precisava chamar algum de res, ou todos de res1, res2, ...
Por fim, queria entender melhor sobre APIs. O que elas sao? Para que sao usadas? Por que falam tanto delas? Elas estao muito populares. Alem disso, quando estava lendo a documentacao da API, ele falava sobre query parameters. Qual a relacao delas com banco de dados? Elas retornam dados, eh isso? 

**Sensação vs. resultado**
Acho que fui bem hoje. Consegui fazer os exercicios.

**Pendências**
Ex F5
Nao sei o resto

### 2026-10-05 — Segunda (1h)

**O que fiz**
Comecei pelas perguntas teoricas sem consulta. Fiz todas elas, no entanto a 6 eu nao consegui pensar na hora, entao pulei, e a 8 nao deu tempo de fazer, mas imagino que nao ia conseguir.
Depois fui para os exercicios praticos. Dessa vez, o que fez eu conseguir acertar o resultado do F5 foi o JOIN com a primeira CTE na segunda CTE. Esse foi um diferencial que cortou tempo e me deixou menos confuso. Tambem, rodei as CTES como queries para ver se estavam como eu queria. Assim que as duas estavam boas, escrevi a query final rapidao.
O G5, eu lembrava do double sum, mas deszsa vez fez mais sentido, pois como eh o acumulado, tinha que fazer a sum das receitas (que era outro sum). Se nao tivesse o erro do SELECT e declaracoes, seria mais facil vizualizar caso eu escrevesse SUM(receita_mes). O exercicio estava dando uma linha de resultado, quando lembrei de por o GROUP BY, ai deu certo. Nao precisava do partition, pois nao queria realizar uma soma com um grupo especifico de linhas, mas sim com todas as linhas.
O G4 foi o que fiz mais rapido. Esse acredito que nao tive muito problema na construcao.

**Onde travei**
Travei nas questoes 6 e 8 teoricas. Mais a 6 pois a 8 nao tive muito tempo.

**O que ainda não entendo**


**Sensação vs. resultado**
Acho que fui bem hoje. Consegui fazer os exercicios. Menos os dois teoricos que escaparam da minha cabeca.

**Pendências**
Nao sei

### 2026-10-06 — Terça (2h)

**O que fiz**
Comecei criando o repositorio e as minhas contas no Leet e NeetCode. Feito isso, clonei ele aqui e comecei a trabalhar. 
Li a mini aula do Claude explicando o uso de dois ponteiros, e parti para os exercicios.
Comecei pela primeira questao. Nao tive muitos problemas, mas imagino que tenha jeitos maneiras que otimizem mais o codigo.
A segunda tambem tinha claro na cabeca como resolver. O meu problemas foi as pontuacoes e o espaco, que antes estava tentando colocar tudo em uma lista, ate que achei uma funcao na internet que ajudava bastante com isso. Meu problema com a maneira como resolvi esse exercicio foi que usei dois loops. Sinto que nao precisava usar. Mas na hora nao pensei.
Parti para o terceiro. Esse nao consegui dentro dos 25 minutos. Estava tentando usar dois ponteiros na mesma direcao, no entanto, estava nada eficiente, e fiquei batendo cabeca. Vi o video do neetcode, e vi que o dev usava ponteiros em direcoes opostas. Nao vi a resolucao dele em codigo. Apenas apliquei o raciocinio dele. Ai deu certo.
Por fim, fiz o ultimo com ponteiros na mesma direcao. Esse fiz rapido. Meu unico problema foi que na primeira tentativa, acabei extrapolando o tamanho do ponteiro i2. Assim que arrumei, o ex passou.


**Onde travei**
Sinto que nao travei em nada hoje.

**O que ainda não entendo**
Sinto que entendi o conteudo de hoje. Claro, tenho muito o que melhorar. Mas sinto que entendi.

**Sensação vs. resultado**
Acho que fui ok hoje. Tirando um que extrapolei o tempo, o restante consegui fazer.

**Pendências**
quarta, primeiros 30 minutos: correções do sql-no-python.py (import, aspas na P3, fetchall duplo, anotações de retorno, carga da base no __main__ e a P4 refeita);
segunda, 12/10: a lista "Volta" completa, como acima;
contínuo: o DUVIDAS.md.

### 2026-10-07 — Quarta (3h)

**O que fiz**
Comecei pelas correcoes do sql em python. Nao tive problema em nenhuma correcao, exceto a do P4, pois nao tinha feito o exercicio direito, e tive que entender o enunciado inteiro. Acredito que consegui escreve-lo bem feito, mas, precisei de 15 minutos adicionais para termina-lo. Achei o esqueleto do exercicio meio estranho. Tipo isso do id_pedido vir separado. Estava dando erros, debuguei com o ChatGPT, e ele me deu essa ideia de ter que fazer um loop para adicionar o id_pedido na lista itens.
Em seguida, fui para a parte de criar um repositorio novo. Aqui, criei ele tranquilo. Na parte do pyproject.toml que levei mais tempo. Basicamente fui copiando ele do meu repositorio Fase0. Alem disso, quando fui rodar o pip install -e . deu um problema no hatchling, que nao entendi como resolvia, entao pedi ajuda para o ChatGPT para resolver o bug comigo. O resultado disso foi aquele ultimo bloco do arquivo .toml que resolveu o problema que estava dando. Em seguida, rodei de novo, e deu um problema que nao estava encontrando o ruff. Falei com o GPT de novo, e nao havia rodado o pip para o grupo dev. Mas, no fim, acredito que deu tudo certo.
Parti entao para a base que iria usar no projeto. Na parte de leitura dirigida acredito que foi tudo bem. Unica coisa que nao ficou claro para mim eh que a API menciona que eh de 1946-current. Mas o que eh current? Mas de resto, acredito que foi bom, ate para desenvolver um senso critico de o que usar e o que nao usar. Era muito facil eu criar as tabelas iguais as da API. No entanto, pensar no que realmente eu iria usar foi util.
A modelagem foi o proximo passo. Comecei pelo desenvolvimento das tabelas, que acredito que foi bom, consegui definir bem o que queria usar. Na M2 acredito que consegui fazer da maneira correta. No M3 tive que corrigir alguns erros, mas acho que a estrutura ficou boa. O problema foi que no final, apareceram dois erros (Runtime error near line 3: UNIQUE constraint failed: teams.id (19); Runtime error near line 7: UNIQUE constraint failed: games.id (19)) com esse erro de unique, que nao entendi. Alem disso, o terminal so reportou o erro do Null e da foreign key, nao mencionou o erro do CHECK, o que achei estranho.
O M4 estava corrido, entao ao inves de responder com quais colunas e tabelas iria resolver tres questoes, escrevi mais questoes extras que adoraria dar uma olhada ao longo do projeto. Gostei bastante pois consegui ter bastante senso critico e questionar os dados. Foi interessante.

**Onde travei**
Não diria que travei hoje. O P4 que fiquei mais tempo pensando, mas nao travei.

**O que ainda não entendo**
Achei meio estranho isso do id_pedido vir separado da lista itens no P4. 
Ainda tenho algumas coisas do pyproject.toml que nao estao 100% na minha cabeca, qual o seu papel, como a diferenca entre o dependencies do project e o dev do dependency-group, alem dessa questao do build-system, que deu problema hoje.
O pip install -e baixa o .toml no ambiente virtual? Se sim, para que eu quero isso?
Os erros do M3 e porque eles apareceram. Por que o do CHECK nao apareceu tambem?

**Sensação vs. resultado**
Acho que fui bem hoje. Consegui ver bem de perto a API e entender melhor a base, alem de questionar bastante ela.

**Pendências**
segunda, 12/10: a lista "Volta" completa, como acima;
contínuo: o DUVIDAS.md.

### 2026-10-08 — Quinta (4h)

O que fiz:
Comecei arrumando as coisas que estavam erradas nos arquivos. Nessa parte acredito que foi tranquilo. Consegui fazer tudo que eu precisava em um tempo menor do que o esperado. 
Em seguida, pedi uma aula para o GPT e li a documentacao do request dentro dos 30 minutos que tinha. Deu para pegar uma base boa e partir para os exercicios
Nos exercicios de exploracao, o primeiro levei mais tempo pois estava vendo como usava a chave da API da maneira correta e tambem estava procurando a maneira de extrair os dados da requisicao get que fiz. Percebi que realmente a base nao conta so com times da nba, mas tambem com outros times, que imagino que sejam times antigos da nba, e times do mundo todo, como flamengo e real madrid. O exercicio 2 fiz bem rapido, uma vez que nas minhas tentativas de usar a chave no H1, acabei cometendo esse erro, entao ja sabia o que esperar e sabia fazer tambem. O H3 consegui fazer tambem. Como mencionei no cabecalho do exercicio, estava testando com um numero que gerava erro no servidor (status 500). Assim qeu percebi isso, mudei o numero e consegui capturar o status que eu queria. No H4, a unica coisa que aconteceu foi a questao dos erros do requests. Nao sabiam que eles tinham um tipo de erro diferente, entao, quando entendi isso consegui arrumar. No H5, explorei bem a base, mas vou poupar tempo aqui, ja que deixei todas as observacoes que fiz dos players no cabecalho do exercicio. O exercicio 6 foi muito bom para entender como o cursor e o per_page funcionam. Depois de testar algumas vezes com eles, consegui compreender os seus funcionamentos.
Em seguida, parti para o exercicio do cliente. Criei a funcao que precisava, do jeito que eu sabia fazer. Considerei o per_page padrao, e adicionei o cursor como argumento opcional. Nesse arquivo, so tive problemas com a tipagem (topico que vou falar mais para frente). Alem disso, o enunciado inicial do exercicio nao estava muito claro, entao, inicialmente, estava escrevendo um bloco __main__ para realizar os testes. Depois que entendi melhor o enunciado, consegui fazer melhor. Fui entao para o arquivo de testes, onde consegui fazer o exercicio pegar os jogadores baseados nos seus ids. Tive que consultar a internet com questoes de set, de como realizar a interseccao entre eles principalmente. Tendo feito isso, o arquivo rodou sem problemas e o assert passou, quando usei dois cursors diferentes, claro.
Rodei o ruff, com ruff check. Ele encontrou tres pontos que davam para consertar (estavam com o *) e entao rodei o ruff check --fix e ele arrumou tudo.
O grande problema foi no mypy, que inicialmente encontrou tres erros no cliente.py, e 20, se nao me engano, no explore_cliente.py. Nao tive tempo de corrigir todos. So consegui corrigir um do cliente.py, que era na tipagem do dicionario de argumento da funcao.

Onde travei:
Nao diria que travei. Quebrei bem a cabeca, fui atras das coisas, mas nao teve nada que eu nao tinha a menor ideia de como fazer.

O que eu ainda nao entendo:
A coisa que esta me incomodando eh essa base, principalmente por se ter mais de uma versao de alguns jogadores. Nao sei como vou filtrar isso, e, pelo que imagino, todas as analises, com jogadores, fiquem restritas a temporada mais atual da base de dados.

Sensacao vs. resultado
Acredito qeu fui bem hoje. Consegui entender coisas do requests e fazer os exercicios que tinham que ser feitos.

**Pendências**
segunda, 12/10: a lista "Volta" completa, como acima;
contínuo: o DUVIDAS.md.