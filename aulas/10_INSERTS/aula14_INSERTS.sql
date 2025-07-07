-- criando uma SEQUENCE para o id de alunos
CREATE SEQUENCE seq_alunos
START WITH 4 -- inicia com o próximo valor de id_aluno
INCREMENT BY 1;

-- INSERT com a descrição dos campos
SELECT * FROM alunos;

INSERT INTO alunos(id_aluno, nome, data_nascimento, sexo, data_cadastro, login_cadastro)
VALUES (NEXT VALUE FOR seq_alunos, 'Bernardo Capellini', '20-10-2017', 'M', GETDATE(), 'KAIQUE');

-- INSERT de curso usando variável
SELECT * FROM cursos;

DECLARE @idCurso INT;
SELECT @idCurso = MAX(id_curso) + 1 FROM cursos;

INSERT INTO cursos(id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES (@idCurso, 'VBA Avançado II', GETDATE(), 'Kaique');

-- SELECT com INSERT
SELECT * FROM cursos;
SELECT * FROM nova_tabela;

SELECT
	*
INTO nova_tabela -- copia os dados do SELECT para uma nova tabela
FROM cursos;

-- remover uma tabela
DROP TABLE nova_tabela;

-- apaga os dados de uma tabela;
DELETE FROM nova_tabela;

-- INSERT com SELECT
INSERT INTO nova_tabela(id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT id_curso, nome_curso, GETDATE(), 'Onencio' 
FROM cursos
WHERE id_curso > 5; -- insere na tabela todos os cursos com id_curso acima de 5

