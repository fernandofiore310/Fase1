import sqlite3
from sqlite3 import Cursor, Connection
from typing import List

def carrega_cursor(conn: Connection) -> Cursor:

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

def pedidos_cliente(conn: Connection, cliente_id: int) -> list[tuple[int, int, str]]:
    cursor = carrega_cursor(conn)

    cursor.execute("SELECT * FROM pedidos WHERE cliente_id = ?", (cliente_id,))

    conteudo_query = cursor.fetchall()
    
    print(conteudo_query)

    return conteudo_query

def busca_concat(conn: Connection, nome: str) -> list[tuple[int, str, str]]:
    cursor = carrega_cursor(conn)

    query = f"SELECT * FROM clientes WHERE nome = '{nome}'"
    cursor.execute(query)

    conteudo_query = cursor.fetchall()
       
    print(conteudo_query)

    return conteudo_query

def busca_placeholder(conn: Connection, nome: str) -> list[tuple[int, str, str]]:
    cursor = carrega_cursor(conn)

    cursor.execute("SELECT * FROM clientes WHERE nome = ?", (nome,))

    conteudo_query = cursor.fetchall()
        
    print(conteudo_query)

    return conteudo_query

def valida_transacao(conn: Connection, id_pedido: int, id_cliente: int, data_pedido: str, lista_itens: list[tuple[int, int, float]]) -> list[tuple[int,int,int,int]]:
    cursor = carrega_cursor(conn)

    cursor.execute("BEGIN TRANSACTION;")

    try:
        cursor.execute("INSERT INTO pedidos VALUES (?, ?, ?);", (id_pedido, id_cliente, data_pedido))

        itens_com_pedido = []
        for p in lista_itens:
            print(p)
            itens_com_pedido.append((id_pedido, p[0], p[1], p[2]))

        cursor.executemany("INSERT INTO itens VALUES (?, ?, ?, ?);", itens_com_pedido)

        conn.commit()
        print("Valido!")

    except sqlite3.IntegrityError:
        conn.rollback()
        print("Ivalido!")

    res = cursor.execute("SELECT * FROM itens WHERE pedido_id = ?;", (id_pedido,))
    conteudo_query = res.fetchall()

    print(conteudo_query)
    
    return conteudo_query

if __name__ == "__main__":

    # Abre a conexao com o banco de dados
    conn = sqlite3.connect(":memory:")

    # Le todo o conteudo do loja.sql
    with open("diagnostico/loja.sql", "r", encoding="utf-8") as f:
        script = f.read()

    # Executa o loja.sql todo de uma vez. O execute() normal executa linha a linha. Nesse caso era mais ineficiente.
    conn.executescript(script)

    # Exercicio P1 feito em 32min47s
    total_por_pedido(conn)

    # Exercicio P2 feito em 7min41ss
    pedidos_cliente(conn, 1)
    pedidos_cliente(conn, 7)

    # Exercicio P3 feito em 10min20s
    # Antes: Imagino que a versao com a concatencao vai pegar os dados de Ana, visto que logo depois do nome dela tem uma aspas simples, o que faz com que o banco de dados ignore o que vem depois dela. Ja, quando usarmos o placeholder, acredito que nao sera retornado nada, visto que ele vai considerar a string inteira e nao vai encontrar o nome Ana' OR '1'='1 na base de dados.
    # Explicacao: O que aconteceu na primeira chamada foi que o SQL considerou o nome do cliente como 'ANA' OR '1'='1', o que, em 100% dos casos sera true. Logo, como todos os clientes respeitam essa condicao, o sql esta pegando todos. Ja no segundo caso, ele considera o nome 'ANA' OR '1'='1' como string, o que realmente nao tem nenhum cliente chamado assim.
    busca_concat(conn, "Ana' OR '1'='1")
    busca_placeholder(conn, "Ana' OR '1'='1")

    # Exercicio P4 feito em 14min49s
    id_pedido = 15
    id_cliente = 7
    data_pedido = '2026-08-30'
    lista_intens = [(3, 1, 120), (4, 2, 120)]
    id_pedido2 = 16
    lista_intens2 = [(3, 1, 120), (3, 2, 120)]
    valida_transacao(conn, id_pedido, id_cliente, data_pedido, lista_intens)
    valida_transacao(conn, id_pedido2, id_cliente, data_pedido, lista_intens2)

