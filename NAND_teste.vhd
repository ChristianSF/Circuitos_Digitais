--Entidade

entity NAND_teste is 
port(
	a, b		: in	bit;
	y			: out bit);
end entity;


--Arquitetura

architecture comportamento of NAND_teste is 
begin
	y <= a nand b;
end architecture;