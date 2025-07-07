-- Total de TURMAS por CURSO
-- Sempre que usar funções de agregações, é necessário agrupar as informações com GROUP BY!
SELECT 
	c.id_curso, 
	c.nome_curso, 
	COUNT(t.id_turma) AS total_turmas
FROM 
	turmas t
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY c.id_curso, c.nome_curso;

-- Trazer TODOS os cursos, independente se neles há ou não turmas
-- Tabela da direita (foco do right join): CURSOS
SELECT
	c.nome_curso, COUNT(t.id_turma) AS total_turmas
FROM turmas t
RIGHT JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY c.nome_curso;

-- Informações completas de ALUNOS com INNER JOIN
SELECT 
	a.nome, a.sexo, a.data_nascimento,
	c.nome_curso, c.data_cadastro,
	t.data_inicio, t.data_termino,
	at.valor, at.valor_desconto 
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso
INNER JOIN alunos a ON a.id_aluno = at.id_aluno

-- Total de ALUNOS em TURMAS por CURSOS
SELECT 
	c.nome_curso,
	t.id_turma,
	COUNT(1) AS total_alunos	
FROM turmas t
INNER JOIN alunos_turmas at ON at.id_turma = t.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY c.nome_curso, t.id_turma;

SELECT * FROM turmas;
