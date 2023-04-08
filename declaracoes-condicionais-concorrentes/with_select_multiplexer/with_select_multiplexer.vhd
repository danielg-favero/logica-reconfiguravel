library ieee;
use ieee.std_logic_1164.all;

entity with_select_multiplexer is
port(
	a: in std_logic_vector(1 downto 0);
	i: in std_logic_Vector(3 downto 0);
	y: out std_logic
);
end entity;

architecture arq of with_select_multiplexer is
begin
	with a select
		y <= i(0) when "00",
			  i(1) when "01",
			  i(2) when "10",
			  i(3) when "11",
			  '0' when others;
end architecture;