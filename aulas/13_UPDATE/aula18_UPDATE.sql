-- Atualizando tabelas

SELECT * FROM alunosTemp;

-- UPDATE sem WHERE: atualiza TODOS os registros
UPDATE alunosTemp 
SET sexo = 'M';

-- UPDATE com WHERE: atualiza os registros que atendem as condições
UPDATE alunosTemp 
SET sexo = 'F'
WHERE nome = 'Kaique Onencio'; -- sem LIKE, precisa passar inteiro

UPDATE alunosTemp 
SET sexo = 'M'
WHERE nome LIKE '%Kaique%'; -- usando LIKE

UPDATE alunosTemp
SET sexo = 'F'
WHERE id_aluno BETWEEN 1 AND 4;	-- atualiza todos os sexos dos alunos com id entre 1 e 4

UPDATE alunosTemp
SET sexo = 'M'
WHERE id_aluno IN(1,2,4); -- atualiza todos os sexos dos alunos com o valor de id que está dentro do IN

UPDATE alunosTemp
SET sexo = NULL		-- deixa o campo de sexo NULO
WHERE id_aluno = 3;

UPDATE alunosTemp
SET sexo = 'F'
WHERE id_aluno IN(1,3,4) 
AND sexo IS NULL;	-- atualiza os campos de sexo onde o id_aluno é 1, 3, 4 E onde o sexo for NULL, 2 condições

-- UPDATE para mais de um campo
UPDATE alunosTemp
SET sexo = LOWER(sexo),
	nome = UPPER(nome)
WHERE id_aluno BETWEEN 1 AND 4;

UPDATE alunosTemp 
SET sexo = UPPER(sexo), nome = LOWER(nome)
WHERE id_aluno BETWEEN 1 AND 4;