library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is
generic(N: integer := 4);
port(
	i0, i1: in std_logic_vector(N downto 0);
	s: in std_logic;
	y: out std_logic_vector(N downto 0)
);
end entity;

architecture arq of multiplexer is
begin
	y <= i0 when s = '1' else i1;
end architecture;