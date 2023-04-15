library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_adder is
generic(
	n: integer := 2
);
port (
	a, b: in std_logic_vector((n - 1) downto 0);
	y: out std_logic_vector(n downto 0)
); 
end entity;

architecture arq of generic_adder is
	signal ta, tb: integer range 0 to 2 ** n - 1;
begin
	ta <= to_integer(unsigned(a));
	tb <= to_integer(unsigned(b));
	
	y <= std_logic_vector(to_unsigned(ta + tb, n + 1));
end architecture;