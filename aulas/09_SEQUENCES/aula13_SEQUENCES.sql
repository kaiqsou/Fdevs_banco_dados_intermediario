-- SEQUENCES: usado para criar sequ�ncias de valores automaticamente

-- cria��o e remo��o de SEQUENCES
CREATE SEQUENCE seq_teste_1 AS NUMERIC START WITH 1 INCREMENT BY 1; -- inicia em 1 e aumenta +1 a cada select
SELECT NEXT VALUE FOR seq_teste_1;

CREATE SEQUENCE seq_teste_2 AS NUMERIC START WITH 100 INCREMENT BY -1; -- inicia em 100 e diminui -1 a cada select
SELECT NEXT VALUE FOR seq_teste_2;

DROP SEQUENCE seq_teste_1; -- exclui uma SEQUENCE
DROP SEQUENCE seq_teste_2;

-- valores M�NIMOS e M�XIMOS
CREATE SEQUENCE seq_teste_1 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1 
MAXVALUE 100

SELECT NEXT VALUE FOR seq_teste_1;

-- CYCLE: quando checar no m�ximo (100), volta pro in�cio (1)
CREATE SEQUENCE seq_teste_2 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1 
MAXVALUE 100
CYCLE
CACHE 3 -- melhora a pesquisa, pois salva os pr�ximos 3 valores da sequence

SELECT NEXT VALUE FOR seq_teste_2;

-- NO CYCLE: quando chegar no m�ximo (100), n�o h� mais incrementa��o
CREATE SEQUENCE seq_teste_3 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1 
MAXVALUE 100
NO CYCLE
NO CACHE -- � o padr�o

SELECT NEXT VALUE FOR seq_teste_3;

-- ALTER SEQUENCE: modifica uma SEQUENCE
ALTER SEQUENCE seq_teste_2
RESTART WITH 100 -- recome�a a contagem a partir de 100
MAXVALUE 1000
NO CACHE;

SELECT NEXT VALUE FOR seq_teste_2;

-- consultar uma sequence
SELECT * FROM SYS.SEQUENCES WHERE name = 'seq_teste_1';

-- teste para ALUNOS
DECLARE @idaluno INT;
SET @idaluno = NEXT VALUE FOR seq_teste_2
SELECT @idaluno;

