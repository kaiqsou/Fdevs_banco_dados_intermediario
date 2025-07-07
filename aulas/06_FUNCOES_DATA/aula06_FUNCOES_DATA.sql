-- DATETIME: conta a data a partir de 01/01/1753, armazena at� cent�simos de segundos
-- SMALLDATETIME: conta a data a partir de 01/01/1900, armazena at� segundos

-- GETDATE: pega a data atual
SELECT GETDATE();

SELECT CONVERT(CHAR, GETDATE(), 103); -- formato dd/mm/yyyy
SELECT CONVERT(CHAR, GETDATE(), 102); -- formato aaaa.mm.dd
SELECT CONVERT(CHAR, GETDATE(), 3); -- tabela ANSI SQL

-- DAY, MONTH e YEAR: consegue pegar partes espec�ficas de uma data
SELECT DAY (GETDATE()) AS 'dia'; -- pega o DIA
SELECT MONTH (GETDATE()) AS 'm�s'; -- pega o M�S
SELECT YEAR (GETDATE()) AS 'ano'; -- pega o ANO

-- DATEPART: tamb�m � usado para pegar partes de uma data
SELECT DATEPART(DAY, GETDATE());
SELECT DATEPART(MONTH, GETDATE());
SELECT DATEPART(YEAR, GETDATE());

-- DATEADD: adiciona algo para uma data
SELECT DATEADD(YEAR, -2, GETDATE()); -- subtrai 2 anos da data indicada
SELECT DATEADD(MONTH, +3, GETDATE()); -- soma 3 meses para a data indicada
SELECT DATEADD(DAY, 15, GETDATE()); -- soma 15 dias para a data indicada
SELECT DATEADD(HOUR, 3, GETDATE()); -- soma 3 horas para a data indicada

-- DATEDIFF: verifica a diferen�a entre duas datas
SELECT DATEDIFF(YEAR, '07/02/2004', GETDATE()) AS 'anos'; -- v� a diferen�a de duas datas, por ANOS
SELECT DATEDIFF(MONTH, '07/02/2004', GETDATE()) AS 'meses'; -- v� a diferen�a de duas datas, por MESES
SELECT DATEDIFF(DAY, '07/02/2004', GETDATE()) AS 'dias'; -- v� a diferen�a de duas datas, por DIAS
SELECT DATEDIFF(HOUR, '07/02/2004', GETDATE()) AS 'horas'; -- v� a diferen�a de duas datas, por HORAS
