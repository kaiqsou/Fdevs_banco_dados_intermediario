-- SEQUENCES: usado para criar sequências de valores automaticamente

-- criação e remoção de SEQUENCES
CREATE SEQUENCE seq_teste_1 AS NUMERIC START WITH 1 INCREMENT BY 1; -- inicia em 1 e aumenta +1 a cada select
SELECT NEXT VALUE FOR seq_teste_1;

CREATE SEQUENCE seq_teste_2 AS NUMERIC START WITH 100 INCREMENT BY -1; -- inicia em 100 e diminui -1 a cada select
SELECT NEXT VALUE FOR seq_teste_2;

DROP SEQUENCE seq_teste_1; -- exclui uma SEQUENCE
DROP SEQUENCE seq_teste_2;

-- valores MÍNIMOS e MÁXIMOS
CREATE SEQUENCE seq_teste_1 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1 
MAXVALUE 100

SELECT NEXT VALUE FOR seq_teste_1;

-- CYCLE: quando checar no máximo (100), volta pro início (1)
CREATE SEQUENCE seq_teste_2 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1 
MAXVALUE 100
CYCLE
CACHE 3 -- melhora a pesquisa, pois salva os próximos 3 valores da sequence

SELECT NEXT VALUE FOR seq_teste_2;

-- NO CYCLE: quando chegar no máximo (100), não há mais incrementação
CREATE SEQUENCE seq_teste_3 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1 
MAXVALUE 100
NO CYCLE
NO CACHE -- é o padrão

SELECT NEXT VALUE FOR seq_teste_3;

-- ALTER SEQUENCE: modifica uma SEQUENCE
ALTER SEQUENCE seq_teste_2
RESTART WITH 100 -- recomeça a contagem a partir de 100
MAXVALUE 1000
NO CACHE;

SELECT NEXT VALUE FOR seq_teste_2;

-- consultar uma sequence
SELECT * FROM SYS.SEQUENCES WHERE name = 'seq_teste_1';

-- teste para ALUNOS
DECLARE @idaluno INT;
SET @idaluno = NEXT VALUE FOR seq_teste_2
SELECT @idaluno;

