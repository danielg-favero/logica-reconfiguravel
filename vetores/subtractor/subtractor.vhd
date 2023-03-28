-- Desenvolver e simular um circuito subtrator de três bits empregando vetores.
-- O circuito deverá fornecer como saída um único vetor y, que corresponda ao valor da subtração entre os operandos a e b,
-- sejam os resultados positivos ou negativos. Pontos a considerar: 
-- 1) VHDL opera com a notação “complemento de dois”; 
-- 2) o tipo de dado necessário ao fornecimento de valores negativos deve ser signed (ao invés de unsigned); 
-- 3) os operandos de entrada a e b são positivos, ou seja, não há a necessidade de operações, por exemplo, como 2 - (-3) = 5.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor is
port(
	a, b: in std_logic_vector(2 downto 0);
	y: out std_logic_vector(3 downto 0)
);	
end entity;

architecture arq of subtractor is
	signal ia, ib: integer range 0 to 7;
begin
	ia <= to_integer(unsigned(a));
	ib <= to_integer(unsigned(b));
	
	y <= std_logic_vector(to_signed(ia - ib, 4));
end architecture;