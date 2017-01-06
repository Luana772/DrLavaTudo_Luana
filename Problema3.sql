USE DRLAVATUDO;

/*a. Selecione todos os clientes e a quantidade de ordem de serviços*/

SELECT 
	CLIENTE.ID,
	CLIENTE.NOME,
    COUNT(ORDEM_DE_SERVICO.ID_CLIENTE) 
FROM 
	CLIENTE JOIN ORDEM_DE_SERVICO ON CLIENTE.ID = ORDEM_DE_SERVICO.ID_CLIENTE
GROUP BY 
	CLIENTE.ID;

/*b. Selecione todas as Ordens de Serviços com mais de um serviço*/

SELECT 
    ORDEM_DE_SERVICO.ID
FROM
    ORDEM_DE_SERVICO JOIN ORDEM_DE_SERVICO_SERVICOS ON ORDEM_DE_SERVICO.ID = ORDEM_DE_SERVICO_SERVICOS.ID_ORDEM_DE_SERVICO
GROUP BY 
	ORDEM_DE_SERVICO.ID
HAVING
	COUNT(ORDEM_DE_SERVICO_SERVICOS.ID_ORDEM_DE_SERVICO) > 1;


/*c. Selecione os serviços mais vendidos */

SELECT
	SERVICOS.NOME_SERVICO,
    COUNT(ORDEM_DE_SERVICO_SERVICOS.ID_SERVICOS)
FROM
	SERVICOS JOIN ORDEM_DE_SERVICO_SERVICOS ON SERVICOS.ID = ORDEM_DE_SERVICO_SERVICOS.ID_SERVICOS
GROUP BY
	SERVICOS.NOME_SERVICO
ORDER BY
	COUNT(ORDEM_DE_SERVICO_SERVICOS.ID_SERVICOS) DESC, SERVICOS.NOME_SERVICO;
    
/*d. Atualize o valor final de todos os serviços em 12%*/

UPDATE SERVICOS SET SERVICOS.VALOR_FINAL = (SERVICOS.VALOR_FINAL * 12 / 100) + SERVICOS.VALOR_FINAL;

/*e. Remova a ultima ordem de serviço criada */

DELETE FROM ORDEM_DE_SERVICO ORDER BY ORDEM_DE_SERVICO.ID DESC LIMIT 1;

/*f. Insira um cliente */

INSERT INTO `drlavatudo`.`cliente` (`ID`, `NOME`, `EMAIL`, `DATA_DE_NASCIMENTO`, `TELEFONE_CELULAR`, `TELEFONE_RESIDENCIAL`) VALUES ('5', 'FRANCO', 'FRANCO@GMAIL.COM', '1994-05-02', '(31) 99475-1248', '(31) 3587-9894');