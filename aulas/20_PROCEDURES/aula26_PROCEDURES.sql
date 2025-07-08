-- PROCEDURES são conjunto de comandos SQL que serão executadas de uma só vez

-- PROCEDURE com validação
CREATE PROCEDURE novoCursoComValidacao
	@nomeCurso VARCHAR(100),
	@loginCadastro VARCHAR(100)
AS
BEGIN
	DECLARE @idCurso INT,
			@existeCurso INT;

	SELECT -- verificando se o curso existe
		@existeCurso = id_curso 
	FROM cursos 
	WHERE nome_curso = @nomeCurso;

	IF @existeCurso > 0 -- se o retorno for maior do que 0, é porque existe
		BEGIN 
			SELECT 'O curso já existe!';
		END
	ELSE -- se não, entra aqui
		BEGIN
			SELECT @idCurso = MAX(id_curso) + 1 -- procura o último ID de curso e soma +1 para a variável @idCurso
			FROM cursos; 

			INSERT INTO cursos(id_curso, nome_curso, data_cadastro, login_cadastro) -- insere o novo curso se não existir
			VALUES(@idCurso, @nomeCurso, GETDATE(), @loginCadastro);

			SELECT @idCurso = id_curso	-- atribui a variavel @idCurso o novo id, para retornar em seguida
			FROM cursos
			WHERE id_curso = @idCurso;

			SELECT @idCurso AS 'retorno';
		END
END;

-- Executando a PROCEDURE
EXEC novoCursoComValidacao 'VBA IV', 'KAIQUE';
SELECT * FROM cursos;