-- Desenvolver e simular um circuito LT ("menor que") de dois bits (cada operando, a e b, com dois bits)
-- empregando vetores e forneça na saída y o resultado da comparação.

library ieee;
use ieee.std_logic_1164.all;

entity two_bit_less_than is
port (
	a, b: in std_logic_vector(1 downto 0);
	s: out std_logic
);
end entity;

architecture arq of two_bit_less_than is
begin
	s <= '1' when A < B else '0';
end architecture;