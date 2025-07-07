-- Funções de Texto

-- SPACE: gera espaços a partir de uma instrução
SELECT 'Kaique' + SPACE(25);
SELECT 'Kaique' + SPACE(25) + 'x';

-- STRING_AGG: concatena o valores das expressões de cadeia de caracteres e coloca os valores do separador
-- entre eles. O separador não é adicionado ao final da cadeia de caracteres. Valores NULLS não são exibidos!
SELECT STRING_AGG(CONVERT(NVARCHAR(MAX), sexo), ', ') AS registro
FROM alunos;

SELECT STRING_AGG(CONVERT(NVARCHAR(MAX), ISNULL(sexo, 'N')), '-') AS registro -- se sexo for NULL, exibirá 'N'
FROM alunos;

-- STUFF: substitui uma string de caractere a partir de uma posição pré-determinada
SELECT STUFF('abcdefghi', 3, 5, '12345'); -- a partir da 3 posição, substitua os 5 primeiros caracteres por '12345'
SELECT STUFF('Kaike', 4, 2, 'que');