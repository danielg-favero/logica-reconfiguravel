library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg_disp is 
port(
	n: in integer range 0 to 9;
	disp: out std_logic_vector(0 to 6)
);
end entity;

architecture arq of seven_seg_disp is 
begin
	disp <= not("1111110") when n = 0 else
			  not("0110000") when n = 1 else
			  not("1101101") when n = 2 else
			  not("1111001") when n = 3 else
			  not("0110011") when n = 4 else
			  not("1011011") when n = 5 else
			  not("0011111") when n = 6 else
			  not("1110000") when n = 7 else
			  not("1111111") when n = 8 else
			  not("1110011");
end architecture;