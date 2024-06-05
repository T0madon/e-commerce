--Trigger para não permitir comprar mais itens que o disponível no estoque
DELIMITER //

CREATE TRIGGER quant_limitada BEFORE INSERT ON Venda_Unica
FOR EACH ROW
BEGIN
    IF NEW.Quantidade > (SELECT Quantidade FROM Produto_do_Vendedor WHERE Cod_P = NEW.Cod_P AND Cod_Prod = NEW.Cod_Prod)
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Quantidade Selecionada Maior que a disponível";
    END IF;
END;
//
DELIMITER ;

--Trigger para setar o valor de Venda_Unica para a quantidade de itens vezes o preço desse item
DELIMITER //

CREATE TRIGGER set_valor BEFORE INSERT ON Venda_Unica
BEGIN
	FOR EACH ROW
	SET NEW.Valor = NEW.Quantidade*(SELECT Valor FROM Produto_do_Vendedor WHERE cod_P=NEW.cod_P AND cod_Prod=NEW.cod_Prod)
END;
//
DELIMITER ;


--Trigger para setar o valor total de Venda para a soma dos valores de todas as vendas unicas
--após inserção
DELIMITER //

CREATE TRIGGER insert_venda_unica_valor_total AFTER INSERT ON Venda_Unica
FOR EACH ROW
BEGIN
    UPDATE Venda v
    SET v.Valor_Total = v.Valor_Total+NEW.Valor
    WHERE v.Nota = NEW.Nota;
END;
//
DELIMITER ;


--Trigger para setar o valor total de Venda para a soma dos valores de todas as vendas unicas
--após remoção
DELIMITER //

CREATE TRIGGER delete_venda_unica_valor_total AFTER DELETE ON Venda_Unica
FOR EACH ROW
BEGIN
    UPDATE Venda v
    SET v.Valor_Total = v.Valor_Total-NEW.Valor
    WHERE v.Nota = NEW.Nota;
END;
//
DELIMITER ;

--Trigger para atualizar o estoque de Produto_do_Vendedor após inserção em venda única
DELIMITER //

CREATE TRIGGER atualiza_prod_vendedor AFTER INSERT ON Venda_Unica
FOR EACH ROW
BEGIN
    UPDATE Produto_do_Vendedor
    SET Quantidade = Quantidade - NEW.Quantidade
    WHERE Cod_P = NEW.Cod_P AND Cod_Prod = NEW.Cod_Prod;
END;
//
DELIMITER ;

--Trigger para checar se o CPF de Cliente é válido
DELIMITER //

CREATE TRIGGER checar_CPF BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    DECLARE valido BOOLEAN;
    DECLARE cpf CHAR(11);
    DECLARE i, sum1, sum2, digit1, digit2, resto1, resto2 INT;
    
    SET valido = TRUE;
    SET cpf = NEW.CPF;

    IF LENGTH(cpf) != 11 THEN
        SET valido = FALSE;
    END IF;

    IF valido AND cpf IN ('00000000000', '11111111111', '22222222222', '33333333333', '44444444444', '55555555555', '66666666666', '77777777777', '88888888888', '99999999999') THEN
        SET valido = FALSE;
    END IF;

    IF valido THEN
        SET sum1 = 0;
        FOR i IN 1..9 DO
            SET sum1 = sum1 + (CAST(SUBSTRING(cpf, i, 1) AS UNSIGNED) * (11 - i));
        END FOR;
        
        SET resto1 = sum1 % 11;
        IF resto1 < 2 THEN
            SET digit1 = 0;
        ELSE
            SET digit1 = 11 - resto1;
        END IF;

        SET sum2 = 0;
        FOR i IN 1..10 DO
            SET sum2 = sum2 + (CAST(SUBSTRING(cpf, i, 1) AS UNSIGNED) * (12 - i));
        END FOR;
        
        SET resto2 = sum2 % 11;
        IF resto2 < 2 THEN
            SET digit2 = 0;
        ELSE
            SET digit2 = 11 - resto2;
        END IF;

        IF digit1 != CAST(SUBSTRING(cpf, 10, 1) AS UNSIGNED) OR digit2 != CAST(SUBSTRING(cpf, 11, 1) AS UNSIGNED) THEN
            SET valido = FALSE;
        END IF;
    END IF;

    IF NOT valido THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CPF inválido';
    END IF;
END;
//
DELIMITER ;

