import sqlite3

def carrega_cursor(conn: Connection) -> Cursor:
     # Le todo o conteudo do loja.sql
    with open("diagnostico/loja.sql", "r", encoding="utf-8") as f:
        script = f.read()

    # Executa o loja.sql todo de uma vez. O execute() normal executa linha a linha. Nesse caso era mais ineficiente.
    conn.executescript(script)

    cursor = conn.cursor()

    return cursor

def total_por_pedido(conn: Connection) -> None:
    cursor = carrega_cursor(conn)

    cursor.execute("""SELECT p.id, c.nome, p.data, SUM(i.quantidade*i.preco_unitario) valor_total
                    FROM itens i
                    JOIN pedidos p ON i.pedido_id = p.id
                    JOIN clientes c ON p.cliente_id = c.id
                    GROUP BY p.id
                    ORDER BY p.id
                    ;
                    """)
    
    soma = 0
    for i, linha in enumerate(cursor.fetchall(), start=1):
        print(linha)
        soma += linha[3]
    
    assert i == 14
    assert soma == 4250
    
    # try:
    #     assert i == 14
    #     assert soma == 4250
    
    # except AssertionError as e:
    #     print(f"Erro detectado: {e}")

def pedidos_cliente(conn: Connection, cliente_id: int) -> tuple[int, int, str]:
    cursor = carrega_cursor(conn)

    cursor.execute("SELECT * FROM pedidos WHERE cliente_id = ?", (cliente_id,))

    # print(cursor.fetchall())

    return cursor.fetchall()

def busca_concat(conn: Connection, nome: str) -> tuple[int, str, str]:
    cursor = carrega_cursor(conn)

    query = f"SELECT * FROM clientes WHERE nome = {nome}"
    cursor.execute(query)

    print(cursor.fetchall())
    return cursor.fetchall()

def busca_placeholder(conn: Connection, nome: str) -> tuple[int, str, str]:
    cursor = carrega_cursor(conn)

    cursor.execute("SELECT * FROM clientes WHERE nome = ?", (nome,))

    print(cursor.fetchall())
    return cursor.fetchall()

def transacao_valida(conn: Connection) -> tuple[int,int,int,int]:
    cursor = carrega_cursor(conn)

    cursor.execute("BEGIN TRANSACTION;")

    cursor.execute("INSERT INTO pedidos VALUES (15,7,'2026-08-29');")
    cursor.execute("INSERT INTO itens VALUES (15, 3, 1, 120), (15, 5, 2, 70);")

    res = cursor.execute("SELECT * FROM itens WHERE pedido_id=15;")

    print(res.fetchall())
    return res.fetchall()

def transacao_invalida(conn: Connection) -> tuple[int,int,int,int]:
    cursor = carrega_cursor(conn)

    cursor.execute("BEGIN TRANSACTION;")

    cursor.execute("INSERT INTO pedidos VALUES (15,7,'2026-08-29');")
    cursor.execute("INSERT INTO itens VALUES (15, 3, 1, 120), (15, 3, 2, 120);")

    res = cursor.execute("SELECT * FROM pedido WHERE id=15;")

    print(res.fetchall())
    return res.fetchall()

if __name__ == "__main__":

    # Abre a conexao com o banco de dados
    conn = sqlite3.connect(":memory:")

    # Exercicio P1 feito em 32min47s
    total_por_pedido(conn)

    # Exercicio P2 feito em 7min41ss
    pedidos_cliente(conn, 7)

    # Exercicio P3 feito em 10min20s
    # Antes: Imagino que a versao com a concatencao vai pegar os dados de Ana, visto que logo depois do nome dela tem uma aspas simples, o que faz com que o banco de dados ignore o que vem depois dela. Ja, quando usarmos o placeholder, acredito que nao sera retornado nada, visto que ele vai considerar a string inteira e nao vai encontrar o nome Ana' OR '1'='1 na base de dados.
    # Explicacao: Na primeira de um erro de sintaxe, falando do OR que fica entre duas aspas simples. Imagino que isso tenha acontecido pelo fato do sql ter considerado isso como fora da string, o que gerou erro.
    busca_concat(conn, "Ana' OR '1'='1")
    busca_placeholder(conn, "Ana' OR '1'='1")

    # Exercicio P4 feito em 14min49s
    transacao_valida(conn)
    transacao_invalida(conn)
