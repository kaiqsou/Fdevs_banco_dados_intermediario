-- Fun��es de Texto

-- LTRIM: remove espa�os � esquerda de um texto
SELECT LTRIM('   Kaique');

-- RTRIM: remove espa�os � direita de um texto
SELECT RTRIM('Kaique    ');

-- PATINDEX: retorna a posi��o inicial da primeira ocorr�ncia de um padr�o
SELECT PATINDEX('%aiq%', 'Kaique'); -- pesquisa 'aiq' em qualquer posi��o e retorna o n�mero de sua posi��o
SELECT PATINDEX('%o', 'Onencio'); -- pesquisa 'o' na �ltima posi��o e retorna o n�mero de sua posi��o
SELECT PATINDEX('o%', 'Onencio'); -- pesquisa 'o' na primeira posi��o e retorna o n�mero de sua posi��o

-- SUBSTRING: extrai um texto a partir de uma posi��o espec�fica
DECLARE @texto VARCHAR(100);
SET @texto = 'Teste de texto aqui';
SELECT SUBSTRING(@texto, PATINDEX('%tex%', @texto), 7);

-- REPLACE: substitui caracteres em um campo
SELECT REPLACE('Caike', 'C', 'K');
SELECT REPLACE(REPLACE('Caike', 'C', 'K'), 'ke', 'que');

-- REPLICATE: replica caracteres X vezes
SELECT REPLICATE('Kaique ', 5);

-- REVERSE: inverte uma string
SELECT REVERSE('Kaique');