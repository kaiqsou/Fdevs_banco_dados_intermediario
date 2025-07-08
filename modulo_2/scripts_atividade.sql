USE loja
GO

-- Criando as tabelas necessárias
CREATE TABLE produto_categoria
(
	id_categoria INT NOT NULL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
)

CREATE TABLE produto_estoque
(
	produto_id INT NOT NULL PRIMARY KEY,
	quantidade INT NOT NULL,

	FOREIGN KEY (produto_id) REFERENCES produto(id_produto)
)

-- Alterando a tabela PRODUTO (para adicionar a FK)
ALTER TABLE produto
ADD categoria_id INT;

-- CONSTRAINT para a FK de categoria 
ALTER TABLE produto
ADD CONSTRAINT FK_Produto_ProdutoCategoria 
FOREIGN KEY (categoria_id) REFERENCES produto_categoria(id_categoria);

-- Adicionando CATEGORIAS
INSERT INTO produto_categoria(id_categoria, nome) VALUES(1, 'Tecnologia');
INSERT INTO produto_categoria(id_categoria, nome) VALUES(2, 'Alimento');
INSERT INTO produto_categoria(id_categoria, nome) VALUES(3, 'Roupas');
INSERT INTO produto_categoria(id_categoria, nome) VALUES(4, 'Acessórios');

-- Adicionando ESTOQUES
INSERT INTO produto_estoque(produto_id, quantidade) VALUES(1, 3);
INSERT INTO produto_estoque(produto_id, quantidade) VALUES(2, 7);
INSERT INTO produto_estoque(produto_id, quantidade) VALUES(3, 12);
INSERT INTO produto_estoque(produto_id, quantidade) VALUES(4, 1);
INSERT INTO produto_estoque(produto_id, quantidade) VALUES(5, 15);
INSERT INTO produto_estoque(produto_id, quantidade) VALUES(6, 3);

-- Atualizando as categorias dos PRODUTOS
SELECT * FROM produto;

UPDATE produto 
SET categoria_id = 1
WHERE id_produto IN (1, 3, 6);

UPDATE produto
SET categoria_id = 2
WHERE id_produto IN (2, 5);

UPDATE produto 
SET categoria_id = 4
WHERE id_produto = 4;

-- 1. Escreva uma consulta SQL para recuperar informações sobre produtos e suas categorias. Inclua o nome
-- do produto, a categoria e a quantidade em estoque.
SELECT
	p.nome AS 'nome_produto',
	c.nome AS 'categoria',
	e.quantidade AS 'quantidade'
FROM produto p
INNER JOIN produto_categoria c ON c.id_categoria = p.categoria_id
INNER JOIN produto_estoque e ON e.produto_id = p.id_produto
ORDER BY 1;

-- 2. Escreva uma instrução SQL para excluir todos os produtos da categoria 'Roupas' da tabela PRODUTO.
INSERT INTO produto(id_produto, nome, valor_custo, valor_venda, categoria_id)
VALUES(7, 'Moletom', 60, 150, 3);

INSERT INTO produto(id_produto, nome, valor_custo, valor_venda, categoria_id)
VALUES(8, 'Cachecol', 50, 100, 3);

SELECT * FROM produto;

DELETE FROM produto 
WHERE categoria_id = 3;

-- 3. Escreva uma consulta SQL para recuperar uma lista única de nomes completos de CLIENTES, onde o nome é
-- concatenado com base no título, primeiro nome, meio inicial e último nome. Adicione uma coluna adicional
-- chamada 'NomeCompleto' e utilize a função CASE para lidar com valores nulos
CREATE TABLE clientes
(
	id_cliente INT NOT NULL PRIMARY KEY,
	titulo VARCHAR(150),
	primeiro_nome VARCHAR(100),
	nome_meio VARCHAR(100),
	ultimo_nome VARCHAR(100)
);

INSERT INTO clientes(id_cliente, titulo, primeiro_nome, nome_meio, ultimo_nome)
VALUES(1, 'Veríssimo', 'Kaique', 'Onencio', 'de Souza'); 

INSERT INTO clientes(id_cliente, titulo, primeiro_nome, nome_meio, ultimo_nome)
VALUES(2, 'Majestade', 'Marina', NULL, 'Frankin'); 

INSERT INTO clientes(id_cliente, titulo, primeiro_nome, nome_meio, ultimo_nome)
VALUES(3, NULL, 'Bernardo', NULL, NULL); 

INSERT INTO clientes(id_cliente, titulo, primeiro_nome, nome_meio, ultimo_nome)
VALUES(4, NULL, NULL, NULL, 'Oczkowski'); 

SELECT * FROM clientes;

SELECT 
	id_cliente,

	CASE
		WHEN titulo IS NOT NULL THEN titulo
		ELSE 'Vazio'
	END AS 'titulo',

	CASE
		WHEN primeiro_nome IS NOT NULL THEN primeiro_nome
		ELSE 'Vazio'
	END AS 'primeiro_nome',

	CASE
		WHEN nome_meio IS NOT NULL THEN nome_meio
		ELSE 'Vazio'
	END AS 'nome_meio',

	CASE
		WHEN ultimo_nome IS NOT NULL THEN ultimo_nome
		ELSE 'Vazio'
	END AS 'ultimo_nome',

	LTRIM(RTRIM(CONCAT_WS(' ', titulo, primeiro_nome, nome_meio, ultimo_nome))) AS 'nome_completo'
FROM clientes;

	