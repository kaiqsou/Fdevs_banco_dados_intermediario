-- Condicionais (IF.. ELSE)

-- Estrutura simples do IF
IF 10 > 20 
	SELECT '10 � maior do que 20'; -- se for verdadeiro, executa aqui
ELSE
	SELECT '10 n�o � maior do que 20'; -- se for falso, executa aqui

-- IF com DATA
IF DATENAME(WEEKDAY, GETDATE()) IN ('S�bado', 'Domingo')
	SELECT 'Estamos no fim de semana. Hoje �: ' + DATENAME(WEEKDAY, GETDATE());
ELSE 
	SELECT 'Estamos em um dia da semana. Hoje �: ' + DATENAME(WEEKDAY, GETDATE()) + '-feira';

-- IF com vari�veis globais do SQL

SELECT @@SERVERNAME;
SELECT @@LANGUAGE;
SELECT @@LANGID;
SELECT @@TRANCOUNT;

IF @@LANGUAGE <> 'Portugu�s (Brasil)'
	SELECT 'Today is: ' + DATENAME(WEEKDAY, GETDATE()); -- se a linguagem do SQL for diferente de PT-BR, executa aqui
ELSE 
	SELECT 'Hoje �: ' + DATENAME(WEEKDAY, GETDATE()); -- se n�o, executa aqui

-- IF com vari�veis locais declaradas
DECLARE @idadeMax INT;
DECLARE @parametro INT;

SET @idadeMax = 18;
SET @parametro = 18;

IF @idadeMax >= @parametro
	SELECT 
		nome, 
		data_nascimento, 
		DATEDIFF(YEAR, data_nascimento, GETDATE()) AS 'idade',
		'Maior de idade' AS 'situa��o'
	FROM alunosTemp 
	WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) >= @idadeMax
	ORDER BY 3 ASC
ELSE
	SELECT 
		nome, 
		data_nascimento, 
		DATEDIFF(YEAR, data_nascimento, GETDATE()) AS 'idade',
		'Menor de idade' AS 'situa��o'
	FROM alunosTemp 
	WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) < @idadeMax
	ORDER BY 3 ASC;