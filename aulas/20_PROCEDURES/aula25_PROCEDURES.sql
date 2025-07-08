-- PROCEDURES são conjunto de comandos SQL que serão executadas de uma só vez

-- Criando a PROCEDURE
CREATE PROCEDURE buscarCurso
	@nomeCurso VARCHAR(20)
AS
SET @nomeCurso = '%' + @nomeCurso + '%';
SELECT 
	c.id_curso,
	c.nome_curso,
	a.nome
FROM cursos c
INNER JOIN turmas t ON t.id_curso = c.id_curso
INNER JOIN alunos_turmas at ON at.id_turma = t.id_turma
INNER JOIN alunos a ON a.id_aluno = at.id_aluno
WHERE nome_curso LIKE @nomeCurso;

-- Executando a PROCEDURE
EXEC buscarCurso 'VBA I'; -- procurando todos os alunos do curso VBA I
EXEC buscarCurso '%'; -- procurando todos os alunos de todos os cursos

-- Procedure com RETORNO
CREATE PROCEDURE novoCurso
	@nomeCurso VARCHAR(100),
	@loginCadastro VARCHAR(100)
AS
BEGIN
	DECLARE @idCurso INT;

	SELECT -- pega o ID máximo para incluir o novo curso
		@idCurso = MAX(id_curso) + 1 
	FROM cursos; 

	INSERT INTO cursos(id_curso, nome_curso, data_cadastro, login_cadastro) -- insere o novo curso
	VALUES(@idCurso, @nomeCurso, GETDATE(), @loginCadastro);

	SELECT -- faz o SELECT no novo curso criado
		@idCurso = id_curso 
	FROM cursos 
	WHERE id_curso = @idCurso;

	SELECT @idCurso AS 'retorno'; -- o id_curso será o RETORNO da procedure
END;

EXEC novoCurso 'VBA V', 'Kaique';
SELECT * FROM cursos;