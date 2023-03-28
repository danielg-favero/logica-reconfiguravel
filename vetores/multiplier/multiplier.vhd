-- Desenvolver e simular um circuito multiplicador de dois bits empregando vetores. 
-- O circuito deverá fornecer como saída um único vetor y, 
-- que corresponda ao valor do produto entre os operandos a e b.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
port(
	a, b: in std_logic_vector(1 downto 0);
	y: out std_logic_vector(3 downto 0)
);
end entity;

architecture arq of multiplier is
	signal ia, ib: integer range 0 to 3;
begin
	ia <= to_integer(unsigned(a));
	ib <= to_integer(unsigned(b));
	
	y <= std_logic_vector(to_unsigned(ib * ia, 4));
end architecture;