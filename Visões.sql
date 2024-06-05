--Todos os produtos de um vendedor
CREATE VIEW View_Produtos_Vendedor AS
SELECT pv.Valor, pv.Quantidade, p.Nome, p.Descrição, v.Cod_P
FROM Produto_do_Vendedor pv, Produto p, Vendedor v
WHERE pv.Cod_Prod = p.Cod_Prod AND v.Cod_P=pv.Cod_P;

--Todos os produtos comprado pro um cliente
CREATE VIEW View_Produtos_Comprados_Cliente AS
SELECT vu.Quantidade, p.Nome, p.Descrição, pv.Valor, c.Cod_P
FROM Venda_Unica vu, Produto p, Produto_do_Vendedor pv, Venda v, Cliente c
WHERE vu.Nota=v.Nota AND vu.Cod_P=pv.Cod_P AND vu.Cod_Prod=pv.Cod_Prod AND pv.Cod_Prod=p.Cod_Prod AND c.Cod_P=v.Cod_P;

--Todos os produtos disponíveis em uma área de venda
CREATE VIEW View_Produtos_por_Area_de_Venda AS
SELECT p.Nome, p.Descrição
FROM Produto p, Area_de_Venda av
WHERE p.Cod_A=av.Cod_A;

--Todos os vendedores de uma área de venda
CREATE VIEW View_Vendedores_por_Area_de_Venda AS
SELECT p.Nome, p.Endereço, p.Email, p.Nome, v.CNPJ
FROM Pessoa p, Area_de_Venda av, Vendedor v
WHERE v.Cod_A=av.Cod_A AND v.Cod_P=p.Cod_P;
