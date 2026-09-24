-- Diagnóstico Fase 1 — base de uma loja de produtos de natação e piscina
-- Carregar com: sqlite3 loja.db < loja.sql

DROP TABLE IF EXISTS itens;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id      INTEGER PRIMARY KEY,
    nome    TEXT NOT NULL,
    cidade  TEXT NOT NULL
);

CREATE TABLE produtos (
    id         INTEGER PRIMARY KEY,
    nome       TEXT NOT NULL,
    categoria  TEXT NOT NULL,
    preco      REAL NOT NULL
);

CREATE TABLE pedidos (
    id          INTEGER PRIMARY KEY,
    cliente_id  INTEGER NOT NULL REFERENCES clientes(id),
    data        TEXT NOT NULL          -- formato AAAA-MM-DD
);

CREATE TABLE itens (
    pedido_id       INTEGER NOT NULL REFERENCES pedidos(id),
    produto_id      INTEGER NOT NULL REFERENCES produtos(id),
    quantidade      INTEGER NOT NULL,
    preco_unitario  REAL NOT NULL,
    PRIMARY KEY (pedido_id, produto_id)
);

INSERT INTO clientes VALUES
 (1,'Ana','São Paulo'),(2,'Bruno','Campinas'),(3,'Carla','São Paulo'),
 (4,'Diego','Santos'),(5,'Elisa','Campinas'),(6,'Fábio','São Paulo'),
 (7,'Gabi','Santos'),(8,'Hugo','Sorocaba');

INSERT INTO produtos VALUES
 (1,'Óculos de natação','Acessórios',80),
 (2,'Touca de silicone','Acessórios',40),
 (3,'Prancha de treino','Treino',120),
 (4,'Pé de pato','Treino',150),
 (5,'Palmar','Treino',70),
 (6,'Cloro granulado 10kg','Química',300),
 (7,'Algicida 1L','Química',45),
 (8,'Clarificante 1L','Química',35),
 (9,'Snorkel frontal','Treino',180),
 (10,'Tampão de ouvido','Acessórios',25);

INSERT INTO pedidos VALUES
 (1,1,'2026-05-03'),(2,2,'2026-05-10'),(3,3,'2026-05-21'),
 (4,1,'2026-06-02'),(5,4,'2026-06-15'),(6,5,'2026-06-28'),
 (7,1,'2026-07-04'),(8,2,'2026-07-12'),(9,6,'2026-07-19'),
 (10,3,'2026-07-30'),(11,4,'2026-08-05'),(12,1,'2026-08-11'),
 (13,5,'2026-08-20'),(14,2,'2026-08-27');

INSERT INTO itens VALUES
 (1,1,2,80),(1,2,1,40),
 (2,6,1,300),
 (3,3,1,120),(3,4,1,150),
 (4,7,2,45),
 (5,6,2,300),(5,8,2,35),
 (6,5,1,70),
 (7,6,1,300),(7,1,1,80),
 (8,7,1,45),(8,8,1,35),
 (9,4,2,150),(9,5,2,70),
 (10,1,1,80),
 (11,6,1,300),(11,7,2,45),
 (12,9,1,180),
 (13,2,3,40),(13,1,1,80),
 (14,6,3,300);
