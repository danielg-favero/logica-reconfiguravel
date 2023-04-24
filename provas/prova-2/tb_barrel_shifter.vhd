library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_barrel_shifter is
generic (N: integer := 6);
end entity;

architecture arq of tb_barrel_shifter is
	signal tx, ty: std_logic_vector((N - 1) downto 0);
begin
	uut: entity work.barrel_shifter(arq)
	generic map(N)
	port map(tx, ty);
	
	process
		variable i: integer range 0 to 2 ** N - 1;
	begin
		for i in 0 to 2 ** N - 1 loop
			tx <= std_logic_vector(to_unsigned(i, N));
			wait for 10 ns;
		end loop;
	end process;
end architecture;