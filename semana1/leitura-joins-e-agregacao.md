## Resumo de SQL

Tables in SQL are entities.
Each Line is like an instance.
Each column are the common properties shared by every intance

SELECT = Query
It retrieves the type of data we are looking for.

FROM specifies which tables we are getting our primary data from.

WHERE is a filter which applies to every row of the tables we are manipulating.
It checks specific column values to determine whether it should be in the result or not.
SQL support a number of operations that are useful to do the comparisons and filters WHERE provides.

SELECT DISTINCT can be used to remove duplicate rows.
By duplicate rows, I mean rows that the columns specified after the SELECT have the same value.

ORDER BY sorts the query based on the column value we give it to it.
They order the RESULTS.
It uses ASC/DESC to do this classification.

LIMIT can be used to reduce the number of rows that my return query shows.
OFFSET (optional) specifies where to begin counting the number of rows from. So imagine I sorted a query using ORDER BY, but I don’t want to see the first option. Then, I can use OFFSET to help me with that.


Until now, we have been working with a single table, but what if we have to work with data that are in different tables? (That’s usually the case)

JOIN clause can combine row data across two different tables using a unique key.
Unique keys are identifications of that specific instance. Usually are represented by an id (number).

INNER JOIN matches rows from the first table to the second table which have the same key. That creates a result row with the combined columns from both tables.
After the tables are joined, all the other clauses we saw are then applied.

Example:

SELECT column, another_table_column, …
FROM mytable
INNER JOIN another_table 
    ON mytable.id = another_table.id
PS: JOIN and INNER JOIN are the same thing

SQL also supports the use of aggregate expressions (functions) that summarizes information about a group of rows.
Without a specified grouping of rows, each aggregate function is going to run on the whole set.
So, you want to first, filter the specific rows you want, and then, aggregate theses rows.
Examples: COUNT(), SUM(), …

We can use the GROUP BY clause to that have the same value in the specified column (column that’s called right after you write GROUP BY).

GROUP BY is always executed after the WHERE clause. So if we want to filter grouped rows, we need to use an additional clause: HAVING.
HAVING allows us to filter grouped rows from the result set.
They are written exactly like WHERE clauses and are applied to grouped rows.

After learning about all these features, here is the order of how they all are executed.

Order of Execution

	1. FROM and JOINs
	The FROM, and subsequently, the JOINs are first executed to determine the total working set that we are going to get our data from (is the working set that is being queried).
	They cause temporary tables to be created, containing all the rows and columns tha are being joined.

	2. WHERE
	Once we have all the data, WHERE constraints are applied to all the rows in our set (set created by FROM and JOINs).
	They can only acess the columns from the tables requested in FROM

	3. GROUP BY
	The remaining rows after WHERE is applied are then grouped in based on common values in the column specified.
	As a result, there will be the same number of rows in set as there is number of values of the column specified.
	So you should only use this when you have AGGREGATE FUNCTIONS in your query.

	4. HAVING
	After the grouping the rows, the HAVING filter is applied to these rows.

	5. SELECT
	Then finally comes the SELECT. They basically choose the columns that will be in the final query.

	6. DISTINCT
	Of the remaining rows, rows with duplicate values in the columns marked as DISTINCT will be discarded.

	7. ORDER BY
	Orders the remaining rows by the specified data in an specific order.

	8. LIMIT/OFFSET
	Selects what range of rows will be returned form the query.


## Perguntas

### Em que ordem o banco executa FROM, WHERE, GROUP BY, HAVING, SELECT e ORDER BY? Por que é diferente da ordem em que se escreve?
A ordem está no resumo de cima.
Agora, porque elas são executadas numa ordem diferente do que se escreve eu não sei.
Talvez, o jeito que se escreve acaba deixando um pouco mais visual e intuitivo para o desenvolvedor.

### O que acontece com as linhas quando você combina duas tabelas sem condição? E com JOIN ... ON?
Imagino que sem condições, as tabelas apenas são "somadas". Logo, teriam todas as linhas das duas tabelas em uma tabela só (não é isso que se quer ver quando se junta duas tabelas). Quando se usa o ON, aí sim está juntando coisas que ambas as tabelas têm em comum, facilitando a visualização e manipulação dos dados que se quer usar.

### O que o GROUP BY faz com as linhas, e por que isso obriga o SELECT a seguir a regra das colunas agrupadas ou agregadas?
O GROUP BY vai agrupar linhas que possuem o mesmo valor em uma coluna especifica, logo, ele vai fazer com que a query tenha uma linha para cada tipo de valor. Assim, caso o SELECT não use um agrupador, vai gerar conflito, pois o GROUP BY estabelece a regra de uma linha por valor, porém o SELECT vai pegar mais de um valor por linha para os colunas restantes, o que gera erro.