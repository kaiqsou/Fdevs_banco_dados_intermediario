-- Soma do valor de turmas
SELECT 
	t.id_turma,
	c.nome_curso,
	SUM(valor) AS 'total' 
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma 
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY t.id_turma, c.nome_curso

-- Subconsulta (subquery)
SELECT 
	SUM(v.total) 
FROM (
	SELECT 
		t.id_turma,
		c.nome_curso,
		SUM(valor) AS 'total' 
	FROM alunos_turmas at
	INNER JOIN turmas t ON t.id_turma = at.id_turma 
	INNER JOIN cursos c ON c.id_curso = t.id_curso
	GROUP BY t.id_turma, c.nome_curso
) v;

-- Função de contagem (COUNT)
SELECT 
	t.id_turma,
	COUNT(at.id_aluno) AS 'total_alunos',
	SUM(at.valor) AS 'total_valor'
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma
GROUP BY t.id_turma

SELECT 
	t.id_turma,
	COUNT(1) AS 'total_alunos' -- para cada linha, o SQL adicionará o número 1
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma
GROUP BY t.id_turma

-- Média/Average (AVG)
SELECT 
	t.id_turma,
	c.nome_curso,
	AVG(valor) AS 'média' 
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma 
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY t.id_turma, c.nome_curso	

-- Máximo (MAX) - Acha o maior valor
SELECT 
	t.id_turma,
	c.nome_curso,
	MAX(valor) AS 'valor_max' 
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma 
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY t.id_turma, c.nome_curso

-- Mínimo (MIN) - Acha o menor valor
SELECT 
	t.id_turma,
	c.nome_curso,
	MIN(valor) AS 'valor_min' 
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma 
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY t.id_turma, c.nome_curso

-- Mínimo (MIN) & Máximo (MAX)
SELECT 
	t.id_turma,
	c.nome_curso,
	MIN(valor) AS 'valor_min',
	MAX(valor) AS 'valor_max',
	MAX(valor) - MIN(valor) AS 'diferença'
FROM alunos_turmas at
INNER JOIN turmas t ON t.id_turma = at.id_turma 
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY t.id_turma, c.nome_curso