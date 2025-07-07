-- Consultas de Transações

SELECT * FROM alunosTemp;

-- BEGIN TRANSACTION: inicia uma transação

-- COMMIT: grava dados no banco
BEGIN TRANSACTION 
	UPDATE alunosTemp 
	SET sexo = LOWER(sexo);
COMMIT;

-- ROLLBACK: desfaz ações feitas na transação
BEGIN TRANSACTION 
	UPDATE alunosTemp 
	SET sexo = LOWER(sexo);
ROLLBACK;

BEGIN TRANSACTION 
	DROP TABLE alunosTemp;
ROLLBACK;

-- Usando VARIÁVEIS
DECLARE @TR1 VARCHAR(20);
SELECT @TR1 = 'Transação DELETE';

BEGIN TRANSACTION @TR1; -- nomeando TRANSACTIONS
	DELETE FROM alunosTemp
	WHERE nome LIKE 'B%';
COMMIT TRANSACTION @TR1;

-- Fazer várias TRANSACTIONS
CREATE TABLE testeTr
(
	id INT PRIMARY KEY,
	letra CHAR(1)
);

-- iniciar a variável de controle de transactions @@TRANCOUNT para 1
BEGIN TRANSACTION TR1;
	PRINT 'Transaction: contador depois do 1º BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10)); -- coloca TEXTOS
	INSERT INTO testeTr(id, letra) VALUES(1, 'A');

-- a variável de controle de transactions @@TRANCOUNT agora é 2
BEGIN TRANSACTION TR2;
	PRINT 'Transaction: contador depois do 2º BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO testeTr(id, letra) VALUES(2, 'B');

-- a variável de controle de transactions @@TRANCOUNT agora é 3
BEGIN TRANSACTION TR3;
	PRINT 'Transaction: contador depois do 3º BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO testeTr(id, letra) VALUES(3, 'C');

-- a variável de controle de transactions @@TRANCOUNT agora é 2, o 'commit' DIMINUI o contador
COMMIT TRANSACTION TR2;
	PRINT 'Transaction: contador depois do COMMIT TR2 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

-- a variável de controle de transactions @@TRANCOUNT agora é 1
COMMIT TRANSACTION TR1;
	PRINT 'Transaction: contador depois do COMMIT TR1 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

-- a variável de controle de transactions @@TRANCOUNT agora é 0
COMMIT TRANSACTION TR3;
	PRINT 'Transaction: contador depois do COMMIT TR3 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));