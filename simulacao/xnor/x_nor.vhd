library ieee;
use ieee.std_logic_1164.all;

entity x_nor is
port(
	a, b: in std_logic;
	x: out std_logic
);
end entity;

architecture arq of x_nor is
begin
	x <= a xnor b;
end architecture;