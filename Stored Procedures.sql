
--Inserir novo cliente
DELIMITER //
CREATE PROCEDURE novo_cliente(
IN Nome VARCHAR(255),
IN CPF VARCHAR(11),
IN Idade INT,
IN Email VARCHAR(255),
IN Endereço VARCHAR(255),
IN Cod_P INT
)
BEGIN
INSERT INTO Pessoa (Cod_P, Nome, Email, Endereço)
VALUES (Cod_P, Nome, Email, Endereço);
INSERT INTO Cliente (Cod_P, Idade, CPF)
VALUES (Cod_P, Idade, CPF);

END //
DELIMITER ;


--Inserir novo vendedor
DELIMITER //
CREATE PROCEDURE novo_vendedor(
IN Nome VARCHAR(255),
IN CNPJ VARCHAR(11),
IN Cod_A INT,
IN Email VARCHAR(255),
IN Endereço VARCHAR(255),
IN Cod_P INT
)
BEGIN
INSERT INTO Pessoa (Cod_P, Nome, Email, Endereço)
VALUES (Cod_P, Nome, Email, Endereço);
INSERT INTO Vendedor (Cod_P, CNPJ, Cod_A)
VALUES (Cod_P, CNPJ, Cod_A);

END //
DELIMITER ;
