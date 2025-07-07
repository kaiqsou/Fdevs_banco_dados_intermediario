-- Total de TURMAS por CURSO
SELECT 
	c.id_curso,
	c.nome_curso,
	COUNT(id_turma) AS total_turma
FROM turmas t
INNER JOIN cursos c ON c.id_curso = t.id_curso
GROUP BY c.id_curso, c.nome_curso;

-- Verificando veracidade da quantidade de TURMAS por CURSO
SELECT * FROM turmas WHERE id_curso = 1; -- VBA I
SELECT * FROM turmas WHERE id_curso = 2; -- VBA II

-- Utilizar cláusula IN
SELECT * FROM turmas WHERE id_curso IN (1, 2); -- Mostra todas as turmas onde o id_curso é 1 ou 2
SELECT * FROM turmas WHERE id_curso NOT IN (1, 2); -- Mostra todas as turmas onde o id_curso não é 1 ou 2

-- Ano de nascimento dos alunos
SELECT 
	DISTINCT DATEPART(YEAR, data_nascimento) AS 'Ano' -- Traz o ANO de nascimento, sem repetir (distinct)
FROM alunos
ORDER BY 1 ASC; -- Crescente (padrão)

SELECT 
	DISTINCT DATEPART(YEAR, data_nascimento) AS 'Ano' -- Traz o ANO de nascimento, sem repetir (distinct)
FROM alunos
ORDER BY 1 DESC; -- Decrescente

-- Lista completa de ALUNOS
SELECT 
	c.id_curso,
	c.nome_curso,
	at.valor, 
	at.valor_desconto,
	t.data_inicio,
	t.data_termino,
	a.nome,
	a.sexo
FROM alunos_turmas at
INNER JOIN turmas t ON (t.id_turma = at.id_turma)
INNER JOIN cursos c ON (c.id_curso = t.id_curso)
INNER JOIN alunos a ON (a.id_aluno = at.id_aluno AND a.sexo = 'M') -- duas condições
-- WHERE a.sexo = 'M' - Opção para filtragem
ORDER BY 2, a.sexo; -- Ordenado pela coluna 2 (nome do curso) e por sexo