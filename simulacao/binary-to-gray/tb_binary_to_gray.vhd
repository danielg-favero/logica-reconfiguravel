library ieee;
use ieee.std_logic_1164.all;

entity tb_binary_to_gray is
end entity;

architecture arq of tb_binary_to_gray is
signal ta1, ta2, ta3, tx, ty, tz: std_logic;
begin
	uut: entity work.binary_to_gray(arq)
	
	port map(ta1, ta2, ta3, tx, ty, tz);
	
	process begin
		ta1 <= '0'; ta2 <= '0'; ta3 <= '0'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '0'; ta3 <= '1'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '1'; ta3 <= '0'; wait for 10 ns;
		ta1 <= '0'; ta2 <= '1'; ta3 <= '1'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '0'; ta3 <= '0'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '0'; ta3 <= '1'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '1'; ta3 <= '0'; wait for 10 ns;
		ta1 <= '1'; ta2 <= '1'; ta3 <= '1'; wait for 10 ns;
	end process;
end architecture;