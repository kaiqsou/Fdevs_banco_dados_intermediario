-- Alteração de tabelas

-- Adicionar colunas
SELECT * FROM alunosTemp;

ALTER TABLE alunosTemp
ADD cpf NUMERIC(11);

ALTER TABLE alunosTemp
ADD email VARCHAR(100);

UPDATE alunosTemp 
SET cpf = 11122233300 
WHERE id_aluno = 1;

-- Apagar colunas
SELECT * FROM alunosTemp;

ALTER TABLE alunosTemp
DROP COLUMN cpf;

ALTER TABLE alunosTemp
DROP COLUMN email;

-- Alterar tipo de dados de uma coluna
SELECT * FROM alunosTemp;

ALTER TABLE alunosTemp
ADD email INT;

ALTER TABLE alunosTemp
ALTER COLUMN email VARCHAR(100);
