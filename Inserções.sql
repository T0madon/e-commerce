--Inserção de um novo cliente
INSERT INTO Pessoa(Cod_P, Endereço, Nome)
VALUES(1, "Av. Dr. Vicente Machado, 429", "João da Silva");
INSERT INTO Cliente(Cod_P, CPF, Idade)
VALUES(1, "845.681.020-11", 27);


--Inserção de uma área de venda
INSERT INTO Area_de_Venda(Cod_A, Nome, Descrição)
VALUES(1, "Eletrônicos", "Produtos eletrônicos e eltrodomésticos de uso geral");

--Inserção de Cidades
INSERT INTO Cidade(Cod_C, Nome, UF)
VALUES(1, "Ponta Grossa", "PR");
INSERT INTO Cidade(Cod_C, Nome, UF)
VALUES(2, "Rio de Janeiro", "RJ");


--Inserção de uma venda
INSERT INTO Venda(Nota, Data, Valor_Total, Quantidade_Total_de_Itens, Cod_P)
VALUES(21562, "02/06/2024", 377.55, 39, 1)
