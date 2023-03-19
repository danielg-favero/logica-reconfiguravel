library ieee;
use ieee.std_logic_1164.all;

entity tb_two_bit_grather_than is
end entity;

architecture arq of tb_two_bit_grather_than is
signal ta1, ta2, tb1, tb2, tx, ty, tz: std_logic;
begin
	uut: entity work.two_bit_grather_than(arq)
	
	port map (ta1, ta2, tb1, tb2, tx, ty, tz);
	
	process begin
		ta1 <= '0'; ta2 <= '0'; tb1 <= '0'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '0'; tb1 <= '0'; tb2 <= '1'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '0'; tb1 <= '1'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '0'; tb1 <= '1'; tb2 <= '1'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '1'; tb1 <= '0'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '1'; tb1 <= '0'; tb2 <= '1'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '1'; tb1 <= '1'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '1'; tb1 <= '1'; tb2 <= '1'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '0'; tb1 <= '0'; tb2 <= '1'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '0'; tb1 <= '0'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '0'; tb1 <= '1'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '0'; tb1 <= '1'; tb2 <= '1'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '1'; tb1 <= '0'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '1'; tb1 <= '0'; tb2 <= '1'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '1'; tb1 <= '1'; tb2 <= '0'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '1'; tb1 <= '1'; tb2 <= '1'; wait for 10 ns;
	end process;
end architecture;