-- Funções de Texto

-- ASCII: retorna o valor do que estiver dentro, de acordo com a tabela ASCII
SELECT ASCII('a');
SELECT ASCII('A');

-- NCHAR: retorna o valor ASCII que o valor que estiver dentro representa na tabela ASCII
SELECT NCHAR(65);
SELECT NCHAR(97);

-- CHAR: converte um código ASCII do tipo INT em um valor de caracter
SELECT CHAR(65);
SELECT CHAR(97);

-- CHARINDEX: pesquisa um caractere em uma sequência de até 8000 caracteres
SELECT CHARINDEX('a', 'kaique'); -- 'a' está na posição 2
SELECT CHARINDEX('a', 'kaique', 6); -- inicia a busca a partir da posição 6

-- CONCAT: permite concatenar/unir textos
SELECT CONCAT('Kaique', ' ', 'Onencio');
SELECT CONCAT('Kaique', ' || ', 'Onencio');

-- CONCAT_WS: permite concatenar vários campos com um separador específico
SELECT CONCAT_WS(' ', 'Kaique', 'Onencio', 'De', 'Souza');
SELECT CONCAT_WS(' || ', 'Kaique', 'Onencio', 'De', 'Souza');

-- DIFFERENCE (escala 0 a 4): consegue comparar e definir o nível de diferença entre strings
SELECT DIFFERENCE('Kaique', 'Kaike'); -- 4: muita similaridade
SELECT DIFFERENCE('Kaique', 'Caique'); -- 3: similares
SELECT DIFFERENCE('Kaique', 'Tatite'); -- 2: similaridade mediana
SELECT DIFFERENCE('Kaique', 'Yasmin'); -- 1: pouca similaridade
SELECT DIFFERENCE('Kaique', '&&&'); -- 0: nenhuma similaridade


