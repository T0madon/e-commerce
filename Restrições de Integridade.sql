ALTER TABLE Pessoa
ADD CONSTRAINT unique_email UNIQUE(Email);

ALTER TABLE Cliente
ADD CONSTRAINT unique_cpf UNIQUE(CPF),
ADD CONSTRAINT maior_de_idade CHECK(Idade>18);

ALTER TABLE Vendedor
ADD CONSTRAINT unique_cnpj UNIQUE(CNPJ);

ALTER TABLE Area_de_Venda
ADD CONSTRAINT unique_nome_area UNIQUE(Nome);

ALTER TABLE Estado
ADD CONSTRAINT unique_nome_estado UNIQUE(Nome);

ALTER TABLE Produto_do_Vendedor
ADD CONSTRAINT preco_maior_que_zero CHECK(Valor>0);

ALTER TABLE Venda_Unica
ADD CONSTRAINT quant_maior_que_zero CHECK(Quantidade>0);
