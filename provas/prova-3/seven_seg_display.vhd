library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg_display is
generic(N: integer := 4);
port(
    x: in std_logic_vector((N - 1) downto 0);
	 y: out std_logic_vector(0 to 6)
);
end entity;

architecture arq of seven_seg_display is
begin
	y <= 	not("1111110") when to_integer(unsigned(x)) = 0 else
			not("0110000") when to_integer(unsigned(x)) = 1 else
			not("1101101") when to_integer(unsigned(x)) = 2 else
			not("1111001") when to_integer(unsigned(x)) = 3 else
			not("0110011") when to_integer(unsigned(x)) = 4 else
			not("1011011") when to_integer(unsigned(x)) = 5 else
			not("1011111") when to_integer(unsigned(x)) = 6 else
			not("1110000") when to_integer(unsigned(x)) = 7 else
			not("1111111") when to_integer(unsigned(x)) = 8 else
			not("1111011") when to_integer(unsigned(x)) = 9 else
			not("1110111") when to_integer(unsigned(x)) = 10 else
			not("0011111") when to_integer(unsigned(x)) = 11 else
			not("1001110") when to_integer(unsigned(x)) = 12 else
			not("0111101") when to_integer(unsigned(x)) = 13 else
			not("1001111") when to_integer(unsigned(x)) = 14 else
			not("1000111") when to_integer(unsigned(x)) = 15 else
			not("0000001");
end architecture;