-- UNION: permite unir os resultados das expressões, sem repetições
SELECT 
	a.nome
FROM alunos a
WHERE a.sexo = 'M' -- busca todos os alunos de sexo masculino

UNION -- une os dois selects

SELECT 
	a.nome
FROM alunos a
WHERE a.sexo = 'F'; -- busca todos os alunos de sexo feminino

-- UNION ALL: permite unir os resultados das expressões, incluindo repetições	

SELECT 
	a.nome
FROM alunos a
WHERE a.sexo = 'M'

UNION ALL

SELECT 
	a.nome
FROM alunos a
WHERE a.sexo = 'F';