library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
generic(N: integer := 4);
port(
    a, b: in std_logic_vector((N - 1) downto 0);
	 y: out std_logic_vector(N downto 0)
);
end entity;

architecture arq of adder is
	signal ta, tb: integer range 0 to 2 ** n - 1;
begin
	ta <= to_integer(unsigned(a));
	tb <= to_integer(unsigned(b));
	
	y <= std_logic_vector(to_unsigned(ta + tb, N + 1));
end architecture;