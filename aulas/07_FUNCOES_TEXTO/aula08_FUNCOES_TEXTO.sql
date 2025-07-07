-- Funções de Texto

-- FORMAT: retorna um valor formatado e a cultura opcional (especificar)
-- Para dados dos tipos gerais usar CAST ou CONVERT
SELECT CONVERT(CHAR, GETDATE(), 103);

DECLARE @dt DATETIME = GETDATE(); -- declara uma 'variável'
SELECT FORMAT(@dt, 'd', 'en-US') AS 'data_americana',
	   FORMAT(@dt, 'd', 'zh-CN') AS 'data_chines_simplificado';

SELECT FORMAT(155896, '##-###-##') AS 'cod_prod';

SELECT 
	FORMAT(at.valor, 'N', 'en-US') AS 'formato_numerico',
	FORMAT(at.valor, 'G', 'en-US') AS 'formato_geral',
	FORMAT(at.valor, 'C', 'pt-BR') AS 'formato_monetario_BR'
FROM alunos_turmas at;

-- LEFT e RIGHT: extrai caracteres a esquerda ou direita de um texto/campo
SELECT LEFT('Kaique Onencio', 6); -- extrai os 6 primeiros caracteres da esquerda
SELECT RIGHT('Kaique Onencio', 7); -- extrai os 7 primeiros caracteres da direita

-- LEN: retorna o tamanho do campo
SELECT LEN('Kaique Onencio');
SELECT LEN('Teste de tamanho do texto');

-- UPPER e LOWER: converte os caracteres para maiúsculo ou minúsculo
SELECT UPPER('kaique');
SELECT LOWER('KAIQUE');