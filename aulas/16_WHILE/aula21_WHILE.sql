-- Laços de repetição

-- Substituição de valores com WHILE
DECLARE @string VARCHAR(100);
SET @string = 'SQL		SERVER		|';

WHILE CHARINDEX('  ', @string) > 0	-- enquanto encontrar 2 espaços, executará o código abaixo
BEGIN
	SET @string = REPLACE(@string, '  ', ' ') -- trocar dois espaços por um único espaço;
END;

SELECT @string;

-- Fazendo um contador com WHILE
DECLARE @contador INT;
SET @contador = 1;

WHILE (@contador <= 10)
BEGIN
	PRINT 'O contador está em: ' + CONVERT(VARCHAR, @contador); -- converte o @contador INT pra VARCHAR
	SET @contador = @contador + 1;
END

-- Adicionando condições num contador WHILE
DECLARE @cont INT;
SET @cont = 1;

WHILE (@cont <= 10)
BEGIN
	PRINT 'O contador está em: ' + CONVERT(VARCHAR, @cont);
	IF @cont = 7
		BREAK	-- se o @cont for igual a 7, encerra o laço de repetição
	SET @cont = @cont + 1;
END

-- Números impares e pares
DECLARE @cont2 INT;
SET @cont2 = 1;

WHILE (@cont2 <= 17) -- pesquisando números ímpares
BEGIN
	IF @cont2 % 2 = 0 -- se o RESTO da divisão de @cont por 2 for igual a 0 (número par), entra aqui 
	BEGIN			  -- para visualizar os pares, é só trocar 0 para 1
		SET @cont2 = @cont2 + 1; -- pula para o próximo valor
		CONTINUE
	END
	PRINT 'O valor é: ' + CONVERT(VARCHAR, @cont2)

	SET @cont2 = @cont2 + 1;
END