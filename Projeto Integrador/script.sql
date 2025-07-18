DROP DATABASE IF EXISTS DBPROJETO_INTEGRADOR;
CREATE DATABASE DBPROJETO_INTEGRADOR;
USE DBPROJETO_INTEGRADOR;

CREATE TABLE IMIGRANTE (
	IDIMIGRANTE INT NOT NULL AUTO_INCREMENT
    , NOME VARCHAR(120) NOT NULL
    , NACIONALIDADE VARCHAR(100) NOT NULL
    , DT_NASCIMENTO DATE NOT NULL
    , DOCUMENTO VARCHAR(50)
    , PRIMARY KEY (IDIMIGRANTE)
);

CREATE TABLE INFORMACAO (
	IDINFORMACAO INT NOT NULL AUTO_INCREMENT
	, IDIMIGRANTE INT NOT NULL 
    , TIPO VARCHAR(20) NOT NULL -- DEVE RECEBER APENAS (ESCOLARIDADE OU PROFISSIONAL)
    , DESCRICAO VARCHAR(120) NOT NULL
    , ANO_INICIO INT NOT NULL
    , ANO_TERMINO INT 
    , PRIMARY KEY (IDINFORMACAO)
    , FOREIGN KEY (IDIMIGRANTE) REFERENCES IMIGRANTE(IDIMIGRANTE)
);

CREATE TABLE SERVICO_APOIO (
	IDSERVICO_APOIO INT NOT NULL AUTO_INCREMENT
    , TIPO VARCHAR(50) NOT NULL -- DEVE RECEBER ALGO COMO (ONG, CENTRO DE ACOLHIMENTO, CURSO)
    , NOME VARCHAR(120) NOT NULL
    , ENDERECO VARCHAR(120) NOT NULL
    , TELEFONE VARCHAR(15)  NOT NULL
    , PRIMARY KEY (IDSERVICO_APOIO)
);