SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS DBEXERCICIO17;
CREATE DATABASE DBEXERCICIO17;
USE DBEXERCICIO17;

CREATE TABLE CLIENTE (
	IDCLIENTE INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(120) NOT NULL,
    TELEFONE CHAR(11) NOT NULL,
    PRIMARY KEY (IDCLIENTE)
    );
    
CREATE TABLE CATEGORIA (
	IDCATEGORIA INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(120) NOT NULL,
    PRIMARY KEY (IDCATEGORIA)
    );
    
CREATE TABLE PRODUTO (
	IDPRODUTO INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(120) NOT NULL,
    PRECO DECIMAL(5,2),
    IDCATEGORIA INT NOT NULL,
    PRIMARY KEY (IDPRODUTO),
    FOREIGN KEY (IDCATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA)
    );
    
CREATE TABLE PEDIDO (
	IDPEDIDO INT NOT NULL AUTO_INCREMENT,
    IDCLIENTE INT NOT NULL,
    DATA DATE NOT NULL,
    PRIMARY KEY (IDPEDIDO),
    FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
    );
    
CREATE TABLE ITEM_PEDIDO (
	IDPEDIDO INT NOT NULL,
    IDPRODUTO INT NOT NULL,
    QUANTIDADE INT NOT NULL,
    PRECO_UNITARIO DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (IDPEDIDO,IDPRODUTO),
    FOREIGN KEY (IDPEDIDO) REFERENCES PEDIDO(IDPEDIDO),
    FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTO(IDPRODUTO)
    );

INSERT INTO CLIENTE(NOME,TELEFONE) VALUES
	('MARIA OLIVEIRA', '11999998888'),
	('JOÃO SILVA', '11988887777');
 
INSERT INTO CATEGORIA(NOME) VALUES
	('BEBIDAS'),
	('PRATOS'),
	('SOBREMESA');

INSERT INTO PEDIDO(IDCLIENTE, DATA) VALUES
	(1, '2025-04-20'),
	(2, '2025-04-21');
 
INSERT INTO PRODUTO(NOME, PRECO, IDCATEGORIA) VALUES
	('COCA-COLA LATA', 5.00, 1),
	('HAMBÚRGUER CLÁSSICO', 18.00, 2),
	('PUDIM', 8.00, 3),
	('SUCO NATURAL', 6.50, 1);
    
INSERT INTO ITEM_PEDIDO(IDPEDIDO,IDPRODUTO,QUANTIDADE,PRECO_UNITARIO) VALUES
	(1,2,2,18.00),
    (1,1,1,5.00),
    (2,3,1,8.00),
    (2,4,2,6.50);
    
-- QUESTÃO 13
SELECT NOME FROM CLIENTE;

-- QUESTÃO 14
SELECT 
	PRODUTO.NOME,
	CATEGORIA.NOME
FROM 
	PRODUTO
    INNER JOIN CATEGORIA ON
    CATEGORIA.IDCATEGORIA = PRODUTO.IDCATEGORIA;
    
-- QUESTÃO 15
SELECT
	PEDIDO.IDPEDIDO,
    PEDIDO.DATA,
    CLIENTE.IDCLIENTE,
    CLIENTE.NOME
FROM
	PEDIDO
    INNER JOIN CLIENTE ON
    CLIENTE.IDCLIENTE = PEDIDO.IDCLIENTE;
    
-- QUESTÃO 16
SELECT
	PEDIDO.IDPEDIDO,
    PEDIDO.DATA,
    CLIENTE.IDCLIENTE,
    CLIENTE.NOME,
    CLIENTE.TELEFONE,
    PRODUTO.IDPRODUTO,
    PRODUTO.NOME,
    CATEGORIA.NOME,
    ITEM_PEDIDO.QUANTIDADE,
    ITEM_PEDIDO.PRECO_UNITARIO,
    (ITEM_PEDIDO.QUANTIDADE * ITEM_PEDIDO.PRECO_UNITARIO) AS TOTAL
FROM
	PEDIDO
    INNER JOIN CLIENTE ON
    PEDIDO.IDCLIENTE = CLIENTE.IDCLIENTE
    INNER JOIN ITEM_PEDIDO ON
    ITEM_PEDIDO.IDPEDIDO = PEDIDO.IDPEDIDO
    INNER JOIN PRODUTO ON
    PRODUTO.IDPRODUTO = ITEM_PEDIDO.IDPRODUTO
    INNER JOIN CATEGORIA ON
    CATEGORIA.IDCATEGORIA = PRODUTO.IDCATEGORIA
    
WHERE CLIENTE.NOME = 'JOÃO SILVA';
