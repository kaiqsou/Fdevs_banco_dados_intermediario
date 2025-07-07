-- DELETE SEM WHERE: remove todos dados de uma tabela

SELECT * INTO tabela_temporaria FROM cursos; -- criar uma nova tabela com os dados de cursos 
SELECT * FROM tabela_temporaria;

DELETE FROM tabela_temporaria; -- remove todos os dados da tabela
DROP TABLE tabela_temporaria; -- apaga a tabela

-- DELETE COM WHERE: aplica condições na hora de remover dados da tabela

DELETE FROM tabela_temporaria
WHERE nome_curso LIKE '%Avançado%'; -- vai deletar todos os dados que tenha 'Avançado' em qualquer parte do nome_curso

DELETE FROM tabela_temporaria
WHERE nome_curso = 'VBA I'; -- vai deletar os registros especificamente do curso VBA I

-- Apagar alunos que não estão em nenhum curso
SELECT * INTO delete_alunos FROM alunos; -- criar uma nova tabela com os dados de cursos 
SELECT * FROM delete_alunos;
DROP TABLE delete_alunos;

-- Opção 1
DELETE FROM delete_alunos 
WHERE id_aluno NOT IN 
(
	SELECT 
		a.id_aluno 
	FROM delete_alunos a
	INNER JOIN alunos_turmas at ON at.id_aluno = a.id_aluno
)

-- Opção 2
SELECT 
		a.nome, a.sexo 
FROM delete_alunos a 
WHERE a.id_aluno NOT IN
(
	SELECT at.id_aluno
	FROM alunos_turmas at
	WHERE a.id_aluno = at.id_aluno
)

-- Apagar todos os registros de alunos com mais de 30 anos

-- 1) Identificar os registros:
SELECT 
	a.nome, 
	DATEDIFF(YEAR, a.data_nascimento, GETDATE()) AS 'idade',
	a.sexo
FROM alunos a
WHERE DATEDIFF(YEAR, a.data_nascimento, GETDATE()) > 30
ORDER BY 1;

-- 2) Apagar os registros:
DELETE FROM delete_alunos 
WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) > 30;

-- 3) Query Unificada:
DELETE FROM delete_alunos 
WHERE id_aluno IN 
(
	SELECT 
		a.id_aluno
	FROM alunos a
	WHERE DATEDIFF(YEAR, a.data_nascimento, GETDATE()) > 30
);