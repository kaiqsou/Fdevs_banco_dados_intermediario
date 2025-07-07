-- Funções de Texto

-- CASE/WHEN: adiciona condições nas consultas
SELECT 
	CASE a.sexo
	WHEN 'M' THEN
		'É homem' -- se o sexo for M, executa aqui
	ELSE
		'Não é homem' -- se o não sexo for M, executa aqui
	END AS 'É homem?'
FROM alunos a;

-- IIF: outra forma de adicionar condições nas consultas
SELECT
	a.nome,
	IIF(a.sexo = 'M', 'É homem', 'Não é homem') AS 'É homem?'
FROM alunos a;

-- TRANSLATE: faz a substituição de caracteres
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()'); -- substitui []{} por ()()

-- TRIM: elimina espaços em branco
SELECT TRIM('     Kaique Souza     ');

-- WHILE: cria um loop de repetição
DECLARE @num INT;
SET @num = 1;

WHILE 
	@num <= 10 -- enquanto a variável @num for menor ou igual a 10, executa o código abaixo
BEGIN
	SELECT * FROM alunos WHERE id_aluno = @num;
	SET @num = @num + 1; -- incrementa +1
END
