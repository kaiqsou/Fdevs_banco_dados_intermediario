-- Fun��es de Texto

-- ASCII: retorna o valor do que estiver dentro, de acordo com a tabela ASCII
SELECT ASCII('a');
SELECT ASCII('A');

-- NCHAR: retorna o valor ASCII que o valor que estiver dentro representa na tabela ASCII
SELECT NCHAR(65);
SELECT NCHAR(97);

-- CHAR: converte um c�digo ASCII do tipo INT em um valor de caracter
SELECT CHAR(65);
SELECT CHAR(97);

-- CHARINDEX: pesquisa um caractere em uma sequ�ncia de at� 8000 caracteres
SELECT CHARINDEX('a', 'kaique'); -- 'a' est� na posi��o 2
SELECT CHARINDEX('a', 'kaique', 6); -- inicia a busca a partir da posi��o 6

-- CONCAT: permite concatenar/unir textos
SELECT CONCAT('Kaique', ' ', 'Onencio');
SELECT CONCAT('Kaique', ' || ', 'Onencio');

-- CONCAT_WS: permite concatenar v�rios campos com um separador espec�fico
SELECT CONCAT_WS(' ', 'Kaique', 'Onencio', 'De', 'Souza');
SELECT CONCAT_WS(' || ', 'Kaique', 'Onencio', 'De', 'Souza');

-- DIFFERENCE (escala 0 a 4): consegue comparar e definir o n�vel de diferen�a entre strings
SELECT DIFFERENCE('Kaique', 'Kaike'); -- 4: muita similaridade
SELECT DIFFERENCE('Kaique', 'Caique'); -- 3: similares
SELECT DIFFERENCE('Kaique', 'Tatite'); -- 2: similaridade mediana
SELECT DIFFERENCE('Kaique', 'Yasmin'); -- 1: pouca similaridade
SELECT DIFFERENCE('Kaique', '&&&'); -- 0: nenhuma similaridade


