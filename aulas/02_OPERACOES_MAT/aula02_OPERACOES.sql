-- Soma
SELECT 1 + 2 AS 'Soma de 1 + 2';
SELECT 1.50 + 2.80 AS 'Soma de 1.50 + 2.80';

-- Subtra��o
SELECT 2 - 1 AS 'Subtra��o de 2 - 1';
SELECT 1.20 - 0.55 AS 'Subtra��o de 1.20 - 0.55';

-- Multiplica��o
SELECT 3 * 2 AS 'Multiplica��o de 3x2';
SELECT 50 * 0.5 AS 'Multiplica��o de 50x0.5';

-- Divis�o
SELECT 10 / 2 AS 'Divis�o de 10/2';
SELECT 20 / 0.5 AS 'Divis�o de 20/0.5';
    
-- Potencia��o (n�o � ^ no SQL)
SELECT SQUARE(2) AS '2^2'; -- fun��o para retornar o quadrado de um n�mero (2^2)
SELECT POWER(3,5) AS '3^5'; -- fun��o para retornar a pot�ncia de um n�mero (3^5)

-- Porcentagem
SELECT 100 * 0.1 AS '10% de 100'; -- descobrindo quanto � 10% de 100
SELECT 100 * 1.1 AS '100 + 10%'; -- somando 10% pra 100
SELECT 100 - (100 * 0.1) AS '100 - 10%'; -- tirando 10% de 100
SELECT 100 + (100 * 0.05) AS '100 + 5%'; -- somando 5% pra 100

-- ABS (retorna o n�mero sem o sinal)
SELECT ABS(-100) AS 'ABS de -100'; -- retorna 100
SELECT ABS(100 - 50) AS 'ABS de 100 - 50'; -- retorna 50
	
-- Ra�z Quadrada
SELECT SQRT(49) AS 'Ra�z Quadrada de 49'; -- descobre a ra�z quadrada de 49
SELECT SQRT(81) AS 'Ra�z Quadrada de 81'; -- descobre a ra�z quadrada de 81

-- PI
SELECT PI() AS 'Valor do PI';

-- Data Atual
SELECT GETDATE() AS 'Resultado';

-- Fun��o Sign (verificar o sinal)
SELECT SIGN(10) AS 'Resultado'; -- retorna 1
SELECT SIGN(-10) AS 'Resultado'; -- retorna -1	
SELECT SIGN(0) AS 'Resultado'; -- retorna 0
SELECT SIGN(null) AS 'Resultado'; -- retorna null

-- Fun��o Sum (soma)
SELECT SUM(1 + 2);
SELECT SUM(10.5 + 1.7);
