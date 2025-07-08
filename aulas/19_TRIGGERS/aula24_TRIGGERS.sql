-- GATILHOS (Triggers)

CREATE TABLE saldos
(
	produto VARCHAR(10),
	saldo_inicial NUMERIC(10),
	saldo_final NUMERIC(10),
	data_ult_mov DATETIME
);

SELECT * FROM SALDOS;

INSERT INTO saldos(produto, saldo_inicial, saldo_final, data_ult_mov)
VALUES('Produto A', 0, 100, GETDATE());

-- registrar movimenta��o de sa�da dos produtos
CREATE TABLE vendas
(
	id_vendas INT, 
	produto VARCHAR(10),
	quantidade INT,
	data_venda DATETIME
);

CREATE SEQUENCE seq_vendas AS NUMERIC
START WITH 1
INCREMENT BY 1;

CREATE TABLE historico_vendas
(
	produto VARCHAR(10),
	quantidade INT,
	data_venda DATETIME
);

-- Trigger: toda vez que fizer uma venda (na tabela de vendas), altera a tabela de SALDO
CREATE TRIGGER trg_ajustaSaldo
ON vendas -- � aqui que as a��es ser�o feitas para ativar o trigger
FOR INSERT AS -- sempre que houver um INSERT, � ativado
BEGIN
	DECLARE @quantidade INT,
			@data_venda DATETIME,
			@produto VARCHAR(10)

	SELECT @data_venda = data_venda, 
		   @quantidade = quantidade,
		   @produto = produto
	FROM INSERTED -- alimenta as vari�veis com os dados enviados no INSERT

	UPDATE saldos SET saldo_final = saldo_final - @quantidade, -- atualiza a tabela saldos com as vari�veis
					  data_ult_mov = @data_venda
	WHERE produto = @produto;

	INSERT INTO historico_vendas(produto, quantidade, data_venda) -- envia os dados para o historico_vendas
	VALUES (@produto, @quantidade, @data_venda);
END

-- testando o INSERT na tabela de vendas para ativar o TRIGGER
SELECT * FROM saldos;
SELECT * FROM vendas;
SELECT * FROM historico_vendas;

INSERT INTO vendas(id_vendas, produto, quantidade, data_venda)
VALUES(NEXT VALUE FOR seq_vendas, 'Produto A', 2, GETDATE());