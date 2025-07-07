-- Ganho com TURMAS

-- 1. Quanto paga cada aluno
SELECT
	t.id_turma,
	c.nome_curso, 
	at.valor AS 'valor_bruto',
	at.valor_desconto AS 'valor_desconto',
	at.valor * at.valor_desconto AS 'desconto',
	at.valor - (at.valor * at.valor_desconto) AS 'valor_liquido'
FROM turmas t
INNER JOIN alunos_turmas at ON at.id_turma = t.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso

-- 2. Somatória de todos os valores pra cada curso
SELECT
	c.nome_curso, 
	SUM(at.valor) AS 'valor_bruto',
	SUM(at.valor * at.valor_desconto) AS 'desconto',
	SUM(at.valor - (at.valor * at.valor_desconto)) AS 'valor_liquido'
FROM turmas t
INNER JOIN alunos_turmas at ON at.id_turma = t.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY c.nome_curso

-- 3. Somatória de todos os valores pra cada turma por curso
SELECT
	t.id_turma, 
	c.nome_curso,
	SUM(at.valor) AS 'valor_bruto',
	SUM(at.valor * at.valor_desconto) AS 'desconto',
	SUM(at.valor - (at.valor * at.valor_desconto)) AS 'valor_liquido'
FROM turmas t
INNER JOIN alunos_turmas at ON at.id_turma = t.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY t.id_turma, c.nome_curso

-- 4. Arredondamento dos valores (round)
SELECT
	t.id_turma, 
	c.nome_curso,
	ROUND(SUM(at.valor),2) AS 'valor_bruto',
	ROUND(SUM(at.valor * at.valor_desconto),2) AS 'desconto',
	ROUND(SUM(at.valor - (at.valor * at.valor_desconto)),2) AS 'valor_liquido'
FROM turmas t
INNER JOIN alunos_turmas at ON at.id_turma = t.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY t.id_turma, c.nome_curso

-- 5. Ganhos por ANO
SELECT
	YEAR(t.data_inicio) AS 'ano',
	SUM(at.valor) AS 'valor_bruto',
	ROUND(SUM(at.valor * at.valor_desconto),2) AS 'desconto',
	ROUND(SUM(at.valor - (at.valor * at.valor_desconto)),2) AS 'valor_liquido'
FROM turmas t
INNER JOIN alunos_turmas at ON at.id_turma = t.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY YEAR(t.data_inicio)