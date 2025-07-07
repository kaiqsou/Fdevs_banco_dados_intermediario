-- La�os de repeti��o

-- Substitui��o de valores com WHILE
DECLARE @string VARCHAR(100);
SET @string = 'SQL		SERVER		|';

WHILE CHARINDEX('  ', @string) > 0	-- enquanto encontrar 2 espa�os, executar� o c�digo abaixo
BEGIN
	SET @string = REPLACE(@string, '  ', ' ') -- trocar dois espa�os por um �nico espa�o;
END;

SELECT @string;

-- Fazendo um contador com WHILE
DECLARE @contador INT;
SET @contador = 1;

WHILE (@contador <= 10)
BEGIN
	PRINT 'O contador est� em: ' + CONVERT(VARCHAR, @contador); -- converte o @contador INT pra VARCHAR
	SET @contador = @contador + 1;
END

-- Adicionando condi��es num contador WHILE
DECLARE @cont INT;
SET @cont = 1;

WHILE (@cont <= 10)
BEGIN
	PRINT 'O contador est� em: ' + CONVERT(VARCHAR, @cont);
	IF @cont = 7
		BREAK	-- se o @cont for igual a 7, encerra o la�o de repeti��o
	SET @cont = @cont + 1;
END

-- N�meros impares e pares
DECLARE @cont2 INT;
SET @cont2 = 1;

WHILE (@cont2 <= 17) -- pesquisando n�meros �mpares
BEGIN
	IF @cont2 % 2 = 0 -- se o RESTO da divis�o de @cont por 2 for igual a 0 (n�mero par), entra aqui 
	BEGIN			  -- para visualizar os pares, � s� trocar 0 para 1
		SET @cont2 = @cont2 + 1; -- pula para o pr�ximo valor
		CONTINUE
	END
	PRINT 'O valor �: ' + CONVERT(VARCHAR, @cont2)

	SET @cont2 = @cont2 + 1;
END