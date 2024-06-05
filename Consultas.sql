--Lista O nome e o valor de todos os produtos vendidos pelo Vendedor de Cod_P=2
SELECT Nome, Valor
FROM View_Produtos_Vendedor
WHERE Cod_P=2;


--Lista todos os produto comprados pelo cliente de código 3 que o valor supera 500
SELECT Nome, Quantidade
FROM View_Produtos_Comprados_Cliente
WHERE Cod_P=3 AND Valor>500;


--Lista o nome e a idade de todos os cliente de Uvaranas
SELECT p.Nome, c.Idade
FROM Pessoa p, Cliente c, Bairro b
WHERE p.Cod_P=c.Cod_P AND b.Cod_B=p.Cod_B AND b.Nome="Uvaranas";

--Lista o nome e o valor de todos os produtos que estão a venda pro menos de 200
SELECT p.Nome, pv.Valor
FROM Produto_do_Vendedor pv, Produto p
WHERE pv.Cod_Prod=p.Cod_Prod AND pv.Valor<200 AND pv.Quantidade>0
