-- Consultas de Transa��es

SELECT * FROM alunosTemp;

-- BEGIN TRANSACTION: inicia uma transa��o

-- COMMIT: grava dados no banco
BEGIN TRANSACTION 
	UPDATE alunosTemp 
	SET sexo = LOWER(sexo);
COMMIT;

-- ROLLBACK: desfaz a��es feitas na transa��o
BEGIN TRANSACTION 
	UPDATE alunosTemp 
	SET sexo = LOWER(sexo);
ROLLBACK;

BEGIN TRANSACTION 
	DROP TABLE alunosTemp;
ROLLBACK;

-- Usando VARI�VEIS
DECLARE @TR1 VARCHAR(20);
SELECT @TR1 = 'Transa��o DELETE';

BEGIN TRANSACTION @TR1; -- nomeando TRANSACTIONS
	DELETE FROM alunosTemp
	WHERE nome LIKE 'B%';
COMMIT TRANSACTION @TR1;

-- Fazer v�rias TRANSACTIONS
CREATE TABLE testeTr
(
	id INT PRIMARY KEY,
	letra CHAR(1)
);

-- iniciar a vari�vel de controle de transactions @@TRANCOUNT para 1
BEGIN TRANSACTION TR1;
	PRINT 'Transaction: contador depois do 1� BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10)); -- coloca TEXTOS
	INSERT INTO testeTr(id, letra) VALUES(1, 'A');

-- a vari�vel de controle de transactions @@TRANCOUNT agora � 2
BEGIN TRANSACTION TR2;
	PRINT 'Transaction: contador depois do 2� BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO testeTr(id, letra) VALUES(2, 'B');

-- a vari�vel de controle de transactions @@TRANCOUNT agora � 3
BEGIN TRANSACTION TR3;
	PRINT 'Transaction: contador depois do 3� BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO testeTr(id, letra) VALUES(3, 'C');

-- a vari�vel de controle de transactions @@TRANCOUNT agora � 2, o 'commit' DIMINUI o contador
COMMIT TRANSACTION TR2;
	PRINT 'Transaction: contador depois do COMMIT TR2 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

-- a vari�vel de controle de transactions @@TRANCOUNT agora � 1
COMMIT TRANSACTION TR1;
	PRINT 'Transaction: contador depois do COMMIT TR1 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

-- a vari�vel de controle de transactions @@TRANCOUNT agora � 0
COMMIT TRANSACTION TR3;
	PRINT 'Transaction: contador depois do COMMIT TR3 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));