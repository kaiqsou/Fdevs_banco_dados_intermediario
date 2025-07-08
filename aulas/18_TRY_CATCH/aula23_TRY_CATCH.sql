-- Tratamento de Erros (TRY...CATCH)

-- Tabela não existente fora de uma PROCEDURE

BEGIN TRY -- tenta executar o código abaixo
	SELECT * FROM tabela_NA; -- vai dar erro aqui, por não estar em uma PROCEDURE
END TRY
BEGIN CATCH -- se não executar, vem pra cá
	SELECT ERROR_NUMBER() AS 'numero_erro',
		   ERROR_MESSAGE() AS 'mensagem_erro';
END CATCH;

-- Tabela não existente, utilizando uma PROCEDURE
CREATE PROCEDURE prc_try AS 
SELECT * FROM tabela_NA; -- uma procedure para simplesmente fazer select numa tabela que não existe
GO

BEGIN TRY
	EXECUTE prc_try;
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS 'numero_erro',
		   ERROR_MESSAGE() AS 'mensagem_erro';
END CATCH;

-- Retornos possíveis de erros

BEGIN
	BEGIN TRY
		SELECT 1/0;
	END TRY
	BEGIN CATCH
		PRINT 'Error NUMBER: ' + CONVERT(CHAR, ERROR_NUMBER());
		PRINT 'Error MESSAGE: ' + ERROR_MESSAGE();
		PRINT 'Error SEVERITY: ' + CONVERT(CHAR, ERROR_SEVERITY());
		PRINT 'Error STATE: ' + CONVERT(CHAR, ERROR_STATE());
		PRINT 'Error LINE: ' + CONVERT(CHAR, ERROR_LINE());
		PRINT 'Error PROC: ' + CONVERT(CHAR, ERROR_PROCEDURE());
	END CATCH;
END