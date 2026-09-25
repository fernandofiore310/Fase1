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