SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS DBEXERCICIO14;
CREATE DATABASE DBEXERCICIO14;
USE DBEXERCICIO14;

CREATE TABLE PROFESSOR (
	IDPROFESSOR  INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(120),
    DISCIPLINA VARCHAR(120),
    PRIMARY KEY (IDPROFESSOR)
);

CREATE TABLE TURMA (
	IDTURMA INT NOT NULL AUTO_INCREMENT,
    NOME_TURMA VARCHAR(20),
    ANO INT,
    PRIMARY KEY (IDTURMA),
    IDPROFESSOR INT NOT NULL,
    FOREIGN KEY (IDPROFESSOR) REFERENCES PROFESSOR(IDPROFESSOR)
);

INSERT INTO PROFESSOR(NOME,DISCIPLINA) VALUES
	('Mariana Costa','Matemática'),
    ('Felipe Oliveira','História'),
    ('Renata Almeida','Química');
    
INSERT INTO TURMA(NOME_TURMA,ANO,IDPROFESSOR) VALUES
	('1°A',2025,1),
    ('2°B',2025,2),
    ('3°C',2025,1),
    ('1°B',2025,3),
    ('2°A',2025,1);
    
-- QUESTÃO 1
SELECT NOME FROM PROFESSOR;
-- QUESTÃO 2
SELECT NOME FROM PROFESSOR WHERE DISCIPLINA = 'Matemática';
-- QUESTÃO 3
SELECT PROFESSOR.NOME, PROFESSOR.DISCIPLINA,TURMA.NOME_TURMA FROM PROFESSOR INNER JOIN TURMA ON PROFESSOR.IDPROFESSOR = TURMA.IDPROFESSOR WHERE TURMA.NOME_TURMA ='2°A';
-- QUESTÃO 4
SELECT TURMA.IDTURMA, TURMA.NOME_TURMA, PROFESSOR.IDPROFESSOR, PROFESSOR.NOME, PROFESSOR.DISCIPLINA FROM PROFESSOR INNER JOIN TURMA ON PROFESSOR.IDPROFESSOR = TURMA.IDPROFESSOR;
