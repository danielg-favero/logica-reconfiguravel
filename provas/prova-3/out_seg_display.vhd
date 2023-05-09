library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity out_seg_display is
generic(N: integer := 4);
port(
    x: in std_logic_vector(N downto 0);
	 op: in std_logic;
	 s1: out std_logic_vector(0 to 6);
	 s2: out std_logic_vector(0 to 6)
);
end entity;

architecture arq of out_seg_display is
	signal ZERO, MINUS, ONE: std_logic_vector(0 to 6);
begin
	ZERO <= not("1111110");
	ONE <= not("0110000");
	MINUS <= not("0000001");

	s1 <= ZERO when (to_integer(unsigned(x)) <= 9 and to_integer(unsigned(x)) >= 0 and op = '1') else
			ONE when to_integer(unsigned(x)) > 9 and op = '1' else
			ZERO when to_integer(signed(x)) <= 9 and to_integer(signed(x)) >= 0 else
			MINUS;

					
s2 <= not("1111110") when (to_integer(unsigned(x)) = 0 or to_integer(unsigned(x)) = 10) and op='1' else
		not("0110000") when (to_integer(unsigned(x)) = 1 or to_integer(unsigned(x)) = 11) and op='1' else
		not("1101101") when (to_integer(unsigned(x)) = 2 or to_integer(unsigned(x)) = 12) and op='1' else
		not("1111001") when (to_integer(unsigned(x)) = 3 or to_integer(unsigned(x)) = 13) and op='1' else
		not("0110011") when (to_integer(unsigned(x)) = 4 or to_integer(unsigned(x)) = 14) and op='1' else
		not("1011011") when to_integer(unsigned(x)) = 5 and op='1' else
		not("1011111") when to_integer(unsigned(x)) = 6 and op='1' else
		not("1110000") when to_integer(unsigned(x)) = 7 and op='1' else
		not("1111111") when to_integer(unsigned(x)) = 8 and op='1' else
		not("1111011") when to_integer(unsigned(x)) = 9 and op='1' else
		not("1111110") when to_integer(signed(x)) = 0  else
		not("0110000") when to_integer(signed(x)) = -1   else
		not("1101101") when to_integer(signed(x)) = -2   else
		not("1111001") when to_integer(signed(x)) = -3   else
		not("0110011") when to_integer(signed(x)) = -4   else
		not("1011011") when to_integer(signed(x)) = -5  else
		not("1011111") when to_integer(signed(x)) = -6  else
		not("1110000") when to_integer(signed(x)) = -7  else
		not("0110000") when to_integer(signed(x)) = 1   else
		not("1101101") when to_integer(signed(x)) = 2   else
		not("1111001") when to_integer(signed(x)) = 3   else
		not("0110011") when to_integer(signed(x)) = 4   else
		not("1011011") when to_integer(signed(x)) = 5  else
		not("1011111") when to_integer(signed(x)) = 6  else
		not("1110000") when to_integer(signed(x)) = 7  else
		not("0000001");
end architecture;