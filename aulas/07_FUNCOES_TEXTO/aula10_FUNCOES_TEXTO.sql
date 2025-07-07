-- Fun��es de Texto

-- SPACE: gera espa�os a partir de uma instru��o
SELECT 'Kaique' + SPACE(25);
SELECT 'Kaique' + SPACE(25) + 'x';

-- STRING_AGG: concatena o valores das express�es de cadeia de caracteres e coloca os valores do separador
-- entre eles. O separador n�o � adicionado ao final da cadeia de caracteres. Valores NULLS n�o s�o exibidos!
SELECT STRING_AGG(CONVERT(NVARCHAR(MAX), sexo), ', ') AS registro
FROM alunos;

SELECT STRING_AGG(CONVERT(NVARCHAR(MAX), ISNULL(sexo, 'N')), '-') AS registro -- se sexo for NULL, exibir� 'N'
FROM alunos;

-- STUFF: substitui uma string de caractere a partir de uma posi��o pr�-determinada
SELECT STUFF('abcdefghi', 3, 5, '12345'); -- a partir da 3 posi��o, substitua os 5 primeiros caracteres por '12345'
SELECT STUFF('Kaike', 4, 2, 'que');