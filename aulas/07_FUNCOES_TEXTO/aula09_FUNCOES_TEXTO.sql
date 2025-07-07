-- Funções de Texto

-- LTRIM: remove espaços à esquerda de um texto
SELECT LTRIM('   Kaique');

-- RTRIM: remove espaços à direita de um texto
SELECT RTRIM('Kaique    ');

-- PATINDEX: retorna a posição inicial da primeira ocorrência de um padrão
SELECT PATINDEX('%aiq%', 'Kaique'); -- pesquisa 'aiq' em qualquer posição e retorna o número de sua posição
SELECT PATINDEX('%o', 'Onencio'); -- pesquisa 'o' na última posição e retorna o número de sua posição
SELECT PATINDEX('o%', 'Onencio'); -- pesquisa 'o' na primeira posição e retorna o número de sua posição

-- SUBSTRING: extrai um texto a partir de uma posição específica
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