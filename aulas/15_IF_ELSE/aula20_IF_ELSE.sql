-- Condicionais (IF.. ELSE)

-- Estrutura simples do IF
IF 10 > 20 
	SELECT '10 é maior do que 20'; -- se for verdadeiro, executa aqui
ELSE
	SELECT '10 não é maior do que 20'; -- se for falso, executa aqui

-- IF com DATA
IF DATENAME(WEEKDAY, GETDATE()) IN ('Sábado', 'Domingo')
	SELECT 'Estamos no fim de semana. Hoje é: ' + DATENAME(WEEKDAY, GETDATE());
ELSE 
	SELECT 'Estamos em um dia da semana. Hoje é: ' + DATENAME(WEEKDAY, GETDATE()) + '-feira';

-- IF com variáveis globais do SQL

SELECT @@SERVERNAME;
SELECT @@LANGUAGE;
SELECT @@LANGID;
SELECT @@TRANCOUNT;

IF @@LANGUAGE <> 'Português (Brasil)'
	SELECT 'Today is: ' + DATENAME(WEEKDAY, GETDATE()); -- se a linguagem do SQL for diferente de PT-BR, executa aqui
ELSE 
	SELECT 'Hoje é: ' + DATENAME(WEEKDAY, GETDATE()); -- se não, executa aqui

-- IF com variáveis locais declaradas
DECLARE @idadeMax INT;
DECLARE @parametro INT;

SET @idadeMax = 18;
SET @parametro = 18;

IF @idadeMax >= @parametro
	SELECT 
		nome, 
		data_nascimento, 
		DATEDIFF(YEAR, data_nascimento, GETDATE()) AS 'idade',
		'Maior de idade' AS 'situação'
	FROM alunosTemp 
	WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) >= @idadeMax
	ORDER BY 3 ASC
ELSE
	SELECT 
		nome, 
		data_nascimento, 
		DATEDIFF(YEAR, data_nascimento, GETDATE()) AS 'idade',
		'Menor de idade' AS 'situação'
	FROM alunosTemp 
	WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) < @idadeMax
	ORDER BY 3 ASC;