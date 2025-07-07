-- DROP TABLE: apaga tabelas do banco de dados
DROP TABLE delete_alunos;
DROP TABLE nova_tabela;

-- Apagar SEQUENCES
DROP SEQUENCE seq_teste_1;
DROP SEQUENCE seq_teste_2;

-- Apagar ÍNDICES
CREATE INDEX indAlunos ON alunos(id_aluno) -- índices facilitam a procura de dados em tabelas
DROP INDEX alunos.indAlunos;

-- Apagar PROCEDURES
CREATE PROCEDURE prcListaAlunos AS	-- essa procedure é tipo uma FUNÇÃO listaAlunos()
SELECT 
	al.nome, al.data_nascimento
FROM alunos al
WHERE al.nome LIKE '%K%';

EXEC prcListaAlunos;

DROP PROCEDURE prcListaAlunos;

-- Apagar CONSTRAINTS
SELECT NAME FROM SYS.key_constraints WHERE NAME LIKE 'pk%';

SELECT * INTO apagar_constraint FROM cursos; -- enviando todos os dados de CURSOS para a tabela temporária
ALTER TABLE apagar_constraint ADD CONSTRAINT pk_idcurso UNIQUE (id_curso); -- adicionando CONSTRAINT

ALTER TABLE apagar_constraint
DROP CONSTRAINT pk_idcurso;

-- Apagar VIEWS
CREATE VIEW viewAlunosTurmas AS -- views facilitam na hora de escrever um código select muito extenso
SELECT 
	nome, 
	data_nascimento, 
	DATEDIFF(YEAR, data_nascimento, GETDATE()) AS 'idade'
FROM alunos
WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) <= 21;

SELECT viewAlunosTurmas; -- visualiza a VIEW

DROP VIEW viewAlunosTurmas;

-- DROP DATABASE: apaga um banco de dados;
CREATE DATABASE banco_delete;
DROP DATABASE banco_delete;