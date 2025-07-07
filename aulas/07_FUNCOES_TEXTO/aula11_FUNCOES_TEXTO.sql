-- Fun��es de Texto

-- CASE/WHEN: adiciona condi��es nas consultas
SELECT 
	CASE a.sexo
	WHEN 'M' THEN
		'� homem' -- se o sexo for M, executa aqui
	ELSE
		'N�o � homem' -- se o n�o sexo for M, executa aqui
	END AS '� homem?'
FROM alunos a;

-- IIF: outra forma de adicionar condi��es nas consultas
SELECT
	a.nome,
	IIF(a.sexo = 'M', '� homem', 'N�o � homem') AS '� homem?'
FROM alunos a;

-- TRANSLATE: faz a substitui��o de caracteres
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()'); -- substitui []{} por ()()

-- TRIM: elimina espa�os em branco
SELECT TRIM('     Kaique Souza     ');

-- WHILE: cria um loop de repeti��o
DECLARE @num INT;
SET @num = 1;

WHILE 
	@num <= 10 -- enquanto a vari�vel @num for menor ou igual a 10, executa o c�digo abaixo
BEGIN
	SELECT * FROM alunos WHERE id_aluno = @num;
	SET @num = @num + 1; -- incrementa +1
END
