library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity equation is
port(
	a, b: in std_logic_vector(2 downto 0);
	y: out std_logic_vector(6 downto 0)
);
end entity;

architecture arq of equation is
	signal ia, ib: integer range 0 to 7;
begin
	ia <= to_integer(unsigned(a));
	ib <= to_integer(unsigned(b));
	
	y <= std_logic_vector(to_signed(2 * ia - ib * ib, 7));
end architecture;