-- Estrutura de decisão CASE

SELECT * FROM alunosTemp;

-- Trocando 'M' para 'Masculino' e 'F' para 'Feminino'
SELECT 
	a.nome,
	CASE a.sexo 
		WHEN 'M' THEN 'Masculino'
		WHEN 'F' THEN 'Feminino'
		ELSE 'Verifique'
	END AS 'sexo',
	c.nome_curso
FROM alunos a
INNER JOIN alunos_turmas at ON at.id_aluno = a.id_aluno
INNER JOIN turmas t ON t.id_turma = at.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso;

-- Verificando o ANO
SELECT 
	a.nome,
	c.nome_curso, 
	at.valor, 
	CONVERT(DATE, t.data_inicio) AS 'dt_inicio',
	CASE YEAR(data_inicio)
		WHEN 2024 THEN 'ano anterior'
		WHEN 2025 THEN 'ano atual'
		WHEN 2026 THEN 'próximo ano'
		ELSE 'ano inválido!'
	END analise_ano
FROM alunos a
INNER JOIN alunos_turmas at ON at.id_aluno = a.id_aluno
INNER JOIN turmas t ON t.id_turma = at.id_turma
INNER JOIN cursos c ON c.id_curso = t.id_curso;

SELECT 
	nome, 
	DATEDIFF(YEAR, data_nascimento, GETDATE()) AS 'idade',
	CASE 
		WHEN DATEDIFF(YEAR, data_nascimento, GETDATE()) >= 18 THEN 'maior de idade'
		WHEN DATEDIFF(YEAR, data_nascimento, GETDATE()) < 18 THEN 'menor de idade'
		ELSE 'idade inválida!'
	END analise_idade
FROM alunos