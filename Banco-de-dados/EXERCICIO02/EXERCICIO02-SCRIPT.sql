-- APAGANDO O BANCO DE DADOS CASO EXISTA
DROP DATABASE IF EXISTS EXERCICIO02;

-- CRIANDO O BANCO DE DADOS 
CREATE DATABASE EXERCICIO02;

-- CONECTANDO AO BANCO DE DADOS
USE EXERCICIO02;

-- CRIANDO AS TABELAS 
CREATE TABLE NOTA (
	IDNOTA INT NOT NULL AUTO_INCREMENT,
	ALUNO VARCHAR(120) NOT NULL,
	BIMESTRE_1 DECIMAL(4,2) ,
	BIMESTRE_2 DECIMAL(4,2) ,
	BIMESTRE_3 DECIMAL(4,2) ,
	BIMESTRE_4 DECIMAL(4,2) ,
	MEDIA DECIMAL(4,2) ,
	RESULTADO VARCHAR(10) ,
	PRIMARY KEY(IDNOTA)

);